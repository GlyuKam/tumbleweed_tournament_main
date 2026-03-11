local l11l1l1ll1ll11l11ll1 = require "List/list_tumbleweed_loots"

function gz_AddFgcLoot(l1l1l1l11ll1ll11l11l)
    if type(l1l1l1l11ll1ll11l11l) ~= "table" then
        return
    end
    for ll1l11l11l11ll1ll11l, l1ll1l1ll1ll1l1l1l1l in ipairs(l1l1l1l11ll1ll11l11l)
    do
        table["insert"](l11l1l1ll1ll11l11ll1, l1ll1l1ll1ll1l1l1l1l)
    end

end

GLOBAL["gz_AddFgcLoot"] = gz_AddFgcLoot

function gz_RemoveFgcLoot(l11ll11ll11ll11l11l1)
    if type(l11ll11ll11ll11l11l1) ~= "string" then
        return
    end
    for ll11ll11l1l11ll11l1l = # l11l1l1ll1ll11l11ll1, 1, - 1
    do
        if l11l1l1ll1ll11l11ll1[ll11ll11l1l11ll11l1l] and l11l1l1ll1ll11l11ll1[ll11ll11l1l11ll11l1l]["item"] == l11ll11ll11ll11l11l1 then
            table["remove"](l11l1l1ll1ll11l11ll1, ll11ll11l1l11ll11l1l)
        end
    end

end

GLOBAL["gz_RemoveFgcLoot"] = gz_RemoveFgcLoot

function DC_PlayerSay(l1l1ll11l1l1ll11ll11, ll1ll1l11ll11ll11ll1)
    if l1l1ll11l1l1ll11ll11 and l1l1ll11l1l1ll11ll11["components"]["talker"] then
        l1l1ll11l1l1ll11ll11:DoTaskInTime(0.1, function()
            l1l1ll11l1l1ll11ll11["components"]["talker"]:Say(ll1ll1l11ll11ll11ll1)
        end
        )
    end

end

GLOBAL["DC_PlayerSay"] = DC_PlayerSay

function gz_SetMaxPlayers(ll1l11l1ll1l1ll1l1ll)
    TheNet:SetDefaultMaxPlayers(ll1l11l1ll1l1ll1l1ll)

end

GLOBAL["gz_SetMaxPlayers"] = gz_SetMaxPlayers

local l1l11l1l11ll1l1l1ll1 = GetModConfigData "gz_MaxPlayers"

if l1l11l1l11ll1l1l1ll1 then
    gz_SetMaxPlayers(l1l11l1l11ll1l1l1ll1)

end

function gz_PrintPointPos()
    print "==================================="
    local l1l11l11l1l1ll1ll1ll, ll11l1l1ll11ll1l1l1l, l1l1l1l1l1l1l1ll1l11 = ThePlayer["Transform"]:GetWorldPosition()
    local ll11l1l1l1l1ll1l1l11, ll1l1l1l11ll1ll11ll1, ll1ll1l11l1ll1l1l11l = TheWorld["Map"]:GetTileCenterPoint(l1l11l11l1l1ll1ll1ll, ll11l1l1ll11ll1l1l1l, l1l1l1l1l1l1l1ll1l11)
    local ll1ll11l11ll1ll1ll1l, l1l11l11l1l1l1ll1ll1, ll1ll11l1ll1ll1l11ll = TUNING["gz_multiplayer_point"]:Get()
    for l1l1l11ll1l1l1ll1l11 = - 2, 2, 1
    do
        for ll11l1ll11l11ll1l11l = - 2, 2, 1
        do
            local l11ll1l11l11l1l1ll11 = ll11l1l1l1l1ll1l1l11 + 4 * l1l1l11ll1l1l1ll1l11
            local ll1l11l1ll1ll1l1l11l = ll1ll1l11l1ll1l1l11l + 4 * ll11l1ll11l11ll1l11l
            if TheWorld["Map"]:GetTileAtPoint(l11ll1l11l11l1l1ll11, 0, ll1l11l1ll1ll1l1l11l) == WORLD_TILES["MONKEY_DOCK"] then
                print("{", l11ll1l11l11l1l1ll11 - ll1ll11l11ll1ll1ll1l, ",", ll1l11l1ll1ll1l1l11l - ll1ll11l1ll1ll1l11ll, "},")
            end
        end
    end

end

GLOBAL["gz_PrintPointPos"] = gz_PrintPointPos