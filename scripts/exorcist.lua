-- include "toolKit.lua"
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

local armleft = piece('armleft');
local armright = piece('armright');
local Empty = piece('Empty');
local footleft = piece('footleft');
local footright = piece('footright');
local forearmleft = piece('forearmleft');
local forearmright = piece('forearmright');
local handleft = piece('handleft');
local handright = piece('handright');
local head = piece('head');
local kneeleft = piece('kneeleft');
local kneeright = piece('kneeright');
local pelvis = piece('pelvis');
local staff = piece('staff');
local thighleft = piece('thighleft');
local thighright = piece('thighright');
local torso = piece('torso');
local Animations = {};

function constructSkeleton(unit, piece, offset)
    if (offset == nil) then
        offset = {0,0,0};
    end

    local bones = {};
    local info = Spring.GetUnitPieceInfo(unit,piece);

    for i=1,3 do
        info.offset[i] = offset[i]+info.offset[i];
    end 

    bones[piece] = info.offset;
    local map = Spring.GetUnitPieceMap(unit);
    local children = info.children;

    if (children) then
        for i, childName in pairs(children) do
            local childId = map[childName];
            local childBones = constructSkeleton(unit, childId, info.offset);
            for cid, cinfo in pairs(childBones) do
                bones[cid] = cinfo;
            end
        end
    end        
    return bones;
end
       
local animCmd = {['turn']=Turn,['move']=Move};
function PlayAnimation(animname)
    local anim = Animations[animname];
    for i = 1, #anim do
        local commands = anim[i].commands;
        for j = 1,#commands do
            local cmd = commands[j];
            animCmd[cmd.c](cmd.p,cmd.a,cmd.t,cmd.s);
        end
        if(i < #anim) then
            local t = anim[i+1]['time'] - anim[i]['time'];
            Sleep(t*33); -- sleep works on milliseconds
        end
    end
end

--loadstring(VFS.LoadFile("scripts/exorcist_idle.lua"))()
local animation = VFS.Include("scripts/exorcist_idle.lua")
Animations[animation[1]] = animation[2]


function script.Create()
    local map = Spring.GetUnitPieceMap(unitID);
    local offsets = constructSkeleton(unitID,map.Scene, {0,0,0});
    
    for a,anim in pairs(Animations) do
        for i,keyframe in pairs(anim) do
            local commands = keyframe.commands;
            for k,command in pairs(commands) do
                -- commands are described in (c)ommand,(p)iece,(a)xis,(t)arget,(s)peed format
                -- the t attribute needs to be adjusted for move commands from blender's absolute values
                if (command.c == "move") then
                    local adjusted =  command.t - (offsets[command.p][command.a]);
                    Animations[a][i]['commands'][k].t = command.t - (offsets[command.p][command.a]);
                end
            end
        end
    end
    PlayAnimation("idle")
end
            
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
