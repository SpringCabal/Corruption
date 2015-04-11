local unitName = "house"

local unitDef = {
name = "Home",
Description = " sweet Home",
objectName = "galgohouse.s3o",
script = "gAlgoPropScript.lua",
buildPic = "placeholder.png",
levelGround =false,
--cost
buildCostMetal = 15,
buildCostEnergy = 1,
buildTime = 1,
--Health
maxDamage = 6660,
idleAutoHeal = 15,
autoheal=10,
--Movement
mass=180020,
upRight=true,
blocking=false,
pushResistant=true,

FootprintX = 3,
FootprintZ = 3,


MaxSlope = 90,
MaxVelocity = 0.000001,
MaxWaterDepth = 55,
TurnRate = 1,

sightDistance = 80,

reclaimable=false,
Builder = false,
CanAttack = true,
CanGuard = false,
CanMove = true,
CanPatrol = false,
CanStop = true,
LeaveTracks = false,
useSmoothMesh = false,

-- corpse             = "lavafeature",
 

 
  customParams = {},
 sfxtypes = {
    explosiongenerators = {
				 --  "custom:factory_explosion",
	   		     --  "custom:flames",
				 --  "custom:glowsmoke",
				 --  "custom:blackerthensmoke",
				 --  "custom:LightUponSmoke",  
						  },
	
			},

 
 
Category = [[LAND]],




}

return lowerkeys({ [unitName] = unitDef })