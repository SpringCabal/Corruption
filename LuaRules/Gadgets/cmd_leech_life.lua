
function gadget:GetInfo()
  return {
	name 	= "Leech Life",
	desc	= "Implements Leech Life Command",
	author	= "Bluestone",
	date	= "",
	license	= "Bring me sunshine",
	layer	= 0,
	enabled = true,
  }
end


local CMD_LEECH_LIFE = 39400 
local cmdColour = {0.75, 0.1, 0.75, 0.7}

--export to CMD table
CMD.LEECH_LIFE = CMD_LEECH_LIFE
CMD[CMD_LEECH_LIFE] = 'LEECH_LIFE'

LOG_SECTION = "leech-life-cmd"
LOG_LEVEL = LOG.NOTICE

if (gadgetHandler:IsSyncedCode()) then 

local tooltipText = 'Leech Life'

local LeechLifeCmdDesc = {
	id		= CMD_LEECH_LIFE,
	type	= CMDTYPE.ICON_UNIT,
	name	= 'leechlife',
	action	= 'leechlife',
	tooltip	= tooltipText,
	hidden	= false,
}


function gadget:Initialize()
	-- register command
	gadgetHandler:RegisterCMDID(CMD_LEECH_LIFE)

	for _, unitID in pairs(Spring.GetAllUnits()) do
		gadget:UnitCreated(unitID, Spring.GetUnitDefID(unitID), Spring.GetUnitTeam(unitID))
	end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    -- give cmd to units
	Spring.InsertUnitCmdDesc(unitID, LeechLifeCmdDesc)
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
    if cmdID ~= CMD_LEECH_LIFE then return true end
    
    -- implement leech life command
    local targetUnitID = cmdParams[1]
    if not Spring.ValidUnitID(targetUnitID) or Spring.GetUnitIsDead(targetUnitID) then return false end
    
    Spring.Log(LOG_SECTION, LOG_LEVEL, "Take HP from " .. tostring(targetUnitID) .. " and giving to " .. tostring(unitID))
            
    -- work out how much life to leech
    -- amount depends if civilian or zombie, more hp taken from civilian
    local amount = 30
    local targetDefID = Spring.GetUnitDefID(targetUnitID)
    if UnitDefs[targetDefID].customParams.civilian then
        amount = amount * 3
    end

    -- take the life
    local targetHP = Spring.GetUnitHealth(targetUnitID)
    local unitHP, unitMaxHP = Spring.GetUnitHealth(unitID)
    amount = math.min(targetHP + 1, amount) -- can't take more health than the unit has
    Spring.SetUnitHealth(targetUnitID, targetHP - amount)
    Spring.SetUnitHealth(unitID, math.min(unitHP + amount, unitMaxHP))
          
    -- tell LuaUI
    -- TODO

    return false
end



else --UNSYNCED

function gadget:Initialize()
    -- register cursor
	Spring.AssignMouseCursor("leechlife", "cursorleech", true)
	--show the command in the queue
	Spring.SetCustomCommandDrawData(CMD_LEECH_LIFE,"Leech Life",cmdColour,false)
end

end
