;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DTT:Fragments:Terminals:NestedPagination Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Paginator.init(akTerminalRef, PaginationData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:Paginator Property Paginator Auto Const

DynamicTerminal:ListWrapper Property PaginationData Auto Const
