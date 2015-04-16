-- include "toolKit.lua"

staff=piece"staff"
head=piece"pelvis"

-- corUptionCounter=0
-- timeNeededCounter=9000
-- teamid=Spring.GetUnitTeam(unitID)
-- insertIntoGlobalTable(unitID,"ExoCoruptionLevel",0)
-- function BuffCurseFunction()
-- local val =GG.ExoCoruptionLevel[teamid][unitID]
-- --GetValueLevel
-- 
-- --CorruptUnit
-- 
-- --or free Civilian
-- 
-- end

-- function closeCombatRoundHouseKick(weaponRange,damage,boolFriendlyFire)
-- x,y,z=Spring.GetUnitPosition(unitID)
-- T=grabEveryone(unitID,x,z,weaponRange)
-- 	if T then
-- 	T=forTableUseFunction(T,
-- 						function(id) ux,uy,uz=Spring.GetUnitPosition(id);
-- 									Spring.SpawnCEG("dust",ux,uy+15,uz,0,0,20);
-- 									ux,uy,uz=x-ux,y-uy,z-uz;
-- 									Spring.AddUnitImpulse(id,ux,uy,uz);
-- 									end,
-- 						function(id) Spring.AddUnitDamage(id,damage) end,
-- 						
-- 	end
-- end

function script.Killed(recentDamage, maxHealth)
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
