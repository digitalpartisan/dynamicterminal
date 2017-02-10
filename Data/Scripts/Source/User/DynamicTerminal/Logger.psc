Scriptname DynamicTerminal:Logger Hidden Const DebugOnly

String Function getName() Global
	return "DynamicTerminal"
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(getName(), sMessage)
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(getName(), sMessage)
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(getName(), sMessage)
EndFunction

Bool Function logTerminalRef(DynamicTerminal:Basic terminalScript) Global
	String sMessage = terminalScript + " is using "
	if (terminalScript.isUsingPipBoy())
		sMessage += "the pip-boy"
	else
		sMessage += " terminal " + terminalScript.getTerminal()
	endif
	
	return log(sMessage)
EndFunction

Bool Function logReplacement(DynamicTerminal:Basic terminalScript, String sTokenName, Form fValue = None) Global
	return log(terminalScript + " set " + sTokenName + " to " + fValue)
EndFunction
