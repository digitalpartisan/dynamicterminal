Scriptname DynamicTerminal:Builder:Menu extends DynamicTerminal:Basic Conditional
{Contains the base logic needed to create a builder menu in a terminal with paginated component options.
For these purposes, a "builder" builds (in the sense that a process has steps which must be specified in order to complete some product or process) and a component is the paginator which displays the choices for each step in said build process.
A menu can be linear (the default behavior) where each component's options are known prior to run-time or mutable (which is set by the HasMutableOptions property being true) which clears the option sets along with state.
A mutable menu is useful when one of the component values needs to change the options available for subsequnet components.  If using a mutable menu, be sure to set the first component's FirstOfMutable property to true and set it's Options in the editor.}

DynamicTerminal:Builder:Component[] Property Components Auto Const
{The Components are the paginators used to select specific options for each step of the build.}
Message Property ComponentNA Auto Const
{Token replacement value for components - particularly in mutable builders - for when a component ends up not having any options.}
Bool Property HasMutableOptions = false Auto Const
{Setting this property to true will cause the options of components to be cleared out along with the menu's state.  If this is desirable, make sure to set the FirstOfMutable property - and the Options property - on the first component in the editor so that this menu does not become inoperable.}

Bool bCanBuild = false Conditional ; whether or not the build terminal should display the option to execute the build() behavior

Bool Function canBuild()
	return bCanBuild
EndFunction

Function setCanBuild(Bool bValue)
	bCanBuild = bValue
EndFunction

DynamicTerminal:Builder:Component Function getComponent(Int iComponentID)
	return Components[iComponentID]
EndFunction

Function tokenReplacementLogic()
{Make sure to set the Token property on each component since doing so will enable automatic token replacement with that component's value.}
	Int iCounter = 0
	while (iCounter < Components.Length)
		DynamicTerminal:Builder:Component menuComponent = getComponent(iCounter)
		replace(menuComponent.Token, menuComponent.getValue())
		iCounter += 1
	endwhile
EndFunction

Function clearState()
{Call this when the build process is complete or when the terminal has been told by the user to reset the component value selections.}
	setCanBuild(false)
	
	Int iCounter = 0
	while (iCounter < Components.Length)
		Components[iCounter].clearState()
		iCounter += 1
	endwhile
EndFunction

Function preUpdate()
{Event hook.}
EndFunction

Function updateLogic()
{Override this behavior to handle changes to component values and set any other variables required to communicate state to the terminal reference.}
EndFunction

Function postUpdate()
{Event hook.}
EndFunction

Function calculateCanBuild()
{By default, the buildable status of a menu is false until all components report completion.  Override this method to change this behavior.}
	Bool bResult = true
	Int iCounter = 0
	While (iCounter < Components.Length)
		bResult = bResult && getComponent(iCounter).isComplete()
		iCounter += 1
	EndWhile
	
	setCanBuild(bResult)
EndFunction

Function updateState()
	preUpdate()
	updateLogic()
	postUpdate()
	calculateCanBuild()
EndFunction

Function preBuild()
{Event hook.}
EndFunction

Function postBuild()
{Event hook.}
EndFunction

Function buildLogic()
{Override this behavior to complete the build process and do whatever it is you want done with the components and their values.  Be sure to call clearState() when done doing whatever it is you're going to do so that the terminal resets itself nicely.}
EndFunction

Function build()
	if (!canBuild())
		return ; paranoia, defensive programming, etc.
	endif
	
	preBuild()
	buildLogic()
	postBuild()
	
	clearState()
EndFunction

Function proxyComponent(ObjectReference akTerminalRef, DynamicTerminal:PaginationProxy Proxy, Int iComponentID)
{Syntactical sugar.  Helps keep unnecessary properties and code out of terminal fragments.}
	DynamicTerminal:Builder:Component menuComponent = getComponent(iComponentID)
	Proxy.init(akTerminalRef, menuComponent, menuComponent.Options)
EndFunction
