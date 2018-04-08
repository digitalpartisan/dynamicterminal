Scriptname DTT:GiveForm extends dynamicterminal:paginator Conditional

Int Property Amount = 1 Auto Const

Function itemActivation(Int iItemID, ObjectReference akTerminalRef)
	Game.GetPlayer().AddItem(getItem(iItemID), Amount)
EndFunction
