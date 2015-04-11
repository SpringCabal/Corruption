Claw = Weapon:New {
    name                    = "Claw",
    weaponType              = "Melee",
    impactOnly              = true,
    noSelfDamage            = true,

    damage                  = {
        default = 20.1,
    },
    range                   = 100,
    reloadtime              = 1.0,
    --soundStart              = [[BladeSwing]],
    --rgbColor                = "1 0.25 0",
}

return {
    Claw = Claw,
}