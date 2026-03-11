local l1l11l1l11ll1l1l1ll1 ={hit =(246+424-313 * 380 == - 118270), armorbroke =(146-424+388-235 * 150 == - 35140), knockout =(146+451-226+139 ~= 519), frozen =(string.sub("ll1l1l11ll1ll1ll11l1", 8, 13) ~= "lll1ll"), hit_spike =(string.sub("l1ll11l1l1l11l1l11l1", 8, 11) == "1l1l")}

AddGlobalClassPostConstruct("stategraph", "StateGraphInstance", function(self)
    local l1ll1l1ll1ll1l1l1l1l = self["GoToState"] function self:GoToState(l11ll11ll11ll11l11l1, ll11ll11l1l11ll11l1l, ...)
        if type(self["currentstate"]) == "table" and self["currentstate"]["name"] == "death" and type(self["sg"]) == "table" and self["sg"]["name"] == "wilson" and l1l11l1l11ll1l1l1ll1[l11ll11ll11ll11l11l1] then
            return
        end
        return l1ll1l1ll1ll1l1l1l1l(self, l11ll11ll11ll11l11l1, ll11ll11l1l11ll11l1l, ...)
    end

end
)

local function l1l1l1l11ll1ll11l11l(l1l1ll11l1l1ll11ll11)
    local ll1ll1l11ll11ll11ll1 = l1l1ll11l1l1ll11ll11["KillFX"]
    l1l1ll11l1l1ll11ll11["KillFX"] = function(l1l1ll11l1l1ll11ll11, ...)
        if not l1l1ll11l1l1ll11ll11:IsValid() then
            return
        end
        if ll1ll1l11ll11ll11ll1 then
            ll1ll1l11ll11ll11ll1(l1l1ll11l1l1ll11ll11, ...)
        end
    end

end

AddPrefabPostInit("deer_ice_charge", l1l1l1l11ll1ll11l11l)
AddPrefabPostInit("deer_fire_charge", l1l1l1l11ll1ll11l11l)

local function ll1l11l11l11ll1ll11l(ll1l11l1ll1l1ll1l1ll)
    local l1l11l11l1l1ll1ll1ll = ll1l11l1ll1l1ll1l1ll["AlignToTarget"]
    ll1l11l1ll1l1ll1l1ll["AlignToTarget"] = function(ll1l11l1ll1l1ll1l1ll, ll11l1l1ll11ll1l1l1l, l1l1l1l1l1l1l1ll1l11, ...)
        if not ll11l1l1ll11ll1l1l1l:IsValid() then
            return
        end
        if not l1l1l1l1l1l1l1ll1l11:IsValid() then
            return
        end
        if l1l11l11l1l1ll1ll1ll then
            l1l11l11l1l1ll1ll1ll(ll1l11l1ll1l1ll1l1ll, ll11l1l1ll11ll1l1l1l, l1l1l1l1l1l1l1ll1l11, ...)
        end
    end

end

AddPrefabPostInit("sparks", ll1l11l11l11ll1ll11l)
AddPrefabPostInit("electrichitsparks", ll1l11l11l11ll1ll11l)

AddPrefabPostInit("fire", function(ll11l1l1l1l1ll1l1l11)
    local ll1l1l1l11ll1ll11ll1 = ll11l1l1l1l1ll1l1l11["components"]["firefx"]["extinguishsoundtest"] ll11l1l1l1l1ll1l1l11["components"]["firefx"]["extinguishsoundtest"] = function(...)
        if not ll11l1l1l1l1ll1l1l11:IsValid() then
            return
        end
        if ll1l1l1l11ll1ll11ll1 then
            ll1l1l1l11ll1ll11ll1(...)
        end
    end

end
)

AddComponentPostInit("burnable", function(self)
    local ll1ll1l11l1ll1l1l11l = self["KillFX"] function self:KillFX(...)
        for ll1ll11l1ll1ll1l11ll = # self["fxchildren"], 1, - 1 do
            local l1l1l11ll1l1l1ll1l11 = self["fxchildren"][ll1ll11l1ll1ll1l11ll] if not l1l1l11ll1l1l1ll1l11:IsValid() then
                table["remove"](self["fxchildren"], ll1ll11l1ll1ll1l11ll)
            end
        end
        return ll1ll1l11l1ll1l1l11l(self, ...)
    end
    local ll1ll11l11ll1ll1ll1l = self["SpawnFX"] function self:SpawnFX(...)
        if self["inst"]:IsValid() then
            return ll1ll11l11ll1ll1ll1l(self, ...)
        end
    end
    local l1l11l11l1l1l1ll1ll1 = self["Ignite"] function self:Ignite(...)
        if self["inst"]:IsValid() then
            return l1l11l11l1l1l1ll1ll1(self, ...)
        end
    end

end
)

AddComponentPostInit("planarentity", function(self)
    local ll11l1ll11l11ll1l11l = self["OnResistNonPlanarAttack"] function self:OnResistNonPlanarAttack(l11ll1l11l11l1l1ll11, ...)
        if not (l11ll1l11l11l1l1ll11 and l11ll1l11l11l1l1ll11:IsValid()) then
            l11ll1l11l11l1l1ll11 = nil
        end
        return ll11l1ll11l11ll1l11l(self, l11ll1l11l11l1l1ll11, ...)
    end

end
)

AddComponentPostInit("combat", function(self)
    local ll1l11l1ll1ll1l1l11l = self["SetTarget"] function self:SetTarget(l11l11l1l11ll1l1l11l, ...)
        if (self["inst"] ~= nil and not self["inst"]:IsValid()) then
            return
        end
        if (l11l11l1l11ll1l1l11l ~= nil and not l11l11l1l11ll1l1l11l:IsValid()) then
            return
        end
        return ll1l11l1ll1ll1l1l11l(self, l11l11l1l11ll1l1l11l, ...)
    end
    local l1l1ll1ll11ll1ll1l1l = self["GetAttacked"] function self:GetAttacked(ll1l1ll1ll11ll11ll11, ...)
        if (self["inst"] ~= nil and not self["inst"]:IsValid()) then
            return
        end
        if (ll1l1ll1ll11ll11ll11 ~= nil and not ll1l1ll1ll11ll11ll11:IsValid()) then
            return
        end
        return l1l1ll1ll11ll1ll1l1l(self, ll1l1ll1ll11ll11ll11, ...)
    end

end
)