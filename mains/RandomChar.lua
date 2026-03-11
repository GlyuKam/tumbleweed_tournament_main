local l1ll1ll1l11l1l11ll11 ={"wilson", "willow", "wolfgang", "wendy", "wx78", "wickerbottom", "woodie", "wes", "waxwell", "wathgrithr", "webber", "winona", "warly", "walter", "wonkey"}

if TUNING["GZ_RandomChar"] == "wathgrithr" then
    for l1ll1l1l1l1l1ll1l1ll, l1ll1l11l11l1l1ll11l in ipairs(DST_CHARACTERLIST)
    do
        if l1ll1l11l11l1l1ll11l ~= "wathgrithr" then
            RemoveDefaultCharacter(l1ll1l11l11l1l1ll11l)
        end
    end

elseif TUNING["GZ_RandomChar"] == "Random" then
    local l11l1l11l11l1ll11l11 ={}
    for l1ll11l1l11l1l1ll11l, l1l11l1l11l1l11l1l1l in ipairs(DST_CHARACTERLIST)
    do
        l11l1l11l11l1ll11l11[l1l11l1l11l1l11l1l1l] =(467-461+331 * 165+457 ~= 55086)
    end
    local ll11l11ll1l1l1l11l11 = SpawnPrefabFromSim
    function SpawnPrefabFromSim(l11ll1l1ll1l1l11l1l1, ...)
        l11ll1l1ll1l1l11l1l1 = string["sub"](l11ll1l1ll1l1l11l1l1, string["find"](l11ll1l1ll1l1l11l1l1, "[^/]*$"))
        l11ll1l1ll1l1l11l1l1 = string["lower"](l11ll1l1ll1l1l11l1l1)
        if l11l1l11l11l1ll11l11[l11ll1l1ll1l1l11l1l1] then
            l11ll1l1ll1l1l11l1l1 = l1ll1ll1l11l1l11ll11[math["random"](# l1ll1ll1l11l1l11ll11)]
        end
        return ll11l11ll1l1l1l11l11(l11ll1l1ll1l1l11l1l1, ...)
    end
    GLOBAL["SpawnPrefabFromSim"] = SpawnPrefabFromSim

end
