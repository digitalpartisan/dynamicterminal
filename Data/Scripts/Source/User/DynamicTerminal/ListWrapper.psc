Scriptname DynamicTerminal:ListWrapper extends Quest Hidden
{The generic type of ListWrapper which impelements the behaviors required by paginators to paginate items in the ListWrapper.
Between a Form[] and a FormList, there are different means of determining list size and accessing individual items.
This script defines the behaviors used by dynamic terminals - especially paginators - to access data without being aware of the sort of list it works on.}

Bool Property bFilterOnPagination = false Auto Const
{Clears any existing filter and re-applies filter logic when this list is used to initialize a DynamicTerminal:Paginator object.}
Bool Property bRefreshFilterOnDraw = false Auto Const
{Re-applies filter logic to the list prior to token replacement when the terminal is re-drawn.}

Bool bFiltered = false
Form[] filteredItems = None

Int Function getRawDataSize()
{Returns the size of the raw data specified in the editor.  See child scripts for implementation details according to type.}
	return 0 ; data type is not known by this script specifically
EndFunction

Int Function getSize()
{Returns the size of the list.}
	if (bFiltered)
		return filteredItems.Length
	else
		return getRawDataSize()
	endif
EndFunction

Bool Function rangeCheck(Int iNumber)
{Nothing more than pure paranoia.  Used to prevent hard to find and potentially disasterous bugs.}
	return (iNumber >= 0 && iNumber < getSize())
EndFunction

Form Function getRawDataItem(Int iNumber)
{Returns the item at location iNumber in the raw data specified in the editor.  See child scripts for impelementation details according to type.}
	return None ; data type is not known by this script specifically.
EndFunction

Form Function getItem(Int iNumber)
{Returns the item at location iNumber.}
	if (!rangeCheck(iNumber))
		return None
	endif

	if (bFiltered)
		return filteredItems[iNumber]
	else
		return getRawDataItem(iNumber)
	endif
EndFunction

Bool Function itemPassesFilter(Int iNumber)
{Returns true if the item at location iNumber in the raw data specified in the editor should pass the filter.  Override to provide useful behavior to implement your desired filter logic.}
	DynamicTerminal:ListWrapper:Logger.logPassthroughFilter(self)
	return true
EndFunction

Function unfilter()
{Undoes the filtering behavior and presents all data items in the original data set to be presented to pagination logic.}
	DynamicTerminal:ListWrapper:Logger.logUnfilter(self)
	bFiltered = false
	filteredItems = new Form[0]
EndFunction

Function filter()
	Int iCounter = 0
	Int iSize = getRawDataSize()
	filteredItems = new Form[0]
	
	While (iCounter < iSize)
		if (itemPassesFilter(iCounter))
			filteredItems.Add(getRawDataItem(iCounter))
		endif
		iCounter += 1
	EndWhile
	
	DynamicTerminal:ListWrapper:Logger.logFilterResult(self, iSize, filteredItems.Length)
	bFiltered = true
EndFunction

Function freshFilter()
	unfilter()
	filter()
EndFunction
