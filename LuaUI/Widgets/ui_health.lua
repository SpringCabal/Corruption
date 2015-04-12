-- WIP
function widget:GetInfo()
	return {
		name    = 'Health Bar',
		desc    = 'Displays players health bar',
		author  = 'Bluestone, Funkencool',
		date    = 'April, 2015',
		license = 'GNU GPL v2',
        layer = 0,
		enabled = true,
	}
end
-------------------------------------------
-- Chili vars
-------------------------------------------
local Chili, window0
-------------------------------------------
-- Local vars
-------------------------------------------
local spGetTeamnameources = Spring.GetTeamnameources
local spGetMyTeamID      = Spring.GetMyTeamID
local myTeamID = spGetMyTeamID()

local images = {
	health  = 'luaui/images/heart.png',
}

local meter = {}

-- Colors
local green        = {0.2, 1.0, 0.2, 1.0}
local red          = {1.0, 0.2, 0.2, 1.0}
local greenOutline = {0.2, 1.0, 0.2, 0.2}
local redOutline   = {1.0, 0.2, 0.2, 0.2}
local fullyLoaded = false -- to stop making "set X to Y" remarks when we are just reloading the config on init

local playerUnitID

-------------------------------------------
-- Auxiliary functions
-------------------------------------------
function format(num, idp)
  return string.format("%." .. (idp or 0) .. "f", num)
end
-------------------------------------------
-- Main
-------------------------------------------
local function initWindow()
	local screen0 = Chili.Screen0
	
	window = Chili.Panel:New{
		parent    = screen0,
		right     = 0, 
		y         = 0, 
		width     = 400, 
		height    = 60, 
		minHeight = 20, 
		padding   = {0,0,0,0},
	}

end

local function makeBar(name)
	
	local control = Chili.Control:New{
		parent    = window,
		name      = name,
		x         = 0,
		y         = 0,
		height    = '100%',
		width     = '100%',
		padding   = {10,10,10,10},
	}
	
	meter[name] = Chili.Progressbar:New{
		parent = control, 
		x      = 0, 
        y      = 0,
		bottom = 0, 
		right  = 0,
	}
	
    --[[
	Chili.Image:New{
		file   = image[name],
		height = 24,
		width  = 24,
		x      = 86, 
		y      = 3, 
		parent = control
	}
    ]]
end


-- Updates 
local function SetBarValue(name,value,maxValue)
	meter[name]:SetValue(value)
    meter[name]:SetMinMax(0,maxValue)
	meter[name]:SetCaption(tostring(math.floor(value))..'/'..tostring(math.floor(maxValue)))
end
function SetBarColor(name,r,g,b,a)
    meter[name]:SetColor(0.2,1.0,0.2,a)
end
-------------------------------------------
-- Callins
-------------------------------------------

function updateHealthBar()
    -- FIXME, recognize players units
    if not playerUnitID or not Spring.ValidUnitID(playerUnitID) then 
        local units = Spring.GetAllUnits()
        playerUnitID = units[1]
        if not Spring.ValidUnitID(playerUnitID) then return end
    end
    
    local h,mh = Spring.GetUnitHealth(playerUnitID)
    SetBarValue('health', h, mh)
    SetBarColor('health', 0.2+0.75*(1-h/mh), 0.2+0.75*h/mh, 0.2,0.8)
end

function widget:GameFrame(n)
    updateHealthBar()
end

function widget:CommandsChanged()
	myTeamID = spGetMyTeamID()
end

function widget:Initialize()
	Spring.SendCommands('resbar 0')
	Chili = WG.Chili
	initWindow()
	makeBar('health')
    if Spring.GetGameFrame()>0 then
        updateHealthBar()
    end
end


function widget:Shutdown()
	Spring.SendCommands('resbar 1')
end
