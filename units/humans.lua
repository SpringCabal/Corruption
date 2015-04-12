local Dude = Civilian:New {
	name				= "Dude",
    maxDamage           = 300,
    collisionVolumeScales		= [[50 50 50]],
    collisionVolumeOffsets	= [[0 25 0]],
}

local Dudette = Civilian:New {
	name				= "Dudette",
    maxDamage           = 300,
}

local Kid = Civilian:New {
    name                = "Kid",
    customParams = {
        kid = true,
    },
    maxDamage           = 200,
}

local ZombieDude = Zombie:New {
	name				= "ZombieDude",
    script				= "zombiedude.lua",
    maxDamage           = 500,
--     objectName          = "zombiedude.blend",
    weapons = {
        { name = "Claw"},
    },
}

local ZombieDudette = Zombie:New {
	name				= "ZombieDudette",
    weapons = {
        { name = "Claw"},
    },
    maxDamage           = 500,
}

local ZombieKid = Zombie:New {
    name                = "ZombieKid",
    customParams = {
        kid = true,
    },
    weapons = {
        { name = "Claw"},
    },
    maxDamage           = 400,
}

local Exorcist = BaseHuman:New {
    name                = "Exorcist",
    customParams = {
        player = true,
    },
    weapons = {
        { name = "Staff"},
    },
    maxDamage           = 800,
}

-- local Engineer = BaseHuman:New{
-- 	name				= "PlaceHolderDudette",
-- 	objectName				= "<NAME>.s3o",
-- }

return lowerkeys({
	Dude = Dude,
	Dudette = Dudette,
    Kid = Kid,
    Exorcist = Exorcist,
    ZombieDude = ZombieDude,
    ZombieDudette = ZombieDudette,
    ZombieKid = ZombieKid,
})