
function gadget:GetInfo()
  return {
	name 	= "A custom command",
	desc	= "Adds a custom command to all units",
	author	= "Bluestone",
	date	= "",
	license	= "Bring me sunshine",
	layer	= 0,
	enabled = true,
  }
end


local NEW_COMMAND_ID = 39500 --randomish #

--export to CMD table
CMD.NEW_COMMAND_ID = NEW_COMMAND_ID
CMD[NEW_COMMAND_ID] = 'NEW_COMMAND'

LOG_SECTION = "leech-hp"
LOG_LEVEL = LOG.NOTICE

if (gadgetHandler:IsSyncedCode()) then 

local spInsertUnitCmdDesc		= Spring.InsertUnitCmdDesc

local tooltipText = 'MOOOOOOOOOOOOOOOOO'

local NewCmdDesc = {
	id		= NEW_COMMAND_ID,
	type	= CMDTYPE.ICON_UNIT,
	name	= 'NewCommand',
	action	= 'someaction',
	cursor	= 'cursorattack',
	tooltip	= tooltipText,
	hidden	= false,
}


function gadget:Initialize()
	-- register command
	gadgetHandler:RegisterCMDID(NEW_COMMAND_ID)

	-- load active units
	for _, unitID in pairs(Spring.GetAllUnits()) do
		gadget:UnitCreated(unitID, Spring.GetUnitDefID(unitID), Spring.GetUnitTeam(unitID))
	end

end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	spInsertUnitCmdDesc(unitID, NewCmdDesc)
end
--[[
function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
    Spring.Log(LOG_SECTION, LOG_LEVEL, "unitcommand")
    if cmdID == NEW_COMMAND_ID then
        Spring.Log("Scened", LOG.NOTICE,"My command!")
    end
end

function gadget:CommandFallback(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag)
    Spring.Log(LOG_SECTION, LOG_LEVEL, "fallback")
    if cmdID == NEW_COMMAND_ID then
        Spring.Log("Scened", LOG.NOTICE,"My command fallback!")
    end
end]]

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
    if cmdID == NEW_COMMAND_ID then
        local targetUnitID = cmdParams[1]
        Spring.Log(LOG_SECTION, LOG_LEVEL, "My command allow!", targetUnitID)
        if not Spring.GetUnitIsDead(targetUnitID) then
            Spring.Log(LOG_SECTION, LOG_LEVEL, "Take HP from " .. tostring(targetUnitID) .. " and giving to " .. tostring(unitID))
            -- take hp from unit and give to player
            -- amount depends if civilian or zombie, more hp taken from civilian
            local amount = 30
            if UnitDefs[Spring.GetUnitDefID(targetUnitID)].customParams.civilian then
                amount = amount * 3
            end
            local targetHP = Spring.GetUnitHealth(targetUnitID)
            -- can't take more health than the unit has
            amount = math.min(targetHP, amount)
            Spring.SetUnitHealth(targetUnitID, targetHP - amount)
            local unitHP, unitMaxHP = Spring.GetUnitHealth(unitID)
            Spring.SetUnitHealth(unitID, math.min(unitHP + amount, unitMaxHP))
        end
        return true
    end
    return true
end

end
