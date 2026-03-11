local l1ll1ll1l11l1l11ll11 = Class(function(self, l1ll1l1l1l1l1ll1l1ll)
    self["inst"] = l1ll1l1l1l1l1ll1l1ll self["records"] ={} l1ll1l1l1l1l1ll1l1ll:DoTaskInTime(0, function()
        self:Init()
    end
    )

end
)

function l1ll1ll1l11l1l11ll11:Init()
    self:SetReplica()

end

function l1ll1ll1l11l1l11ll11:InitPlayerData(l1ll1l11l11l1l1ll11l)
    if self["records"][l1ll1l11l11l1l1ll11l] == nil then
        self["records"][l1ll1l11l11l1l1ll11l] ={state = 1, kill = 0, death = 0, point = 0, team = 0}
    end

end

function l1ll1ll1l11l1l11ll11:SetPlayerDatas(l11l1l11l11l1ll11l11, ll11l11ll1l1l1l11l11)
    self:InitPlayerData(l11l1l11l11l1ll11l11)
    for l1ll11l1l11l1l1ll11l, l1l11l1l11l1l11l1l1l in pairs(ll11l11ll1l1l1l11l11)
    do
        self["records"][l11l1l11l11l1ll11l11]["k"] = l1l11l1l11l1l11l1l1l
    end
    self:SetReplica()

end

function l1ll1ll1l11l1l11ll11:SetPlayerData(l11ll1l1ll1l1l11l1l1, l1ll1ll1ll1l11l11l11, ll1ll1l1l11l11ll11ll)
    self:InitPlayerData(l11ll1l1ll1l1l11l1l1)
    self["records"][l11ll1l1ll1l1l11l1l1][l1ll1ll1ll1l11l11l11] = ll1ll1l1l11l11ll11ll
    self:SetReplica()

end

function l1ll1ll1l11l1l11ll11:SetReplica()
    self["inst"]["replica"]["dc_fgc_net"]:SetRecords(json["encode"](self["records"]))

end

return l1ll1ll1l11l1l11ll11