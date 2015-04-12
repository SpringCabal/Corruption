local params = {	
    -- how far around will zombies consider targets for attacking
    ZOM_ATTACK_RADIUS            = 190,
    -- below which range all targets will be considered to be in melee
    ZOM_MIN_ATTACK_RADIUS        = 40,
    -- how juicy each target is
    ZOM_WEIGHT_CIVILIAN          = 1,
    ZOM_WEIGHT_CIVILIAN_KID      = 1.5,
    ZOM_WEIGHT_PLAYER            = 1.2,
    -- how far the zombies will patrol when there's nothing to do,
    ZOM_MAX_WANDER_RADIUS            = 60,
    ZOM_MIN_WANDER_RADIUS            = 10,
    -- how long should the zombies wait between patroling 
    ZOM_MIN_IDLE_TIME            = 60,
    ZOM_MAX_IDLE_TIME            = 300,

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
