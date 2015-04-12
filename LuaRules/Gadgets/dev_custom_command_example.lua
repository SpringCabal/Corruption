
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

if (gadgetHandler:IsSyncedCode()) then 

local spInsertUnitCmdDesc		= Spring.InsertUnitCmdDesc

local tooltipText = 'MOOOOOOOOOOOOOOOOO'

local NewCmdDesc = {
	id		= NEW_COMMAND_ID,
	type	= CMDTYPE.ICON_UNIT_OR_RECTANGLE,
	name	= 'NewCommand',
	action	= 'someaction',
	cursor	= 'attack',
	tooltip	= tooltipText,
	hidden	= false,
}


function gadget:Initialize()
	-- register command
	gadgetHandler:RegisterCMDID(NEW_COMMAND_ID)

	-- load active units
	for _, unitID in pairs(Spring.GetAllUnits()) do
		gadget:UnitCreated(unitID, spGetUnitDefID(unitID), spGetUnitTeam(unitID))
	end

end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	spInsertUnitCmdDesc(unitID, NewCmdDesc)
end

end
