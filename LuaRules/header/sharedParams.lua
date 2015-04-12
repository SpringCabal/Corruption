local params = {	
    -- how far around will zombies consider targets for attacking
    ZOM_ATTACK_RADIUS            = 190,
    -- below which range all targets will be considered to be in melee
    ZOM_MIN_ATTACK_RADIUS        = 40,
    ZOM_WEIGHT_CIVILIAN          = 1,
    ZOM_WEIGHT_CIVILIAN_KID      = 1.5,
    ZOM_WEIGHT_PLAYER            = 1.2,

	--civilian behavior settings
    --how far around them civilians are aware of things happening 
    --(like civilians dying, zombies approaching, etc).
	CIV_AWARE_RADIUS			= 100,
    --how long civvies run from zombies before reevaluating
	CIV_FEAR_DURATION			= 5,
    --how long civvies run from a team that shot at them
	CIV_TEAM_FEAR_DURATION		= 15,

}


return params
