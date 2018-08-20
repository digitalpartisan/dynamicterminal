Scriptname dynamicterminal:logger:Component Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = DynamicTerminal:Logger:Builder.getTags()
	tags.Add("Component")
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logClear(DynamicTerminal:Builder:Component myComponent) Global
	return log(myComponent + " is clearing state")
EndFunction

Bool Function logSetOptions(DynamicTerminal:Builder:Component myComponent, DynamicTerminal:ListWrapper myOptions = None) Global
	return log(Loggout.buildMessage(myComponent + " was given options " + myOptions, None == myOptions, "", " with " + myOptions.getSize() + " choice(s)"))
EndFunction

Bool Function logSetValue(DynamicTerminal:Builder:Component myComponent, Form fValue) Global
	return log(myComponent + " was given value " + fValue)
EndFunction
