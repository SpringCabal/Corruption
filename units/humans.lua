local Civilian:New {
    customparams = {
        civilian = true,
    }
}

local Dude = Civilian:New{
	name				= "PlaceHolderDude",
}

local Dudette = Civilian:New{
	name				= "PlaceHolderDudette",
}

local Engineer = BaseHuman:New{
	name				= "PlaceHolderDudette",
	objectName				= "<NAME>.s3o",
}

return lowerkeys({
	Dude = Dude,
	Dudette = Dudette,
	Engineer = Engineer,
})