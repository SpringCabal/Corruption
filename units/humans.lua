local Dude = Civilian:New {
    name                = "Dude",
    maxDamage           = 300,
}

local Dudette = Civilian:New {
    name                = "Dudette",
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
    name                = "ZombieDude",
    script              = "zombiedude.lua",
--     objectName          = "zombiedude.blend",
}

local ZombieDudette = Zombie:New {
    name                = "ZombieDudette",
}

local ZombieKid = Zombie:New {
    name                = "ZombieKid",
    customParams = {
        kid = true,
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
    maxVelocity        = 2,
}

-- local Engineer = BaseHuman:New{
--  name                = "PlaceHolderDudette",
--  objectName              = "<NAME>.s3o",
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