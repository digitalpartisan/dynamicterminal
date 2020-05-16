Scriptname DynamicTerminal:Paginator extends DynamicTerminal:Basic Conditional
{Extend this script with the specific behavior desired for activating the forms referred to in the list used to populate the terminal}

Int Property iFullPageSize = 12 Auto Const
{The default value is based on the number of lines displayed in the game's terminals.  Lower this when attaching this script to an object in order to make room for body text as needed for a specific terminal.  Do not set it to any value less than three or else the pagination will not function.}
Bool Property bRedrawAfterActivation = false Auto Const
{Whether or not to automatically redraw the terminal after an item is activated.  Useful when the activation behavior may cause the contents of the terminal to change.}
String Property OverrideTokenPrefix = "" Auto Const

String sDefaultTokenPrefix = "Item" Const

String sUserActionInitialization = "initialization" Const
String sUserActionForward = "navigate forward" Const
String sUserActionBackward = "navigate backward" Const
String sUserActionActivation = "item activation" Const

String sStateEventUpdatePage = "update page variables" Const
String sStateEventDraw = "draw event" Const
String sStateEventPaginate = "paginate event" Const

DynamicTerminal:ListWrapper myData ; the list used to populate the terminal pages

Bool bHasData = false Conditional ; Is there at least one item in the list
Int iListSize = 0 Conditional ; Total number of items in the list

Bool bShowPrevious = false Conditional ; should the terminal display the previous page option
Bool bShowNext = false Conditional ; should the terminal display the next page option

Int iNoNavPageSize = 0 Conditional ; the most items this page could display taking into accout iFullPageSize and the need for navigation (that is, the number of 
Int iOneNavPageSize = 0 Conditional ; the most items on a page with a single navigation item (that is, how many items at most could be on the first or last page of a multi-page list)
Int iTwoNavPageSize = 0 Conditional ; the most items on a page with two navigation items (that is, a page in a multi-page list which is neither the first nor the last)

Int iCurrentPage = 0 Conditional ; number of the page being displayed, defaults to 0 when no data available, starts at 1 normally
Int iPageItems = 0 Conditional ; number of items to display on the current page, no larger than iMaxPageItems
Int iPageOffset = 0 Conditional ; number of items in the list which are displayed on pages before the current page

DynamicTerminal:PaginationProxy myProxy = None ; the proxy object (if any) to update when relevant behavior occurs.

DynamicTerminal:ListWrapper Function getData()
	return myData
EndFunction

Function clearProxy()
	myProxy = None
EndFunction

DynamicTerminal:PaginationProxy Function getProxy()
	return myProxy
EndFunction

Function setProxy(DynamicTerminal:PaginationProxy proxyObject)
	myProxy = proxyObject
EndFunction

Function updateProxy(String sAction = "")
{Called when an event which would cause a terminal's state to change so that if a proxy is in use, it accurately reflects the variables this paginator would present to a terminal.}
	if (myProxy != None)
		myProxy.refreshProxyVariables(sAction)
	endif
EndFunction

Int Function getPageItems()
	return iPageItems
EndFunction

Bool Function showPrevious()
	return bShowPrevious
EndFunction

Bool Function showNext()
	return bShowNext
EndFunction

Bool Function hasData()
	return bHasData
EndFunction

Int Function getCurrentPage()
	return iCurrentPage
EndFunction

Int Function getPageOffset()
	return iPageOffset
EndFunction

Int Function getNoNavPageSize()
	return iNoNavPageSize
EndFunction

Int Function getOneNavPageSize()
	return iOneNavPageSize
EndFunction

Int Function getTwoNavPageSize()
	return iTwoNavPageSize
EndFunction

Int Function getListSize()
	return iListSize
EndFunction

Form Function getItem(Int iItem)
{Easy access in child scripts to specific items in the data being paginated.  Useful to respond to calls to activate() or to aid in performTokenReplacements() implementations}
	return myData.getItem(iPageOffset + iItem)
EndFunction

Function navigate(Int iOffset, ObjectReference akTerminalRef)
{Most the current page by the amount (which may be negative) indicated by iOffset and redraws the terminal.}
	iCurrentPage += iOffset
	draw(akTerminalRef)
EndFunction

Function preBack()
{Event hook.}
EndFunction

Function postBack()
{Event hook.}
EndFunction

Function back(ObjectReference akTerminalRef)
{Navigates backward one page if possible.}
	if (!bShowPrevious)
		return ; no previous page, take no action
	endif

	preBack()
	navigate(-1, akTerminalRef)
	postBack()
	updateProxy(sUserActionBackward)
EndFunction

Function preForward()
{Event hook.}
EndFunction

Function postForward()
{Event hook.}
EndFunction

Function forward(ObjectReference akTerminalRef)
{Navigates forward one page if possible.}
	if (!bShowNext)
		return ; no next page, take no action
	endif
	
	preForward()
	navigate(1, akTerminalRef)
	postForward()
	updateProxy(sUserActionForward)
EndFunction

Function setNoDataState()
{What happens when there's no data in the list being paginated}
	iCurrentPage = 0
	iPageOffset = 0
	iPageItems = 0
	bShowPrevious = false
	bShowNext = false
	bHasData = false
EndFunction

Int Function calculatePageOffset()
	if (iCurrentPage == 1)
		return 0
	else
		return iOneNavPageSize + iTwoNavPageSize * (iCurrentPage - 2) ; minus one to ignore the current page and minus another for the first page since it's accounted for by the iOneNavPageSize addition
	endif
EndFunction

Int Function calculateHighestPageNumber()
	if (iListSize <= 0) ; trivial / bugged cases
		return 0
	elseif (iListSize <= iNoNavPageSize) ; no more than one page is needed
		return 1
	else ; more than one page is needed but this gets tricky since the modulus operator doesn't know anything about our page size requirements.  The last page has only one nav item, not two.  See details for how to figure this.
		Int iAfterFirstPage = iListSize - iOneNavPageSize
		Int iModTwoNavSize = iAfterFirstPage % iTwoNavPageSize
		Int iNumPagesAfterFirst = (iAfterFirstPage - iModTwoNavSize) / iTwoNavPageSize ; how many pages with two nav items would be needed to display the rest of the list?
		if (iModTwoNavSize <= 1) ; No items left over means last page has one fewer items than it could, not that it is full.  One item left over means last page is full and NOT that we need another page.
			return 1 + iNumPagesAfterFirst ; plus one for the first page since calculations are for pages after the first
		else ; having more than one item left over means another page is required
			return 2 + iNumPagesAfterFirst ; plus one for the first page (see the if case) and plus another for the extra page we need.
		endif
	endif
EndFunction

Function updatePageVariables()
{Called when an event causes a page of the list to be drawn in a terminal}
	; -------------------
	; Set important values since this script will need them immediately and a child script or the conditional system in the editor will need them later
	; -------------------
	iListSize = myData.getSize()
	if (iListSize <= 0) ; if there's no data to display, make that clear by way of state in the conditional variables and then stop processing
		setNoDataState()
		return
	endif
	bHasData = true
	iNoNavPageSize = iFullPageSize
	iOneNavPageSize = iNoNavPageSize - 1
	iTwoNavPageSize = iNoNavPageSize - 2
	Int iMaxPage = calculateHighestPageNumber()
	
	; -------------------
	; Range checks to prevent minor bugs (or changes of list size) from manifesting
	; -------------------
	if (iCurrentPage < 1 || iListSize <= iNoNavPageSize) ; things which would force the terminal to display the first page
		iCurrentPage = 1
	endif
	if (iMaxPage < iCurrentPage) ; most likely possibility:  the list size changed (which may or may not be due to filtering) such that the current page is now out of bounds entirely.
		iCurrentPage = iMaxPage
	endif
	iPageOffset = calculatePageOffset()
	
	; -------------------
	; iCurrentPage is now known to have an acceptable, so calculate how much room there will be for options on the page
	; -------------------
	iPageItems = iNoNavPageSize ; used to track how many terminal option slots are available for actual options
	bShowPrevious = iCurrentPage > 1; the conditional system needs this regardless of whether or not it is used for anything at this point
	if (bShowPrevious)
		iPageItems -= 1 ; because we're losing one option to the previous navigation option
	endif
	bShowNext = iMaxPage > iCurrentPage ; the conditional system needs this regardless of whether or not it is used for anything at this point
	if (bShowNext)
		iPageItems -= 1 ; because we're losing one option to the next navigation option
	endif
	
	; -------------------
	; Calculate how many available options are actually needed to display the rest of the list.
	; -------------------
	iPageOffset = calculatePageOffset() ; how many items in the list have been displayed in previous pages, which could not be figured until the true page number was known
	Int iLastItemNumber = calculatePageOffset() + iPageItems ; highest item number this page could display
	if (iListSize < iLastItemNumber) ; there are not enough items to use every remaining option slot on the terminal
		iPageItems -= (iLastItemNumber - iListSize) ; subtract the shortfall from the maximum so that blank options are not displayed on the terminal
	endif
	
	DynamicTerminal:Logger:Paginator.logState(self, sStateEventUpdatePage)
EndFunction

Function preReplacement()
	if (myData.bRefreshFilterOnDraw)
		DynamicTerminal:Logger:Paginator.logDataFilter(self, sStateEventDraw)
		myData.filter()
	endif
	
	updatePageVariables() ; always calculate the page and its data before performing token replacements
EndFunction

Form Function getItemReplacementValue(Form rawItem)
	return rawItem
EndFunction

Function tokenReplacementLogic()
{This is default pagination behavior wherein each item token on a terminal page is replaced with the appropriate Form}
	String sPrefix = sDefaultTokenPrefix
	if ("" != OverrideTokenPrefix)
		sPrefix = OverrideTokenPrefix
	endif
	
	Int iCounter = 0
	while (iCounter < iPageItems)
		replace(sPrefix + iCounter, getItemReplacementValue(getItem(iCounter)))
		iCounter += 1
	endwhile
EndFunction

Function prePaginate()
{Event hook.}
EndFunction

Function postPaginate()
{Event hook.}
EndFunction

Function paginate(ObjectReference akTerminalRef, DynamicTerminal:ListWrapper wrapper)
	myData = wrapper
	if (myData.bFilterOnPagination)
		DynamicTerminal:Logger:Paginator.logDataFilter(self, sStateEventPaginate)
		myData.freshFilter()
	endif
	
	iCurrentPage = 1 ;there may or may not be data, but let's let the pagination logic sort that out
	
	draw(akTerminalRef)
EndFunction

Function init(ObjectReference akTerminalRef, DynamicTerminal:ListWrapper wrapper, DynamicTerminal:PaginationProxy proxyObject = None)
{Entry point for paginating a list on a terminal, causes the first page of data in the wrapper to be drawn to the terminal reference provided.  Best called from a terminal item's fragment script}
	DynamicTerminal:Logger:Paginator.logInitialization(self, wrapper, proxyObject)
	
	clearProxy()
	prePaginate()
	
	setProxy(proxyObject)
	paginate(akTerminalRef, wrapper)
	postPaginate()
	
	updateProxy(sUserActionInitialization)
EndFunction

Function preActivate(Int iItem, ObjectReference akTerminalRef)
{Event hook.}
EndFunction

Function postActivate(Int iItem, ObjectReference akTerminalRef)
{Event hook.}
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
{Override this function to do things with the activated item.}
	Form akItem = getItem(iItem) ; this is how items should be accessed in child scripts so that something may be done with them.  Note you'll likely have to cast the Form object to another type here.
EndFunction

Function activate(Int iItem, ObjectReference akTerminalRef)
{This function is most likely to be called by the script fragment belonging to the terminal item with number iItem}
	preActivate(iItem, akTerminalRef)
	itemActivation(iItem, akTerminalRef)
	postActivate(iItem, akTerminalRef)
	
	if (bRedrawAfterActivation)
		draw(akTerminalRef)
	endif
	
	updateProxy(sUserActionActivation)
EndFunction
