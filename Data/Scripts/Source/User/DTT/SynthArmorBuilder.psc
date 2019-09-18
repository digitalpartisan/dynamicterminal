Scriptname DTT:SynthArmorBuilder extends DynamicTerminal:Builder:Menu Conditional

Armor Property SynthSuit Auto Const
Armor Property Torso Auto Const
Armor Property ArmLeft Auto Const
Armor Property ArmRight Auto Const
Armor Property LegLeft Auto Const
Armor Property LegRight Auto Const

Int Property iSizeID = 0 Auto Const
Int Property iMaterialID = 1 Auto Const
Int Property iHelmetID = 2 Auto Const

Bool bHasSize = false Conditional
Bool bHasMaterial = false Conditional
Bool bHasHelmet = false Conditional

Function clearState()
	parent.clearState()

	bHasSize = false
	bHasMaterial = false
	bHasHelmet = false
EndFunction

Function updateLogic()
	bHasSize = getComponent(iSizeID).isComplete()
	bHasMaterial = getComponent(iMaterialID).isComplete()
	bHasHelmet = getComponent(iHelmetID).isComplete()
EndFunction

Function postUpdate()
	if (!bHasSize)
		getComponent(iSizeID).examineOptions()
	endif
	
	if (!bHasMaterial)
		getComponent(iMaterialID).examineOptions()
	endif
	
	if (!bHasMaterial)
		getComponent(iHelmetID).examineOptions()
	endif
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasSize && bHasMaterial && bHasHelmet)
EndFunction

Function buildLogic()
	Actor aPlayer = Game.GetPlayer()
	ObjectReference akInstance = None
	DTT:ArmorSize size = getComponent(iSizeID).getValue() as DTT:ArmorSize
	DTT:ArmorMaterial material = getComponent(iMaterialID).getValue() as DTT:ArmorMaterial

	aPlayer.AddItem(SynthSuit)

	akInstance = aPlayer.PlaceAtMe(Torso)
	akInstance.AttachMod(size.Torso)
	akInstance.AttachMod(material.Torso)
	aPlayer.AddItem(akInstance)

	akInstance = aPlayer.PlaceAtMe(ArmLeft)
	akInstance.AttachMod(size.Arm)
	akInstance.AttachMod(material.Arm)
	aPlayer.AddItem(akInstance)

	akInstance = aPlayer.PlaceAtMe(ArmRight)
	akInstance.AttachMod(size.Arm)
	akInstance.AttachMod(material.Arm)
	aPlayer.AddItem(akInstance)
	
	akInstance = aPlayer.PlaceAtMe(LegLeft)
	akInstance.AttachMod(size.Leg)
	akInstance.Attachmod(material.Leg)
	aPlayer.AddItem(akInstance)

	akInstance = aPlayer.PlaceAtMe(LegRight)
	akInstance.AttachMod(size.Leg)
	akInstance.AttachMod(material.Leg)
	aPlayer.AddItem(akInstance)

	akInstance = aPlayer.PlaceAtMe(getComponent(iHelmetID).getValue() as Armor)
	akInstance.AttachMod(material.Helmet)
	aPlayer.AddItem(akInstance)
EndFunction
