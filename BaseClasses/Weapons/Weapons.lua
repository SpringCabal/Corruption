local MeleeBase = Weapon:New {
    weaponType              = "Melee",
    impactOnly              = true,
    noSelfDamage            = true,
    range                   = 20,
    impulseFactor           = 0,
--     turret                  = true,

    -- beam specific
--     minIntensity            = 1,
--     beamTime                = 0,
--     rgbColor                = {0,0,0},
--     turret                  = true,
}

return {
    MeleeBase = MeleeBase,
}