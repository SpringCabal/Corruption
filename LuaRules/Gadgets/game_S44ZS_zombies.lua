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

local params = VFS.Include("LuaRules/header/sharedParams.lua")

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

function gadget:UnitIdle(unitID, unitDefID, unitTeam)
    local zombie = zombies[unitID]
    if zombie ~= nil then
        
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

    for zombieID, zombie in pairs(zombies) do
        local zombieTeamID = Spring.GetUnitTeam(zombieID)

        local x, y, z = Spring.GetUnitPosition(zombieID)
        local nearbyUnits = Spring.GetUnitsInCylinder(x, z, params.ZOM_ATTACK_RADIUS)
        local potentialTargets = {}
        for _, unitID in pairs(nearbyUnits) do
            if Spring.GetUnitTeam(unitID) ~= zombieTeamID and not Spring.GetUnitNeutral(unitID) and not Spring.GetUnitIsDead(unitID) then
                table.insert(potentialTargets, { 
                    unitID = unitID, 
                    pos = {Spring.GetUnitPosition(unitID)}
                })
            end
        end
        Spring.Log(LOG_SECTION, LOG_LEVEL, "potential zombie targets", #potentialTargets)
        if #potentialTargets > 0 then
            local bestValue = -math.huge
            local bestUnitID
            for _, target in pairs(potentialTargets) do
                local tx, tz = target.pos[1], target.pos[3]
                local d = (tx - x) * (tx - x) + (tz - z) * (tz - z)
                -- we avoid using sqrt here by squaring the min attack radius instead
                d = math.max(params.ZOM_MIN_ATTACK_RADIUS * params.ZOM_MIN_ATTACK_RADIUS, d)
                local weight = 1
                local targetDef = UnitDefs[Spring.GetUnitDefID(target.unitID)]
                if target.kid and target.civilian then
                    weight = params.ZOM_WEIGHT_CIVILIAN_KID
                elseif target.civilian then
                    weight = params.ZOM_WEIGHT_CIVILIAN
                elseif target.player then
                    weight = params.ZOM_WEIGHT_PLAYER
                end
                local value = weight / d
                if value > bestValue then
                    bestValue = value
                    bestUnitID = target.unitID
                end
            end
            Spring.Log(LOG_SECTION, LOG_LEVEL, "zombie fight target", zombieID, bestUnitID)
            Spring.GiveOrderToUnit(zombieID, CMD.FIGHT, {bestUnitID}, {})
        -- nothing to attack, so maybe wander around if idle?
        elseif Spring.GetUnitCommands(zombieID, 0) == 0 then
            Spring.Log(LOG_SECTION, LOG_LEVEL, "zombie is bored", zombieID)
            -- zombie should try to be anchored to the original position so he doesn't wander too far away
            if zombie.orig == nil and not zombie.wandering then
                zombie.orig = { x=x, y=y, z=z }
            end
            zombie.wandering = false
            -- calculate the time of the wander if not set
            if zombie.wanderTime == nil then
                zombie.wanderTime = Spring.GetGameFrame() + math.random(params.ZOM_MAX_IDLE_TIME - params.ZOM_MIN_IDLE_TIME) + params.ZOM_MIN_IDLE_TIME
            -- check if it's time to start wandering around
            elseif Spring.GetGameFrame() > zombie.wanderTime then
                Spring.Log(LOG_SECTION, LOG_LEVEL, "bored zombie gets fight order", zombieID)
                -- randomize the wander position and reset the time
                local dx = math.random(params.ZOM_MAX_WANDER_RADIUS - params.ZOM_MIN_WANDER_RADIUS) + params.ZOM_MIN_WANDER_RADIUS
                local dz = math.random(params.ZOM_MAX_WANDER_RADIUS- params.ZOM_MIN_WANDER_RADIUS) + params.ZOM_MIN_WANDER_RADIUS
                if math.random(0, 1) > 0.5 then
                    dx = -dx
                end
                if math.random(0, 1) > 0.5 then
                    dz = -dz
                end
                Spring.GiveOrderToUnit(zombieID, CMD.FIGHT, {zombie.orig.x + dx, zombie.orig.y + y, zombie.orig.z + dz}, {})
                zombie.wanderTime = nil
                zombie.wandering = true
            end
        -- a zombie was given a real order, so clear the original position
        elseif not zombie.wandering then
            zombie.orig = nil
        end
    end
end

end
