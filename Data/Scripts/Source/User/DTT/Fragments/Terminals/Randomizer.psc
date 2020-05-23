;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DTT:Fragments:Terminals:Randomizer Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
RandomData.choose()
Proxy.init(akTerminalRef, Paginator, RandomData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:Paginator:Proxy Property Proxy Auto Const

DynamicTerminal:Paginator Property Paginator Auto Const

DTT:RandomArray Property RandomData Auto Const
