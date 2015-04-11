-- Infantry ----
local BaseHuman = Unit:New{
	airSightDistance	= 2000,
	acceleration		= 0.375,
	brakeRate			= 0.9,
	buildCostMetal		= 65, -- used only for power XP calcs
	canMove				= true,
	category			= "INFANTRY",
	-- corpse				= "<SIDE>soldier_dead",
	damageModifier		= 0.265,
	flankingBonusMax	= 1.5,
	flankingBonusMin	= 0.675,
	flankingBonusMobilityAdd	= 0.01,
	flankingBonusMode	= 1,
	footprintX			= 1,
	footprintZ			= 1,
	mass				= 50,
	maxDamage			= 100, -- default only, <SIDE>Infantry.lua should overwrite
	maxVelocity			= 1.6,
	movementClass		= "KBOT_Infantry", -- TODO: --KBOT
	noChaseCategory		= "FLAG AIR MINE",
	radardistance		= 650,
	repairable			= false,
	-- script				= "Infantry.lua",
	seismicDistance		= 1400,
	seismicSignature	= 0, -- required, not default
	sightDistance		= 650,
	stealth				= true,
	turnRate			= 1010,
	upright				= true,
}

local Civilian = BaseHuman:New{
    customparams = {
        civilian = true,
    }
}

local Zombie = BaseHuman:New {
    customparams = {
        zombie = true,
    },
}

return {
    BaseHuman = BaseHuman,
    Civilian = Civilian,
    Zombie = Zombie,
}