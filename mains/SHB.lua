local l1ll1ll1ll1l11l11l11 = function(ll1l1l1l1ll1ll1ll1ll, l1ll11ll1ll1l1ll1l11, l1ll1l1ll1ll1l1ll1ll, ll1l1ll11l1ll1l1l1l1)
    ll1l1l1l1ll1ll1ll1ll = ll1l1l1l1ll1ll1ll1ll or 1
    l1ll11ll1ll1l1ll1l11 = l1ll11ll1ll1l1ll1l11 or 1
    l1ll1l1ll1ll1l1ll1ll = l1ll1l1ll1ll1l1ll1ll or 1
    ll1l1ll11l1ll1l1l1l1 = ll1l1ll11l1ll1l1l1l1 or 1
    local l11ll1ll1ll11l11l11l ={r = ll1l1l1l1ll1ll1ll1ll, g = l1ll11ll1ll1l1ll1l11, b = l1ll1l1ll1ll1l1ll1ll, a = ll1l1ll11l1ll1l1l1l1}
    l11ll1ll1ll11l11l11l["Get"] = function(self)
        return self["r"], self["g"], self["b"], self["a"]
    end
    return l11ll1ll1ll11l11l11l

end

local ll1ll1l1l11l11ll11ll ={New = l1ll1ll1ll1l11l11l11, Red = l1ll1ll1ll1l11l11l11(1, 0, 0, 1), Green = l1ll1ll1ll1l11l11l11(0, 1, 0, 1), Blue = l1ll1ll1ll1l11l11l11(0, 0, 1, 1), White = l1ll1ll1ll1l11l11l11(1, 1, 1, 1), Black = l1ll1ll1ll1l11l11l11(0, 0, 0, 1), Yellow = l1ll1ll1ll1l11l11l11(1, 1, 0, 1), Magenta = l1ll1ll1ll1l11l11l11(1, 0, 1, 1), Cyan = l1ll1ll1ll1l11l11l11(0, 1, 1, 1), Gray = l1ll1ll1ll1l11l11l11(0.5, 0.5, 0.5, 1), Orange = l1ll1ll1ll1l11l11l11(1, 0.5, 0, 1), Purple = l1ll1ll1ll1l11l11l11(0.5, 0, 1, 1)}

local function ll1l11l1ll1l1l11ll1l(ll1ll1l1l1l1l1ll11l1, l1l1l11ll1l11l11ll11)
    GLOBAL["TheNet"]:Say(ll1ll1l1l1l1l1ll11l1, l1l1l11ll1l11l11ll11)

end

local function l1ll1l1l1ll1ll1l1ll1(l11l1ll1l11l1ll11ll1)
    l11l1ll1l11l1ll11ll1 = l11l1ll1l11l1ll11ll1 or "heart"
    if type(l11l1ll1l11l1ll11ll1) ~= "string" then
        l11l1ll1l11l1ll11ll1 = "heart"
    end
    l11l1ll1l11l1ll11ll1 = string["lower"](l11l1ll1l11l1ll11ll1)
    if l11l1ll1l11l1ll11ll1 == "heart" then
        return {c1 = "♡", c2 = "♥"}
    elseif l11l1ll1l11l1ll11ll1 == "circle" then
        return {c1 = "○", c2 = "●"}
    elseif l11l1ll1l11l1ll11ll1 == "square" then
        return {c1 = "□", c2 = "■"}
    elseif l11l1ll1l11l1ll11ll1 == "diamond" then
        return {c1 = "◇", c2 = "◆"}
    elseif l11l1ll1l11l1ll11ll1 == "star" then
        return {c1 = "☆", c2 = "★"}
    elseif l11l1ll1l11l1ll11ll1 == "hidden" then
        return {c1 = " ", c2 = " "}
    end
    return {c1 = "=", c2 = "#", isBasic =(string.sub("l11ll1l11l11l11l1l1l", 6, 11) == "1l11l1")}

end

local function l11ll11ll1l1ll1ll1ll()
    if not GLOBAL["TheWorld"] then
        return
    end
    TUNING["DYC_HEALTHBAR_FORCEUPDATE"] =(string.sub("l11l1l1ll1l1l1l1l1l1", 8, 12) == "ll1l1")
    GLOBAL["TheWorld"]:DoTaskInTime(GLOBAL["FRAMES"] * 4, function()
        TUNING["DYC_HEALTHBAR_FORCEUPDATE"] =(string.sub("ll1l1l1ll1ll11l11ll1", 9, 12) == "11ll")
    end
    )

end

table["insert"](PrefabFiles, "dychealthbar")

GLOBAL["SHB"] ={}
GLOBAL["shb"] = GLOBAL["SHB"]
GLOBAL["SimpleHealthBar"] = GLOBAL["SHB"]

local ll11l1ll1ll11ll1l1l1 = GLOBAL["SHB"]

ll11l1ll1ll11ll1l1l1["SetColor"] = function(l1l1l1l11l1l1l1ll1ll, l1l1l1ll11ll1l1ll1l1, l11ll1ll11l11l11l11l)
    if l1l1l1l11l1l1l1ll1ll and type(l1l1l1l11l1l1l1ll1ll) == "string" then
        local ll1ll1l11ll1l1l1ll11 = string["lower"](l1l1l1l11l1l1l1ll1ll)
        for ll1l1l1ll11l1ll1l1ll, l11ll1l1l1l1l1ll1l11 in pairs(ll1ll1l1l11l11ll11ll)
        do
            if string["lower"](ll1l1l1ll11l1ll1l1ll) == ll1ll1l11ll1l1l1ll11 and type(l11ll1l1l1l1l1ll1l11) == "table" then
                TUNING["DYC_HEALTHBAR_COLOR"] = l11ll1l1l1l1l1ll1l11
                l11ll11ll1l1ll1ll1ll()
                return
            end
        end
    elseif l1l1l1l11l1l1l1ll1ll and l1l1l1ll11ll1l1ll1l1 and l11ll1ll11l11l11l11l and type(l1l1l1l11l1l1l1ll1ll) == "number" and type(l1l1l1ll11ll1l1ll1l1) == "number" and type(l11ll1ll11l11l11l11l) == "number" then
        TUNING["DYC_HEALTHBAR_COLOR"] = ll1ll1l1l11l11ll11ll["New"](l1l1l1l11l1l1l1ll1ll, l1l1l1ll11ll1l1ll1l1, l11ll1ll11l11l11l11l)
        l11ll11ll1l1ll1ll1ll()
        return
    end
    TUNING["DYC_HEALTHBAR_COLOR"] = nil l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["setcolor"] = ll11l1ll1ll11ll1l1l1["SetColor"]
ll11l1ll1ll11ll1l1l1["SETCOLOR"] = ll11l1ll1ll11ll1l1l1["SetColor"]
ll11l1ll1ll11ll1l1l1["SetLength"] = function(l11l1l1l11l11l11l1l1)
    l11l1l1l11l11l11l1l1 = l11l1l1l11l11l11l1l1 or 10
    if type(l11l1l1l11l11l11l1l1) ~= "number" then
        l11l1l1l11l11l11l1l1 = 10
    end
    l11l1l1l11l11l11l1l1 = math["floor"](l11l1l1l11l11l11l1l1)
    if l11l1l1l11l11l11l1l1 < 1 then
        l11l1l1l11l11l11l1l1 = 1
    end
    if l11l1l1l11l11l11l1l1 > 100 then
        l11l1l1l11l11l11l1l1 = 100
    end
    TUNING["DYC_HEALTHBAR_CNUM"] = l11l1l1l11l11l11l1l1
    l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["setlength"] = ll11l1ll1ll11ll1l1l1["SetLength"]
ll11l1ll1ll11ll1l1l1["SETLENGTH"] = ll11l1ll1ll11ll1l1l1["SetLength"]
ll11l1ll1ll11ll1l1l1["SetDuration"] = function(l11l1l1ll1l1l11l1ll1)
    l11l1l1ll1l1l11l1ll1 = l11l1l1ll1l1l11l1ll1 or 8
    if type(l11l1l1ll1l1l11l1ll1) ~= "number" then
        l11l1l1ll1l1l11l1ll1 = 8
    end
    if l11l1l1ll1l1l11l1ll1 < 4 then
        l11l1l1ll1l1l11l1ll1 = 4
    end
    if l11l1l1ll1l1l11l1ll1 > 999999 then
        l11l1l1ll1l1l11l1ll1 = 999999
    end
    TUNING["DYC_HEALTHBAR_DURATION"] = l11l1l1ll1l1l11l1ll1

end

ll11l1ll1ll11ll1l1l1["setduration"] = ll11l1ll1ll11ll1l1l1["SetDuration"]
ll11l1ll1ll11ll1l1l1["SETDURATION"] = ll11l1ll1ll11ll1l1l1["SetDuration"]
ll11l1ll1ll11ll1l1l1["SetStyle"] = function(ll11l1l1ll11l1l11l11, l1ll1ll1l1ll1l1ll1l1)
    if ll11l1l1ll11l1l11l11 and l1ll1ll1l1ll1l1ll1l1 and type(ll11l1l1ll11l1l11l11) == "string" and type(l1ll1ll1l1ll1l1ll1l1) == "string" then
        TUNING["DYC_HEALTHBAR_C1"] = ll11l1l1ll11l1l11l11
        TUNING["DYC_HEALTHBAR_C2"] = l1ll1ll1l1ll1l1ll1l1
    else
        local l1l1ll11l1ll1ll11l11 = l1ll1l1l1ll1ll1l1ll1(ll11l1l1ll11l1l11l11)
        TUNING["DYC_HEALTHBAR_C1"] = l1l1ll11l1ll1ll11l11["c1"]
        TUNING["DYC_HEALTHBAR_C2"] = l1l1ll11l1ll1ll11l11["c2"]
    end
    l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["setstyle"] = ll11l1ll1ll11ll1l1l1["SetStyle"]
ll11l1ll1ll11ll1l1l1["SETSTYLE"] = ll11l1ll1ll11ll1l1l1["SetStyle"]
ll11l1ll1ll11ll1l1l1["SetPos"] = function(ll1ll11l11ll1ll1l1ll)
    if ll1ll11l11ll1ll1l1ll and string["lower"](ll1ll11l11ll1ll1l1ll) == "bottom" then
        TUNING["DYC_HEALTHBAR_POSITION"] = 0
    else
        TUNING["DYC_HEALTHBAR_POSITION"] = 1
    end
    l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["setpos"] = ll11l1ll1ll11ll1l1l1["SetPos"]
ll11l1ll1ll11ll1l1l1["SETPOS"] = ll11l1ll1ll11ll1l1l1["SetPos"]
ll11l1ll1ll11ll1l1l1["SetPosition"] = ll11l1ll1ll11ll1l1l1["SetPos"]
ll11l1ll1ll11ll1l1l1["setposition"] = ll11l1ll1ll11ll1l1l1["SetPos"]
ll11l1ll1ll11ll1l1l1["SETPOSITION"] = ll11l1ll1ll11ll1l1l1["SetPos"]
ll11l1ll1ll11ll1l1l1["ValueOn"] = function()
    TUNING["DYC_HEALTHBAR_VALUE"] =(122 * 304-229 * 493+88 == - 75721)
    l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["valueon"] = ll11l1ll1ll11ll1l1l1["ValueOn"]
ll11l1ll1ll11ll1l1l1["VALUEON"] = ll11l1ll1ll11ll1l1l1["ValueOn"]
ll11l1ll1ll11ll1l1l1["ValueOff"] = function()
    TUNING["DYC_HEALTHBAR_VALUE"] =(string.sub("l11l1l11ll11ll1l1l1l", 8, 14) ~= "1ll11ll")
    l11ll11ll1l1ll1ll1ll()

end

ll11l1ll1ll11ll1l1l1["valueoff"] = ll11l1ll1ll11ll1l1l1["ValueOff"]
ll11l1ll1ll11ll1l1l1["VALUEOFF"] = ll11l1ll1ll11ll1l1l1["ValueOff"]
ll11l1ll1ll11ll1l1l1["DDOn"] = function()
    TUNING["DYC_HEALTHBAR_DDON"] =(string.sub("ll11l11l11l11l1ll1l1", 6, 14) ~= "l111l1l11")

end

ll11l1ll1ll11ll1l1l1["ddon"] = ll11l1ll1ll11ll1l1l1["DDOn"]
ll11l1ll1ll11ll1l1l1["DDON"] = ll11l1ll1ll11ll1l1l1["DDOn"]
ll11l1ll1ll11ll1l1l1["DDOff"] = function()
    TUNING["DYC_HEALTHBAR_DDON"] =(32+253 * 499-228 ~= 126051)

end

ll11l1ll1ll11ll1l1l1["ddoff"] = ll11l1ll1ll11ll1l1l1["DDOff"]
ll11l1ll1ll11ll1l1l1["DDOFF"] = ll11l1ll1ll11ll1l1l1["DDOff"]
ll11l1ll1ll11ll1l1l1["DYC"] ={}
ll11l1ll1ll11ll1l1l1["dyc"] = ll11l1ll1ll11ll1l1l1["DYC"]
ll11l1ll1ll11ll1l1l1["D"] = ll11l1ll1ll11ll1l1l1["DYC"]
ll11l1ll1ll11ll1l1l1["d"] = ll11l1ll1ll11ll1l1l1["DYC"]
ll11l1ll1ll11ll1l1l1["DYC"]["S"] = function(ll1l11l1ll11l11ll11l, l11l1l11ll1l11ll11l1)
    l11l1l11ll1l11ll11l1 = l11l1l11ll1l11ll11l1 or 1
    ll1l11l1ll1l1l11ll1l("-shb d s " .. ll1l11l1ll11l11ll11l .. " " .. l11l1l11ll1l11ll11l1,(470-394+402-375 ~= 112))

end

ll11l1ll1ll11ll1l1l1["DYC"]["s"] = ll11l1ll1ll11ll1l1l1["DYC"]["S"]
ll11l1ll1ll11ll1l1l1["DYC"]["A"] = function(l1l11l11ll11ll11l1ll)
    ll1l11l1ll1l1l11ll1l("-shb d a " .. l1l11l11ll11ll11l1ll,(string.sub("l1ll1l1ll1l1l1l11l11", 6, 13) == "l1ll1l1l"))

end

ll11l1ll1ll11ll1l1l1["DYC"]["a"] = ll11l1ll1ll11ll1l1l1["DYC"]["A"]
ll11l1ll1ll11ll1l1l1["DYC"]["SPD"] = function(l11l11l1ll1l1ll1ll11)
    ll1l11l1ll1l1l11ll1l("-shb d spd " .. l11l11l1ll1l1ll1ll11,(290 * 152+75 * 295 ~= 66215))

end

ll11l1ll1ll11ll1l1l1["DYC"]["spd"] = ll11l1ll1ll11ll1l1l1["DYC"]["SPD"]

local l11ll11l11l11l1ll11l = l1ll1l1l1ll1ll1l1ll1(GetModConfigData "hbstyle")

TUNING["DYC_HEALTHBAR_C1"] = l11ll11l11l11l1ll11l["c1"]
TUNING["DYC_HEALTHBAR_C2"] = l11ll11l11l11l1ll11l["c2"]

if not l11ll11l11l11l1ll11l["isBasic"] then
    TUNING["DYC_HEALTHBAR_CNUM"] = GetModConfigData "hblength"

else
    TUNING["DYC_HEALTHBAR_CNUM"] = 16

end

TUNING["DYC_HEALTHBAR_DURATION"] = 8
TUNING["DYC_HEALTHBAR_POSITION"] = GetModConfigData "hbpos"

local l11l11l1ll1l1l1l1l1l = GetModConfigData "hbcolor"

if l11l11l1ll1l1l1l1l1l == "dynamic" then
    TUNING["DYC_HEALTHBAR_COLOR"] = nil

else
    ll11l1ll1ll11ll1l1l1["SetColor"](l11l11l1ll1l1l1l1l1l)

end

TUNING["DYC_HEALTHBAR_FORCEUPDATE"] = nil TUNING["DYC_HEALTHBAR_VALUE"] = GetModConfigData "value"
TUNING["DYC_HEALTHBAR_DDON"] = GetModConfigData "ddon"
TUNING["DYC_HEALTHBAR_DDDURATION"] = 0.65
TUNING["DYC_HEALTHBAR_DDSIZE1"] = 20
TUNING["DYC_HEALTHBAR_DDSIZE2"] = 50
TUNING["DYC_HEALTHBAR_DDTHRESHOLD"] = 0.7
TUNING["DYC_HEALTHBAR_DDDELAY"] = 0.05
TUNING["DYC_HEALTHBAR_MAXDIST"] = 35

local function l1l1l1l1ll1l11l11l11(l11l1ll11ll1l11l1ll1, ll1l1ll1ll11l11l11l1)
    if not l11l1ll11ll1l11l1ll1 or not l11l1ll11ll1l11l1ll1["components"]["health"] then
        return
    end
    if l11l1ll11ll1l11l1ll1["dychealthbar"] ~= nil then
        l11l1ll11ll1l11l1ll1["dychealthbar"]["dychbattacker"] = ll1l1ll1ll11l11l11l1
        l11l1ll11ll1l11l1ll1["dychealthbar"]:DYCHBSetTimer(0)
        return
    else
        l11l1ll11ll1l11l1ll1["dychealthbar"] = l11l1ll11ll1l11l1ll1:SpawnChild "dyc_healthbar"
        local ll1l1l1ll11l11l11ll1 = l11l1ll11ll1l11l1ll1["dychealthbar"]
        ll1l1l1ll11l11l11ll1["dychbowner"] = l11l1ll11ll1l11l1ll1
        ll1l1l1ll11l11l11ll1["dychbattacker"] = ll1l1ll1ll11l11l11l1
        ll1l1l1ll11l11l11ll1["dycHbIgnoreFirstDoDelta"] =(130 * 427+78+452 == 56040)
        ll1l1l1ll11l11l11ll1["dychp_net"]:set_local(0)
        ll1l1l1ll11l11l11ll1["dychp_net"]:set(l11l1ll11ll1l11l1ll1["components"]["health"]["currenthealth"])
        ll1l1l1ll11l11l11ll1["dychpmax_net"]:set_local(0)
        ll1l1l1ll11l11l11ll1["dychpmax_net"]:set(l11l1ll11ll1l11l1ll1["components"]["health"]["maxhealth"])
        ll1l1l1ll11l11l11ll1:InitHB()
    end

end

AddComponentPostInit("combat", function(self)
    local l11ll11l11ll1ll11l1l = self["SetTarget"] function self:SetTarget(l1l11l1ll1l1l1l1ll11, ...)
        if l1l11l1ll1l1l1l1ll11 ~= nil and self["inst"]["components"]["health"] and l1l11l1ll1l1l1l1ll11["components"]["health"] then
            if l1l11l1ll1l1l1l1ll11:IsValid() then
                l1l1l1l1ll1l11l11l11(l1l11l1ll1l1l1l1ll11, self["inst"])
            end
            if self["inst"]:IsValid() then
                l1l1l1l1ll1l11l11l11(self["inst"], l1l11l1ll1l1l1l1ll11)
            end
        end
        return l11ll11l11ll1ll11l1l(self, l1l11l1ll1l1l1l1ll11, ...)
    end
    local ll1ll1ll11l1l11ll11l = self["GetAttacked"] function self:GetAttacked(ll1l1l11ll1l11l1l1ll, ...)
        if self["inst"]:IsValid() then
            l1l1l1l1ll1l11l11l11(self["inst"])
        end
        if ll1l1l11ll1l11l1l1ll and ll1l1l11ll1l11l1l1ll:IsValid() and ll1l1l11ll1l11l1l1ll["components"]["health"] then
            l1l1l1l1ll1l11l11l11(ll1l1l11ll1l11l1l1ll)
        end
        return ll1ll1ll11l1l11ll11l(self, ll1l1l11ll1l11l1l1ll, ...)
    end

end
)

AddComponentPostInit("health", function(self)
    local ll11ll1l1ll1l1l1ll11 = self["DoDelta"] function self:DoDelta(ll1ll1l11ll1ll1ll1l1, ...)
        if self["inst"]:IsValid() and ll1ll1l11ll1ll1ll1l1 <= - TUNING["DYC_HEALTHBAR_DDTHRESHOLD"] or (ll1ll1l11ll1ll1ll1l1 >= 0.9 and self["maxhealth"] - self["currenthealth"] >= 0.9) then
            l1l1l1l1ll1l11l11l11(self["inst"])
        end
        local l11l11ll1l11l11l11ll = ll11ll1l1ll1l1l1ll11(self, ll1ll1l11ll1ll1ll1l1, ...) if self["inst"]["dychealthbar"] then
            local l1ll11ll1ll1ll1ll1l1 = self["inst"]["dychealthbar"] if l1ll11ll1ll1ll1ll1l1["dycHbIgnoreFirstDoDelta"] ==(153-163+418-284-470 == - 346) then
                l1ll11ll1ll1ll1ll1l1["dycHbIgnoreFirstDoDelta"] =(string.sub("ll1ll1l11l1ll1l11ll1", 6, 13) ~= "1l11l1ll") self["inst"]:DoTaskInTime(0.01, function()
                    l1ll11ll1ll1ll1ll1l1["dychp_net"]:set_local(0) l1ll11ll1ll1ll1ll1l1["dychp_net"]:set(self["currenthealth"]) if l1ll11ll1ll1ll1ll1l1["dychpmax"] ~= self["maxhealth"] then
                        l1ll11ll1ll1ll1ll1l1["dychpmax_net"]:set_local(0) l1ll11ll1ll1ll1ll1l1["dychpmax_net"]:set(self["maxhealth"])
                    end
                end
                )
            else
                l1ll11ll1ll1ll1ll1l1["dychp_net"]:set_local(0) l1ll11ll1ll1ll1ll1l1["dychp_net"]:set(self["currenthealth"]) if l1ll11ll1ll1ll1ll1l1["dychpmax"] ~= self["maxhealth"] then
                    l1ll11ll1ll1ll1ll1l1["dychpmax_net"]:set_local(0) l1ll11ll1ll1ll1ll1l1["dychpmax_net"]:set(self["maxhealth"])
                end
            end
        end
        return l11l11ll1l11l11l11ll
    end

end
)