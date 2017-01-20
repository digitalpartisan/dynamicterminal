Scriptname DTT:WeaponBuilder extends DynamicTerminal:Builder:Menu Conditional

Int Property iTypeID = 0 Auto Const
Int Property iCapacitorID = 1 Auto Const
Int Property iBarrelID = 2 Auto Const
Int Property iGripID = 3 Auto Const
Int Property iSightID = 4 Auto Const
Int Property iMuzzleID = 5 Auto Const

Bool bHasType = false Conditional
Bool bHasCapacitor = false Conditional
Bool bHasBarrel = false Conditional
Bool bHasGrip = false Conditional
Bool bHasSight = false Conditional
Bool bHasMuzzle = false Conditional

Function clearState()
	parent.clearState()

	bHasType = false
	bHasCapacitor = false
	bHasBarrel = false
	bHasGrip = false
	bHasSight = false
	bHasMuzzle = false
EndFunction

Function updateLogic()
	if (!bHasType && getComponent(iTypeID).isComplete())
		bHasType = true
		DTT:WeaponOption weaponValue = getComponent(iTypeID).getValue() as DTT:WeaponOption

		getComponent(iCapacitorID).setOptions(weaponValue.CapacitorOptions)
		getComponent(iBarrelID).setOptions(weaponValue.BarrelOptions)
		getComponent(iGripID).setOptions(weaponValue.GripOptions)
		getComponent(iSightID).setOptions(weaponValue.SightOptions)
		getComponent(iMuzzleID).setOptions(weaponValue.MuzzleOptions)
	endif

	bHasCapacitor = getComponent(iCapacitorID).isComplete()
	bHasBarrel = getComponent(iBarrelID).isComplete()
	bHasGrip = getComponent(iGripID).isComplete()
	bHasSight = getComponent(iSightID).isComplete()
	bHasMuzzle = getComponent(iMuzzleID).isComplete()
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasType && bHasCapacitor && bHasBarrel && bHasGrip && bHasSight && bHasMuzzle)
EndFunction

Function buildLogic()
	DTT:WeaponOption typeValue = getComponent(iTypeID).getValue() as DTT:WeaponOption
	Actor aPlayer = Game.GetPlayer()

	ObjectReference akInstance = aPlayer.PlaceAtMe(typeValue.Item)
	akInstance.AttachMod(getComponent(iCapacitorID).getValue() as ObjectMod)
	akInstance.AttachMod(getComponent(iBarrelID).getValue() as ObjectMod)
	akInstance.AttachMod(getComponent(iGripID).getValue() as ObjectMod)
	akInstance.AttachMod(getComponent(iSightID).getValue() as ObjectMod)
	DynamicTerminal:Builder:Component muzzle  = getComponent(iMuzzleID)
	if (muzzle.isAvailable())
		akInstance.AttachMod(muzzle.getValue() as ObjectMod)
	endif
	aPlayer.AddItem(akInstance)
EndFunction
