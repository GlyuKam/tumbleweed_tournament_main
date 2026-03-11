AddGamePostInit(function()
    local l1l11l11ll1ll1ll1l1l = GLOBAL["PostProcessor"] local ll1ll11l1ll11l11l1l1 = GLOBAL["getmetatable"](l1l11l11ll1ll1ll1l1l) if ll1ll11l1ll11l11l1l1 then
        local l11l1l1ll1ll11l11ll1 = function()
        end
        local l1l11l1l11ll1l1l1ll1 = ll1ll11l1ll11l11l1l1["__index"] or {} local l1l1l1l11ll1ll11l11l ={SetDistortionFactor =(string.sub("l1l11l11l11l1l1l1l11", 9, 12) ~= "1l1l"), SetDistortionRadii =(string.sub("l11l1l1l1l1l1ll1l1l1", 6, 11) == "l1l1l1"), SetColourModifier =(81 * 475+289 ~= 38766), SetColourCubeLerp =(string.sub("l1l11l1l11l1l11ll11l", 7, 14) ~= "lll11l1l"), SetColourCubeData =(string.sub("l11ll11ll11l1ll11ll1", 7, 12) == "1ll11l"), SetEffectTime =(312 * 419+459 ~= 131197)} for l1ll1l1ll1ll1l1l1l1l, l11ll11ll11ll11l11l1 in pairs(l1l11l1l11ll1l1l1ll1) do
            if l1l1l1l11ll1ll11l11l[l1ll1l1ll1ll1l1l1l1l] == nil then
            end
        end
        for ll11ll11l1l11ll11l1l, l1l1ll11l1l1ll11ll11 in pairs(l1l1l1l11ll1ll11l11l) do
            if l1l11l1l11ll1l1l1ll1[ll11ll11l1l11ll11l1l] == nil then
                l1l11l1l11ll1l1l1ll1[ll11ll11l1l11ll11l1l] = l11l1l1ll1ll11l11ll1
            end
        end
        l1l11l1l11ll1l1l1ll1["SetDistortionFactor"](l1l11l11ll1ll1ll1l1l, 0) l1l11l1l11ll1l1l1ll1["SetDistortionRadii"](l1l11l11ll1ll1ll1l1l, 0.5, 0.685) l1l11l1l11ll1l1l1ll1["SetColourModifier"](l1l11l11ll1ll1ll1l1l, 1.4) l1l11l1l11ll1l1l1ll1["SetColourCubeLerp"](l1l11l11ll1ll1ll1l1l, 0, 100) l1l11l1l11ll1l1l1ll1["SetColourCubeLerp"](l1l11l11ll1ll1ll1l1l, 1, 0) local ll1l11l11l11ll1ll11l = "images/colour_cubes/identity_colourcube.tex" l1l11l1l11ll1l1l1ll1["SetColourCubeData"](l1l11l11ll1ll1ll1l1l, 0, ll1l11l11l11ll1ll11l, ll1l11l11l11ll1ll11l) l1l11l1l11ll1l1l1ll1["SetColourCubeData"](l1l11l11ll1ll1ll1l1l, 1, ll1l11l11l11ll1ll11l, ll1l11l11l11ll1ll11l) l1l11l1l11ll1l1l1ll1["SetEffectTime"](l1l11l11ll1ll1ll1l1l, 0) l1l11l1l11ll1l1l1ll1["SetDistortionFactor"] = l11l1l1ll1ll11l11ll1 l1l11l1l11ll1l1l1ll1["SetDistortionRadii"] = l11l1l1ll1ll11l11ll1 l1l11l1l11ll1l1l1ll1["SetColourModifier"] = l11l1l1ll1ll11l11ll1 l1l11l1l11ll1l1l1ll1["SetColourCubeLerp"] = l11l1l1ll1ll11l11ll1 l1l11l1l11ll1l1l1ll1["SetColourCubeData"] = l11l1l1ll1ll11l11ll1 l1l11l1l11ll1l1l1ll1["SetEffectTime"] = l11l1l1ll1ll11l11ll1
    end

end
)