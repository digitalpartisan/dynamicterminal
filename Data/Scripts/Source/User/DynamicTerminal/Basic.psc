Scriptname DynamicTerminal:Basic extends Quest Hidden Conditional
{Extend this script to have easy access to dynamic token replacement and Pip-Boy detection behavior in a terminal.}

ObjectReference myTerminal = None ; the terminal reference
Bool bUsingPipboy = false Conditional ; is the terminal actually the pipboy (which cannot accept token replacements)

Bool Function isUsingPipboy()
{Because papyrus script variables are private}
	return bUsingPipboy
EndFunction

ObjectReference Function getTerminal()
{Because papyrus script variables are private}
	return myTerminal
EndFunction

Function setTerminal(ObjectReference akTerminalRef = None)
{Called when a draw or redraw is about to happen so that the right terminal is modified.  Mostly precautionary, but still.}
	myTerminal = akTerminalRef
	bUsingPipboy = myTerminal == None
	DynamicTerminal:Logger.logTerminalRef(self)
EndFunction

Function replace(String token, Form fValue)
{Pure convenience.  Not really required, but it makes child scripts very readable}
	DynamicTerminal:Logger.logReplacement(self, token, fValue)
	if (None != fValue) ; keep harmess yet incredibly verbose stack traces out of the logs
		myTerminal.addTextReplacementData(token, fValue)
	endif
EndFunction

Function preReplacement()
{Event hook to allow logic prior to token replacement.  Override this to augment behavior.}
EndFunction

Function tokenReplacementLogic()
{Override this behavior, making use of replace() in order to populate the terminal}
EndFunction

Function postReplacement()
{Event hook to allow logic following token replacement.  Override this to augment behavior.}
EndFunction

Function performTokenReplacements()
	if (isUsingPipboy()) ; no point and it generates a ton of logs
		return
	endif

	preReplacement()
	tokenReplacementLogic()
	postReplacement()
EndFunction

Function draw(ObjectReference akTerminalRef)
{Called when the data in a terminal has changed such that it needs to be redrawn}
	setTerminal(akTerminalRef)
	performTokenReplacements()
EndFunction
