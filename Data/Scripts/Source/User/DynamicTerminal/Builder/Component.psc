Scriptname DynamicTerminal:Builder:Component extends DynamicTerminal:Paginator Conditional
{Used in builder terminals to present the choices for a specific item required in the build process.  No extension is generally required because the activate() behavior is provided and redirected back to the builder.}

Bool Property FirstOfMutable = false Auto Const
DynamicTerminal:Builder:Menu Property Menu Auto Const Mandatory
{The builder this belongs to.  Required to set the component's value and redraw the menu on the terminal in use.}
String Property Token Auto Const Mandatory
{Having the token name here enables automatic replacement when this component's value has been set in the menu.  Cuts down on boilerplate code.}
DynamicTerminal:ListWrapper Property Options = None Auto
{The options required for populating a paginated list for selecting this component's value}

Bool bOptionsAvailable = true ; whether or not there is a usable value available for this component.
Form fValue = None

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
	return fValue
EndFunction

Bool Function hasValue()
	return fValue != None
EndFunction

Function setValue(Form fNewValue)
	DynamicTerminal:Logger:Component.logSetValue(self, fNewValue)
	fValue = fNewValue
EndFunction

Function clearValue()
	fValue = None
EndFunction

Bool Function isComplete()
	if (isAvailable())
		return hasValue()
	else
		return true
	endif
EndFunction

Function setOptions(DynamicTerminal:ListWrapper newOptions)
	if (!Menu.HasMutableOptions)
		return ; the menu isn't set to be mutable, so halt.  Options must be set in the editor and not programmatically
	endif
	
	DynamicTerminal:Logger:Component.logSetOptions(self, newOptions)
	
	Options = newOptions
	
	if (Options == None || Options.getSize() == 0)
		markUnavailable() ; no options available
		setValue(Menu.ComponentNA) ; use the menu's NA message for the value to keep the terminal looking spiffy
	elseif (Options.getSize() == 1)
		setValue(Options.getItem(0)) ; Only one item, the value of this component is known
	endif
EndFunction

Function clearOptions()
	if (Menu.HasMutableOptions && !FirstOfMutable)
		Options = None ; the menu has mutable options and this component isn't protected by being first, so clear out the options as requested
	endif
EndFunction

Function clearState()
	DynamicTerminal:Logger:Component.logClear(self)
	clearValue()
	markAvailable()
	clearOptions()
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
{This activation behavior for a builder component.  Consider carefully whether or not you need to override this behavior or if you can do what you need to do in your menu's updateBehavior() logic.}
	setValue(getItem(iItem))
	Menu.updateState()
	Menu.draw(akTerminalRef)
EndFunction
