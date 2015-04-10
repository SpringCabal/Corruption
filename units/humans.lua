local Dude = Civilian:New{
	name				= "Dude",
}

local Dudette = Civilian:New{
	name				= "Dudette",
}

local Kid = Civilian:New {
    name                = "Kid",
    customparams = {
        kid = true,
    }
}

local ZombieDude = Zombie:New{
	name				= "ZombieDude",
}

local ZombieKid = Zombie:New {
    name                = "ZombieKid",
    customparams = {
        kid = true,
    }
}
--[[
local Player = BaseHuman:New {
    name                = "Player",
    customparams = {
        player = true,
    }
}]]

-- local Engineer = BaseHuman:New{
-- 	name				= "PlaceHolderDudette",
-- 	objectName				= "<NAME>.s3o",
-- }

return lowerkeys({
	Dude = Dude,
	Dudette = Dudette,
    Kid = Kid,
    ZombieDude = ZombieDude,
    ZombieKid = ZombieKid,
})