Scriptname DynamicTerminal:Builder:Component extends DynamicTerminal:Paginator Conditional
{Used in builder terminals to present the choices for a specific item required in the build process.  No extension is generally required because the activate() behavior is provided and redirected back to the builder.}

DynamicTerminal:Builder:Menu Property Menu Auto Const Mandatory
{The builder this belongs to.  Required to set the component's value and redraw the menu on the terminal in use.}
String Property Token Auto Const Mandatory
{Having the token name here enables automatic replacement when this component's value has been set in the menu.  Cuts down on boilerplate code.}
DynamicTerminal:ListWrapper Property Options Auto Const Mandatory

Bool bOptionsAvailable = true ; whether or not there is a usable value available for this component.
Form fValue = None

String Function getToken()
	return Token
EndFunction

Bool Function isAvailable()
	return bOptionsAvailable
EndFunction

Function markUnavailable()
	bOptionsAvailable = false
EndFunction

Function markAvailable()
	bOptionsAvailable = true
EndFunction

DynamicTerminal:ListWrapper Function getOptions()
	return Options
EndFunction

Form Function getValue()
	if (!isAvailable())
		return None
	endif

	return fValue
EndFunction

Bool Function hasValue()
	return fValue != None
EndFunction

Function setValue(Form fNewValue)
	DynamicTerminal:Builder:Component:Logger.logSetValue(self, fNewValue)
	fValue = fNewValue
EndFunction

Function clearValue()
	fValue = None
EndFunction

Bool Function isComplete()
	return (!isAvailable() || hasValue())
EndFunction

Function examineOptions()
	if (!Options || !Options.getSize())
		markUnavailable() ; no options available
		setValue(Menu.getNAValue()) ; use the menu's NA message for the value to keep the terminal looking spiffy
	elseif (Options.getSize() == 1)
		setValue(Options.getItem(0)) ; Only one item, the value of this component is known
	endif
EndFunction

Function clearState()
	DynamicTerminal:Builder:Component:Logger.logClear(self)
	clearValue()
	markAvailable()
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
{This activation behavior for a builder component.  Consider carefully whether or not you need to override this behavior or if you can do what you need to do in your menu's updateBehavior() logic.}
	setValue(getItem(iItem))
	Menu.updateState()
	Menu.draw(akTerminalRef)
EndFunction
