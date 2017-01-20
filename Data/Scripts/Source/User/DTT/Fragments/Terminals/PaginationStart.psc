;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DTT:Fragments:Terminals:PaginationStart Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, Paginator, Data)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:PaginationProxy Property Proxy Auto Const

DTT:PaginatorGiveItem Property Paginator Auto Const

DynamicTerminal:ListWrapper Property Data Auto Const
