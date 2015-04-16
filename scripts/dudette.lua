
function script.HitByWeapon(x, z, weaponDefID, damage)
end

--center=piece"center"
head=piece"head"

function script.Create()
end

function script.Killed(recentDamage, _)
    return 1
end


----aiming & fire weapon
function script.AimFromWeapon1() 
    return head 
end

function script.QueryWeapon1() 
    return head
end

function script.AimWeapon1(Heading, pitch)
    --aiming animation: instantly turn the gun towards the enemy
    return true
end

function script.FireWeapon1()
    return true
end

function script.StartMoving()

end

function script.StopMoving()

end

function script.Activate()
    return 1
end

function script.Deactivate()
    return 0
end

function script.QueryBuildInfo()
    return head 
end

function script.QueryNanoPiece()
    return head
end
