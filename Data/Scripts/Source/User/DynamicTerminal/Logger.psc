Scriptname DynamicTerminal:Logger Hidden Const DebugOnly

String Function getName() Global
	return "DynamicTerminal"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logTerminalRef(DynamicTerminal:Basic terminalScript) Global
	return log(Jiffy:Loggout.buildMessage(terminalScript + " is using ", terminalScript.isUsingPipBoy(), "the pip-boy", "terminal " + terminalScript.getTerminal()))
EndFunction

Bool Function logReplacement(DynamicTerminal:Basic terminalScript, String sTokenName, Form fValue = None) Global
	return log(terminalScript + " set " + sTokenName + " to " + fValue)
EndFunction
