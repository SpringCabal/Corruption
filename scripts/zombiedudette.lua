cube006=piece"Cube_006"

function script.Killed(recentDamage, maxHealth)
    return 1
end

----aiming & fire weapon
function script.AimFromWeapon1() 
    return cube006 
end

function script.QueryWeapon1() 
    return cube006
end

function script.AimWeapon1(heading, pitch)
    --aiming animation: instantly turn the gun towards the enemy
    return true
end

function script.FireWeapon1()
    return true
end

function script.Activate()
    return 1
end

function script.Deactivate()
    return 0
end

function script.QueryBuildInfo()
    return cube006 
end

function script.QueryNanoPiece()
    return cube006
end
