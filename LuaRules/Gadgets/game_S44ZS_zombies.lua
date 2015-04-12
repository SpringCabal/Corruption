--TODO:
function gadget:GetInfo()
    return {
        name      = "Zombie behavior",
        desc      = "Handles zombie behavior for Corruption",
        author    = "gajop",
        date      = "April 2015",
        license   = "LGPL v2.1 or later",
        layer     = 1,
        enabled   = true --  loaded by default?
    }
end

local zombieTeam
if (gadgetHandler:IsSyncedCode()) then
--------------------------------------------------------------------------------
--  SYNCED
--------------------------------------------------------------------------------

local function InRadius(x1, z1, x2, z2, radius)
    return (math.abs(x1-x2) < radius or math.abs(z1-z1) < radius)
end

local LOG_SECTION = "zombie"
local LOG_LEVEL = LOG.DEBUG

local zombies = {}

----------------------------
---Call ins
----------------------------
function gadget:UnitDamaged(unitID, unitDefID, unitTeamID, _, _, _, _, attackerID, _, attackerTeamID)
    local zombie = zombies[unitID]
    if zombie ~= nil and unitTeamID ~= attackerTeamID then
        -- the current target poses no threat, switch to the attacker
        if zombie.target == nil or UnitDefs[zombie.target].customParams.civilian then
            Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {attackerID}, {})
            -- attack the attacker
        end
    end
end

function gadget:TrackUnit(unitID)
    zombies[unitID] = { }
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	zombies[unitID] = nil
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	if UnitDefs[unitDefID].customParams.zombie then
        self:TrackUnit(unitID)
	end
end

function gadget:Initialize()
    for _, unitID in ipairs(Spring.GetAllUnits()) do
        if UnitDefs[Spring.GetUnitDefID(unitID)].customParams.zombie then
            self:TrackUnit(unitID)
        end
    end
end

function gadget:GameFrame(n)
    if n % 15 ~= 0 then
        return
    end

--     for unitID, fearTime in pairs(scaredUnits) do
--         Spring.Log(LOG_SECTION, LOG_LEVEL,"scaredUnits", unitID)
--         Spring.Log(LOG_SECTION, LOG_LEVEL,unitID, fearTime)
--         if scaredUnits[unitID] > 0 then
--             scaredUnits[unitID] = scaredUnits[unitID] - 1
--         else
--             GiveOrderToUnit(unitID, CMD_STOP, {}, {})
--             scaredUnits[unitID] = 0
--         end
--         local nearestEnemy = GetUnitNearestEnemy(unitID, CIV_AWARE_RADIUS, 0)
--         if nearestEnemy ~= nil then
--             local unitDefID = GetUnitDefID(nearestEnemy)
--             local ud = UnitDefs[unitDefID]
--             local zombie = ud.customParams.zombie
--             local civX, _, civZ = GetUnitPosition(unitID)
--             Spring.Log(LOG_SECTION, LOG_LEVEL,"enemy!", zombie)
--             if zombie then
--                 local zomX, _, zomZ = GetUnitPosition(nearestEnemy)
--                 local zombieTeam = GetUnitTeam(nearestEnemy)
--                 Spring.Log(LOG_SECTION, LOG_LEVEL,"aiee a zombie!")
--                 --Flee(zomX, zomZ, unitID, zombieTeam)
--             else
--                 local guardTeam = GetUnitTeam(nearestEnemy)
--                 if (scaryTeams[guardTeam]) then
--                     if (scaryTeams[guardTeam] > 0) then
--                         local enemyX,_,enemyZ = GetUnitPosition(nearestEnemy)
--                         Spring.Log(LOG_SECTION, LOG_LEVEL,"they're the ones who shot at us!")
--                         --Flee(enemyX, enemyZ, unitID, guardTeam)
--                     else
--                         --TODO: update this to check for a team's actual retreat zone
--                         local px, py, pz = GetTeamStartPosition(guardTeam)
--                         if scaredUnits[unitID] == 0 then
--                             GiveOrderToUnit(unitID, CMD_MOVE, {px, py, pz}, {})
--                         end
--                     end
--                 end
--             end
--         end
--     end
end

end
