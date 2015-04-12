local Dude = Civilian:New {
	name				= "Dude",
}

local Dudette = Civilian:New {
	name				= "Dudette",
}

local Kid = Civilian:New {
    name                = "Kid",
    customparams = {
        kid = true,
    }
}

local ZombieDude = Zombie:New {
	name				= "ZombieDude",
    script				= "zombiedude.lua",
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
}

local ZombieKid = Zombie:New {
    name                = "ZombieKid",
    customparams = {
        kid = true,
    },
    weapons = {
        { name = "Claw"},
    },
}

local Player = BaseHuman:New {
    name                = "Player",
    customparams = {
        player = true,
    }
}

local Exorcist = BaseHuman:New {
    name                = "Exorcist",
    customparams = {
        player = true,
    },
    weapons = {
        { name = "Staff"},
    },
}

-- local Engineer = BaseHuman:New{
-- 	name				= "PlaceHolderDudette",
-- 	objectName				= "<NAME>.s3o",
-- }

return lowerkeys({
	Dude = Dude,
	Dudette = Dudette,
    Kid = Kid,
    Player = Player,
    Exorcist = Exorcist,
    ZombieDude = ZombieDude,
    ZombieDudette = ZombieDudette,
    ZombieKid = ZombieKid,
})