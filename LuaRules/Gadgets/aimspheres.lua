
function gadget:GetInfo()
  return {
	name 	= "Aim sphere Fixer",
	desc	= "Sets aimi spheres to sane values",
	author	= "ashdnazg",
	date	= "",
	license	= "Public Domain",
	layer	= 0,
	enabled = true,
  }
end

if (gadgetHandler:IsSyncedCode()) then 


function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    Spring.Echo(unitID)
    local p1, p2, p3 = Spring.GetUnitCollisionVolumeData(unitID)
    Spring.SetUnitRadiusAndHeight(unitID, 1, 1)
    Spring.SetUnitMidAndAimPos(unitID, 0, 25, 0, 0, 25, 0, true)
end


end