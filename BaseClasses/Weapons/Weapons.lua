local MeleeBase = Weapon:New {
    weaponType              = "Melee",
    impactOnly              = true,
    noSelfDamage            = true,
    
    range                   = 20,
    --soundStart              = [[BladeSwing]],
    --rgbColor                = "1 0.25 0",
}

return {
    MeleeBase = MeleeBase,
}