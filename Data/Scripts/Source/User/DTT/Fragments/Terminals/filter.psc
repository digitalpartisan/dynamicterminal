;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DTT:Fragments:Terminals:filter Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, Paginator, PotionFilter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, Paginator, NoFilter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, Paginator, MiscObjectFilter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, Paginator, AmmoFilter)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:PaginationProxy Property Proxy Auto Const

DynamicTerminal:Paginator Property Paginator Auto Const

DTT:PotionFilter Property PotionFilter Auto Const

DTT:FilterMiscObject Property MiscObjectFilter Auto Const

DTT:FilterAmmo Property AmmoFilter Auto Const

DynamicTerminal:ListWrapper Property NoFilter Auto Const
