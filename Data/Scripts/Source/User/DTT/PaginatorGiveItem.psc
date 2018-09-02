Scriptname DTT:PaginatorGiveItem extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	DTT:GiveItem giveThis = getItem(iItem) as DTT:GiveItem
	Game.GetPlayer().AddItem(giveThis.Item, giveThis.Amount)
EndFunction
