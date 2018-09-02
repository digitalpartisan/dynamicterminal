;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DTT:Fragments:Terminals:ArmorBuilder Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Builder.proxyComponent(akTerminalRef, Proxy, Builder.iSizeID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Builder.proxyComponent(akTerminalRef, Proxy, Builder.iMaterialID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Builder.proxyComponent(akTerminalRef, Proxy, Builder.iHelmetID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Builder.build()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Builder.clearState()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:PaginationProxy Property Proxy Auto Const

DTT:SynthArmorBuilder Property Builder Auto Const
