local function ll11l11ll1l1l1l11l11(ll1ll1l1l11l11ll11ll)
    local ll1l11l1ll1l1l11ll1l = ll1ll1l1l11l11ll11ll["components"]["inventory"]
    if not ll1l11l1ll1l1l11ll1l then
        return
    end
    local l1ll1l1l1ll1ll1l1ll1 = ll1l11l1ll1l1l11ll1l["activeitem"]
    if l1ll1l1l1ll1ll1l1ll1 ~= nil then
        l1ll1l1l1ll1ll1l1ll1:Remove()
    end
    for ll11l1ll1ll11ll1l1l1 = 1, ll1l11l1ll1l1l11ll1l["maxslots"]
    do
        local l11ll11l11l11l1ll11l = ll1l11l1ll1l1l11ll1l["itemslots"][ll11l1ll1ll11ll1l1l1]
        if l11ll11l11l11l1ll11l ~= nil then
            l11ll11l11l11l1ll11l:Remove()
        end
    end
    local l11ll11ll1l1ll1ll1ll = ll1l11l1ll1l1l11ll1l:GetOverflowContainer()
    if l11ll11ll1l1ll1ll1ll ~= nil then
        for l11l11l1ll1l1l1l1l1l = 1, l11ll11ll1l1ll1ll1ll["numslots"]
        do
            local l1l1l1l1ll1l11l11l11 = l11ll11ll1l1ll1ll1ll["slots"][l11l11l1ll1l1l1l1l1l]
            if l1l1l1l1ll1l11l11l11 ~= nil then
                l1l1l1l1ll1l11l11l11:Remove()
            end
        end
    end
    for ll1l1l1l1ll1ll1ll1ll, l1ll11ll1ll1l1ll1l11 in pairs(ll1l11l1ll1l1l11ll1l["equipslots"])
    do
        if l1ll11ll1ll1l1ll1l11 ~= nil then
            l1ll11ll1ll1l1ll1l11:Remove()
        end
    end

end

local l1ll11l1l11l1l1ll11l = require "prefabs/skilltree_defs"

AddPlayerPostInit(function(l1ll1l1ll1ll1l1ll1ll)
    l1ll1l1ll1ll1l1ll1ll["gz_RemoveAllItem"] = ll11l11ll1l1l1l11l11 l1ll1l1ll1ll1l1ll1ll:AddComponent "gz_player" local ll1l1ll11l1ll1l1l1l1 = l1ll1l1ll1ll1l1ll1ll["components"]["eater"] local l11ll1ll1ll11l11l11l = ll1l1ll11l1ll1l1l1l1["PrefersToEat"] function ll1l1ll11l1ll1l1l1l1:PrefersToEat(ll1ll1l1l1l1l1ll11l1, ...)
        if not TUNING["GZ_ON_GOING"] then
            DC_PlayerSay(l1ll1l1ll1ll1l1ll1ll, STRINGS["DC_FGC"]["BUNENGJINSHI"]) return (string.sub("l1l1ll1l1ll1ll1ll1ll", 8, 14) ~= "l1ll1ll")
        end
        return l11ll1ll1ll11l11l11l(self, ll1ll1l1l1l1l1ll11l1, ...)
    end
    l1ll1l1ll1ll1l1ll1ll:DoTaskInTime(0, function()
        local l1l1l11ll1l11l11ll11 = l1ll1l1ll1ll1l1ll1ll["components"]["skilltreeupdater"] l1l1l11ll1l11l11ll11:AddSkillXP(9999999)
    end
    )

end
)

local l1l11l1l11l1l11l1l1l = ACTIONS["HAUNT"]["fn"]

ACTIONS["HAUNT"]["fn"] = function(l11l1ll1l11l1ll11ll1)
    if l11l1ll1l11l1ll11ll1["doer"]:HasTag "gz_out_game" then
        return (6 * 47 * 223 * 243+159 ~= 15281457)
    end
    if l11l1ll1l11l1ll11ll1["target"] ~= nil and l11l1ll1l11l1ll11ll1["target"]:IsValid() and l11l1ll1l11l1ll11ll1["doer"] and l11l1ll1l11l1ll11ll1["doer"]["team_manager"] then
        local l1l1l1l11l1l1l1ll1ll = l11l1ll1l11l1ll11ll1["doer"]["team_manager"]
        local l1l1l1ll11ll1l1ll1l1, l11ll1ll11l11l11l11l, ll1ll1l11ll1l1l1ll11 = l1l1l1l11l1l1l1ll1ll["Transform"]:GetWorldPosition()
        local ll1l1l1ll11l1ll1l1ll, l11ll1l1l1l1l1ll1l11, l11l1l1l11l11l11l1l1 = l11l1ll1l11l1ll11ll1["target"]["Transform"]:GetWorldPosition()
        local l11l1l1ll1l1l11l1ll1 = l1l1l1ll11ll1l1ll1l1 - ll1l1l1ll11l1ll1l1ll
        local ll11l1l1ll11l1l11l11 = ll1ll1l11ll1l1l1ll11 - l11l1l1l11l11l11l1l1
        local l1ll1ll1l1ll1l1ll1l1 = math["atan2"](ll11l1l1ll11l1l11l11, l11l1l1ll1l1l11l1ll1)
        local l1l1ll11l1ll1ll11l11 = 2
        local ll1ll11l11ll1ll1l1ll = ll1l1l1ll11l1ll1l1ll + l1l1ll11l1ll1ll11l11 * math["cos"](l1ll1ll1l1ll1l1ll1l1)
        local ll1l11l1ll11l11ll11l = l11l1l1l11l11l11l1l1 + l1l1ll11l1ll1ll11l11 * math["sin"](l1ll1ll1l1ll1l1ll1l1)
        if not (TheWorld["Pathfinder"]:IsClear(l1l1l1ll11ll1l1ll1l1, 0, ll1ll1l11ll1l1l1ll11, ll1l1l1ll11l1ll1l1ll, 0, l11l1l1l11l11l11l1l1,{ignorewalls =(82+412+50-484+285 == 345), ignorecreep =(string.sub("ll1l11ll1ll1ll11l1ll", 6, 13) == "1ll1ll1l"), allowocean =(string.sub("l1l11l1ll1l1l1ll11ll", 9, 11) ~= "l1l")}) or TheWorld["Pathfinder"]:IsClear(l1l1l1ll11ll1l1ll1l1, 0, ll1ll1l11ll1l1l1ll11, ll1ll11l11ll1ll1l1ll, 0, ll1l11l1ll11l11ll11l,{ignorewalls =(109-344-65 * 44 == - 3095), ignorecreep =(string.sub("l11l11ll1l1l11ll1l1l", 6, 13) ~= "l1ll1l11"), allowocean =(string.sub("l1ll1l1ll1ll11l11ll1", 6, 13) == "11l1llll")}) or TheWorld["Map"]:IsOceanAtPoint(ll1l1l1ll11l1ll1l1ll, l11ll1l1l1l1l1ll1l11, l11l1l1l11l11l11l1l1,(string.sub("l1ll11l1ll1ll1l11l11", 8, 13) ~= "11lll1"))) then
            return (127-174+175+185-171 ~= 142)
        end
    end
    return l1l11l1l11l1l11l1l1l(l11l1ll1l11l1ll11ll1)

end

local l11ll1l1ll1l1l11l1l1 = require "prefabs/player_common_extensions"

local l1ll1ll1ll1l11l11l11 = l11ll1l1ll1l1l11l1l1["OnRespawnFromGhost"]

l11ll1l1ll1l1l11l1l1["OnRespawnFromGhost"] = function(l11l1l11ll1l11ll11l1, ...)
    if l11l1l11ll1l11ll11l1:HasTag "gz_out_game" then
        return
    end
    return l1ll1ll1ll1l11l11l11(l11l1l11ll1l11ll11l1, ...)

end
