local function RemoveAllItem(_player)
    local player = _player["components"]["inventory"]
    if not player then
        return
    end
    local item = player["activeitem"]
    if item ~= nil then
        item:Remove()
    end
    for i = 1, player["maxslots"] do
        local item = player["itemslots"][i]
        if item ~= nil then
            item:Remove()
        end
    end
    local container = player:GetOverflowContainer()
    if container ~= nil then
        for i = 1, container["numslots"] do
            local item = container["slots"][i]
            if item ~= nil then
                item:Remove()
            end
        end
    end
    for slot, equip in pairs(player["equipslots"]) do
        if equip ~= nil then
            equip:Remove()
        end
    end

end

local l1ll11l1l11l1l1ll11l = require "prefabs/skilltree_defs"

AddPlayerPostInit(function(player)
    player["gz_RemoveAllItem"] = RemoveAllItem
    player:AddComponent "gz_player" 
    local eater = player["components"]["eater"] 
    local oldPreferToEat = eater["PrefersToEat"] 
    function eater:PrefersToEat(food, ...)
        if not TUNING["GZ_ON_GOING"] then
            DC_PlayerSay(player, STRINGS["DC_FGC"]["BUNENGJINSHI"])
            return false
        end
        return oldPreferToEat(self, food, ...)
    end
    player:DoTaskInTime(0, function()
        local skilltreeupdater = player["components"]["skilltreeupdater"] 
        skilltreeupdater:AddSkillXP(9999999)
    end
    )

end
)

local haunt_fn = ACTIONS["HAUNT"]["fn"]

ACTIONS["HAUNT"]["fn"] = function(action)
    if action["doer"]:HasTag "gz_out_game" then
        return false
    end
    if action["target"] ~= nil and action["target"]:IsValid() and action["doer"] and action["doer"]["team_manager"] then
        local team_manager = action["doer"]["team_manager"]
        local x, y, z = team_manager["Transform"]:GetWorldPosition()
        local tx, ty, tz = action["target"]["Transform"]:GetWorldPosition()
        local dx = x - tx
        local dz = z - tz
        local tangens = math["atan2"](dz, dx)
        local mult = 2
        local cosx = tx + mult * math["cos"](tangens)
        local sinz = tz + mult * math["sin"](tangens)
        if not (TheWorld["Pathfinder"]:IsClear(x, 0, z, tx, 0, tz,{ignorewalls =true, ignorecreep =true, allowocean =false}) 
            or TheWorld["Pathfinder"]:IsClear(x, 0, z, cosx, 0, sinz,{ignorewalls =true, ignorecreep =true, allowocean =false}) 
            or TheWorld["Map"]:IsOceanAtPoint(tx, ty, tz,true)) then
            return false
        end
    end
    return haunt_fn(action)

end

local common_extensions = require "prefabs/player_common_extensions"

local OnRespawnFromGhost = common_extensions["OnRespawnFromGhost"]

common_extensions["OnRespawnFromGhost"] = function(player, ...)
    if player:HasTag "gz_out_game" then
        return
    end
    return OnRespawnFromGhost(player, ...)

end
