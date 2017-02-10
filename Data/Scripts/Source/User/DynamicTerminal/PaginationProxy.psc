Scriptname DynamicTerminal:PaginationProxy extends Quest Conditional
{This is a hack intended to allow a modder to create a generic Pagination terminal and pass in a pagination script at runtime without the need to create a terminal record for every single paginator.
The CK terminal editor will require a specific quest with variables to access in order to decide which text and option items to display and it cannot be set at runtime.
This script is intended to wrap a paginator and refer back to it when significant events occur so that the monkey work of setting up a bunch of terminals with outright identical behavior - but with different quests in the conditional rules - is almost totally eliminated.}

DynamicTerminal:Paginator actualPaginator = None ; the paginator this script is to proxy against.

Bool bUsingPipboy = false Conditional ; see DynamicTerminal:Basic
Bool bHasData = false Conditional ; see DynamicTerminal:Paginator
Bool bShowPrevious = false Conditional ; see DynamicTerminal:Paginator
Bool bShowNext = false Conditional ; see DynamicTerminal:Paginator
Int iPageItems = 0 Conditional ; see DynamicTerminal:Paginator

Bool Function isUsingPipboy()
	return bUsingPipboy
EndFunction

Bool Function hasData()
	return bHasData
EndFunction

Bool Function showPrevious()
	return bShowPrevious
EndFunction

Bool Function showNext()
	return bShowNext
EndFunction

Int Function getPageItems()
	return iPageItems
EndFunction

DynamicTerminal:Paginator Function getPaginator()
	return actualPaginator
EndFunction

Function refreshProxyVariables(String sPaginatorAction = "")
{Called when an event causes the paginator to recalculate these values which means the proxy needs to update them or risk breaking the terminal display.}
	bUsingPipboy = actualPaginator.isUsingPipboy()
	bHasData = actualPaginator.hasData()
	bShowPrevious = actualPaginator.showPrevious()
	bShowNext = actualPaginator.showNext()
	iPageItems = actualPaginator.getPageItems()
	
	String sEventMessage = "updated by paginator " + actualPaginator
	if ("" != sPaginatorAction)
		sEventMessage += " on " + sPaginatorAction
	endif
	
	DynamicTerminal:Logger:PaginationProxy.logState(self, sEventMessage)
EndFunction

Function init(ObjectReference akTerminalRef, DynamicTerminal:Paginator myPaginator, DynamicTerminal:ListWrapper dataWrapper)
{See DynamicTerminal:Paginator.}
	actualPaginator = myPaginator
	actualPaginator.init(akTerminalRef, dataWrapper, self) ; make sure this proxy is informs the paginator of it's existence so that it gets the updates as needed
EndFunction

Function activate(Int iItem, ObjectReference akTerminalRef)
{See DynamicTerminal:Paginator.}
	getPaginator().activate(iItem, akTerminalRef)
EndFunction

Function back(ObjectReference akTerminalRef)
{See DynamicTerminal:Paginator.}
	getPaginator().back(akTerminalRef)
EndFunction

Function forward(ObjectReference akTerminalRef)
{See DynamicTerminal:Paginator.}
	getPaginator().forward(akTerminalRef)
EndFunction
