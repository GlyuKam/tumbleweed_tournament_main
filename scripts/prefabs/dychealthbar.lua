local function l1ll1ll1ll1ll1l11ll1()
    return TheSim:GetGameID() == "DST"

end

local function l11ll1l1ll1l1ll1ll11()
    return l1ll1ll1ll1ll1l11ll1() and not TheWorld["ismastersim"]

end

local function ll1l1l11l1l1l11ll11l(ll1l11l11ll11ll1l1ll)
    local l1ll1l1l11ll1l1l1l11 = ThePlayer
    if l1ll1l1l11ll1l1l1l11 == ll1l11l11ll11ll1l1ll then
        return (136 * 312-341-93 ~= 42004)
    end
    if not l1ll1l1l11ll1l1l1l11 or not l1ll1l1l11ll1l1l1l11:IsValid() or not ll1l11l11ll11ll1l1ll:IsValid() then
        return (string.sub("l11ll1ll11ll1l11l11l", 6, 13) == "11l1llll")
    end
    local ll11l11ll1ll11ll1l11 = l1ll1l1l11ll1l1l1l11:GetPosition():Dist(ll1l11l11ll11ll1l1ll:GetPosition())
    return ll11l11ll1ll11ll1l11 <= TUNING["DYC_HEALTHBAR_MAXDIST"]

end

local ll1l11ll11ll1ll1ll11 ={{prefab = "krampus", width = 1, height = 3.75},{prefab = "nightmarebeak", width = 1, height = 4.5},{prefab = "terrorbeak", width = 1, height = 4.5},{prefab = "spiderqueen", width = 2, height = 4.5},{prefab = "warg", width = 1.7, height = 5},{prefab = "pumpkin_lantern", width = 0.7, height = 1.5},{prefab = "jellyfish_planted", width = 0.7, height = 1.5},{prefab = "babybeefalo", width = 1, height = 2.2},{prefab = "beeguard", width = 0.65, height = 2},{prefab = "shadow_rook", width = 1.8, height = 3.5},{prefab = "shadow_bishop", width = 0.9, height = 3.2},{prefab = "walrus", width = 1.1, height = 3.2},{prefab = "teenbird", width = 1.0, height = 3.6},{tag = "koalefant", width = 1.7, height = 4},{tag = "spat", width = 1.5, height = 3.5},{tag = "lavae", width = 0.8, height = 1.5},{tag = "glommer", width = 0.9, height = 2.9},{tag = "deer", width = 1, height = 3.1},{tag = "snake", width = 0.9, height = 1.7},{tag = "eyeturret", width = 1, height = 4.5},{tag = "primeape", width = 0.85, height = 1.5},{tag = "monkey", width = 0.85, height = 1.5},{tag = "ox", width = 1.5, height = 3.75},{tag = "beefalo", width = 1.5, height = 3.75},{tag = "kraken", width = 2, height = 5.5},{tag = "nightmarecreature", width = 1.25, height = 3.5},{tag = "bishop", width = 1, height = 4},{tag = "rook", width = 1.25, height = 4},{tag = "knight", width = 1, height = 3},{tag = "bat", width = 0.85, height = 3},{tag = "minotaur", width = 1.75, height = 4.5},{tag = "packim", width = 0.9, height = 3.75},{tag = "stungray", width = 0.9, height = 3.75},{tag = "ghost", width = 0.9, height = 3.75},{tag = "tallbird", width = 1.25, height = 5},{tag = "chester", width = 0.85, height = 1.5},{tag = "hutch", width = 0.85, height = 1.5},{tag = "wall", width = 0.5, height = 1.5},{tag = "largecreature", width = 2, height = 7},{tag = "insect", width = 0.5, height = 1.6},{tag = "smallcreature", width = 0.85, height = 1.5}}

local function ll1l11ll1l11l1ll11ll(l1l11ll1ll11ll11l1l1)
    if l1l11ll1ll11ll11l1l1 < 0 then
        l1l11ll1ll11ll11l1l1 = 0
    elseif l1l11ll1ll11ll11l1l1 > 1 then
        l1l11ll1ll11ll11l1l1 = 1
    end
    return l1l11ll1ll11ll11l1l1

end

local function l11ll1ll1ll1ll11l1ll(l11l1ll1ll11ll1l11l1, ll11l11ll1l1ll1ll1ll)
    local l1l1l1l11l1l1ll11ll1 = TUNING["DYC_HEALTHBAR_C1"]
    local l1ll11l1ll1l11l11l1l = TUNING["DYC_HEALTHBAR_C2"]
    local ll11l11ll1ll1l1l1ll1 = TUNING["DYC_HEALTHBAR_CNUM"]
    local ll1l11l1ll1l1l11l11l = ""
    if TUNING["DYC_HEALTHBAR_POSITION"] == 0 then
        ll1l11l1ll1l1l11l11l = "  \n  \n  \n  \n"
    end
    local l1l11l1l1ll1l1l1l11l = l11l1ll1ll11ll1l11l1 / ll11l11ll1l1ll1ll1ll
    for l1ll11ll11ll1l1ll1l1 = 1, ll11l11ll1ll1l1l1ll1
    do
        if l1l11l1l1ll1l1l1l11l == 0 or (l1ll11ll11ll1l1ll1l1 ~= 1 and l1ll11ll11ll1l1ll1l1 * 1.0 / ll11l11ll1ll1l1l1ll1 > l1l11l1l1ll1l1l1l11l) then
            ll1l11l1ll1l1l11l11l = ll1l11l1ll1l1l11l11l .. l1l1l1l11l1l1ll11ll1
        else
            ll1l11l1ll1l1l11l11l = ll1l11l1ll1l1l11l11l .. l1ll11l1ll1l11l11l1l
        end
    end
    return ll1l11l1ll1l1l11l11l

end

local function l1l1l1ll1l1ll1ll1l1l(l11l11l1ll11l1l1ll1l)
    if not l11l11l1ll11l1l1ll1l then
        return 1
    end
    for l1ll11ll1ll11l1l11ll, l1l11l1ll1ll11ll1l1l in pairs(ll1l11ll11ll1ll1ll11)
    do
        if l1l11l1ll1ll11ll1l1l["width"] and (l11l11l1ll11l1l1ll1l["prefab"] == l1l11l1ll1ll11ll1l1l["prefab"] or (l1l11l1ll1ll11ll1l1l["tag"] and l11l11l1ll11l1l1ll1l:HasTag(l1l11l1ll1ll11ll1l1l["tag"]))) then
            return l1l11l1ll1ll11ll1l1l["width"]
        end
    end
    return 1

end

local function ll1l11l11l1ll1ll11ll(ll11l11l1ll1l1l1l11l)
    if not ll11l11l1ll1l1l1l11l then
        return 2.2
    end
    for ll1l1ll1l11ll11ll11l, l11l11l11l11ll11ll11 in pairs(ll1l11ll11ll1ll1ll11)
    do
        if l11l11l11l11ll11ll11["height"] and (ll11l11l1ll1l1l1l11l["prefab"] == l11l11l11l11ll11ll11["prefab"] or (l11l11l11l11ll11ll11["tag"] and ll11l11l1ll1l1l1l11l:HasTag(l11l11l11l11ll11ll11["tag"]))) then
            return l11l11l11l11ll11ll11["height"]
        end
    end
    return 2.2

end

local function ll11ll1ll11l1l11ll11(l11ll1l1ll11l1ll1l11)
    if not l11ll1l1ll11l1ll1l11["dychbowner"] then
        l11ll1l1ll11l1ll1l11["dychbowner"] = l11ll1l1ll11l1ll1l11["entity"]:GetParent()
        if not l11ll1l1ll11l1ll1l11["dychbowner"] then
            l11ll1l1ll11l1ll1l11:Remove()
            return
        end
        l11ll1l1ll11l1ll1l11["dychbowner"]["dychealthbar"] = l11ll1l1ll11l1ll1l11
    end
    if l1ll1ll1ll1ll1l11ll1() or TUNING["DYC_HEALTHBAR_POSITION"] == 0 then
        l11ll1l1ll11l1ll1l11["dychbtext"] = l11ll1l1ll11l1ll1l11["dychbowner"]:SpawnChild "dyc_healthbarchild"
    else
        l11ll1l1ll11l1ll1l11["dychbtext"] = l11ll1l1ll11l1ll1l11:SpawnChild "dyc_healthbarchild"
    end
    l11ll1l1ll11l1ll1l11["Label"]:Enable((string.sub("ll1ll11ll11ll1ll11l1", 9, 12) ~= "l11l"))
    l11ll1l1ll11l1ll1l11["dychbtext"]["Label"]:Enable((string.sub("ll1ll1l1l11ll11l11ll", 7, 13) == "1l111l1"))
    l11ll1l1ll11l1ll1l11["SetHBHeight"] = function(l11ll1l1ll11l1ll1l11, l11l1l11l1l1l11ll1ll)
        if TUNING["DYC_HEALTHBAR_POSITION"] == 0 then
            l11l1l11l1l1l11ll1ll = 0
        end
        l11ll1l1ll11l1ll1l11["Label"]:SetWorldOffset(0, l11l1l11l1l1l11ll1ll, 0)
        if l11ll1l1ll11l1ll1l11["dychbowner"] and l11ll1l1ll11l1ll1l11["dychbowner"]:HasTag "player" then
            l11ll1l1ll11l1ll1l11["dychbtext"]["Label"]:SetWorldOffset(0, l11l1l11l1l1l11ll1ll + 0.58, 0)
        else
            l11ll1l1ll11l1ll1l11["dychbtext"]["Label"]:SetWorldOffset(0, l11l1l11l1l1l11ll1ll, 0)
        end
    end
    l11ll1l1ll11l1ll1l11["dychbheightconst"] = ll1l11l11l1ll1ll11ll(l11ll1l1ll11l1ll1l11["dychbowner"])
    l11ll1l1ll11l1ll1l11:SetHBHeight(l11ll1l1ll11l1ll1l11["dychbheightconst"])
    l11ll1l1ll11l1ll1l11["SetHBSize"] = function(l11ll1l1ll11l1ll1l11, l1l1l1ll1ll11ll1l1l1)
        local l11l1l1l1ll1l1l11ll1 = math["max"](1,(13-TUNING["DYC_HEALTHBAR_CNUM"]) / 5) * 15 * l1l1l1ll1ll11ll1l1l1
        l11ll1l1ll11l1ll1l11["Label"]:SetFontSize(l11l1l1l1ll1l1l11ll1)
        l11ll1l1ll11l1ll1l11["dychbtext"]["Label"]:SetFontSize(28 * l1l1l1ll1ll11ll1l1l1)
    end
    l11ll1l1ll11l1ll1l11:SetHBSize(l1l1l1ll1l1ll1ll1l1l(l11ll1l1ll11l1ll1l11["dychbowner"]))
    l11ll1l1ll11l1ll1l11["dycHbStarted"] =(string.sub("l1l1l11l1l1ll11l11l1", 7, 12) ~= "l1111l")

end

local function ll1l1ll1ll1l1l11l11l()
    local ll1l1ll1ll11ll11ll11 = CreateEntity()
    ll1l1ll1ll11ll11ll11["entity"]:AddTransform()
    ll1l1ll1ll11ll11ll11:AddTag "FX"
    local l11ll1l1ll1ll11l1l1l = ll1l1ll1ll11ll11ll11["entity"]:AddLabel()
    l11ll1l1ll1ll11l1l1l:SetFont(NUMBERFONT)
    l11ll1l1ll1ll11l1l1l:SetFontSize(28)
    l11ll1l1ll1ll11l1l1l:SetColour(1, 1, 1)
    l11ll1l1ll1ll11l1l1l:SetText " "
    l11ll1l1ll1ll11l1l1l:Enable((string.sub("ll11l1ll1l1l1l11l11l", 9, 14) ~= "11l1ll"))
    ll1l1ll1ll11ll11ll11["persists"] =(438 * 302 * 192 ~= 25396992)
    ll1l1ll1ll11ll11ll11["InitHB"] = ll11ll1ll11l1l11ll11
    return ll1l1ll1ll11ll11ll11

end

local ll1l11l1l1ll11ll1l1l ={dyc_healthbarchild = 255, dyc_healthbar = 150}

local function ll11ll11l1l11ll1ll11()
    local ll11l11l1ll1l1l11l1l = ll1l1ll1ll1l1l11l11l()
    if not TheNet:IsDedicated() then
        ll11l11l1ll1l1l11l1l:ListenForEvent("gz_screen_heights", function(l11l1ll1l11ll1l1l1l1, l1l1ll1l1ll1ll1ll1ll)
            local l1l11l1l11l1l1l11ll1 =(ll1l11l1l1ll11ll1l1l[ll11l11l1ll1l1l11l1l["prefab"]] or 150) / l1l1ll1l1ll1ll1ll1ll["screen_heights"] ll11l11l1ll1l1l11l1l["Label"]:SetFontSize(l1l11l1l11l1l1l11ll1)
        end
        , ThePlayer)
    end
    return ll11l11l1ll1l1l11l1l

end

local function ll1l1ll1l1l1ll1ll11l()
    local l1l1l1l1ll11ll1l11ll = ll11ll11l1l11ll1ll11()
    if l1ll1ll1ll1ll1l11ll1() then
        l1l1l1l1ll11ll1l11ll["entity"]:AddNetwork()
    end
    l1l1l1l1ll11ll1l11ll["Label"]:SetFontSize(15)
    if l1ll1ll1ll1ll1l11ll1() then
        l1l1l1l1ll11ll1l11ll["dychpini"] = - 1
        l1l1l1l1ll11ll1l11ll["dychp"] = 0
        l1l1l1l1ll11ll1l11ll["dychp_net"] = net_float(l1l1l1l1ll11ll1l11ll["GUID"], "dyc_healthbar.hp", "dychpdirty")
        l1l1l1l1ll11ll1l11ll:ListenForEvent("dychpdirty", function(l1l1l1l1ll11ll1l11ll)
            local ll1l1l11l11l1l11ll1l = l1l1l1l1ll11ll1l11ll["dychp_net"]:value() if l1l1l1l1ll11ll1l11ll["dychpini"] == - 1 then
                l1l1l1l1ll11ll1l11ll["dychpini"] = ll1l1l11l11l1l11ll1l if not TUNING["DYC_HEALTHBAR_DDON"] then
                    l1l1l1l1ll11ll1l11ll["dychpini"] = - 2
                end
            end
            if TUNING["DYC_HEALTHBAR_DDON"] then
                if l1l1l1l1ll11ll1l11ll["dychbowner"] and ll1l1l11l1l1l11ll11l(l1l1l1l1ll11ll1l11ll["dychbowner"]) then
                    local l11l1l1ll1l1ll11ll11 = SpawnPrefab "dyc_damagedisplay" if l1l1l1l1ll11ll1l11ll["dychpini"] > 0 then
                        l11l1l1ll1l1ll11ll11:DamageDisplay(l1l1l1l1ll11ll1l11ll["dychbowner"],{hpOld = l1l1l1l1ll11ll1l11ll["dychpini"], hpNewDefault = ll1l1l11l11l1l11ll1l}) l1l1l1l1ll11ll1l11ll["dychpini"] = - 2
                    else
                        l11l1l1ll1l1ll11ll11:DamageDisplay(l1l1l1l1ll11ll1l11ll["dychbowner"],{hpNewDefault = ll1l1l11l11l1l11ll1l})
                    end
                end
            end
            l1l1l1l1ll11ll1l11ll["dychp"] = ll1l1l11l11l1l11ll1l
        end
        )
        l1l1l1l1ll11ll1l11ll["dychpmax"] = 0
        l1l1l1l1ll11ll1l11ll["dychpmax_net"] = net_float(l1l1l1l1ll11ll1l11ll["GUID"], "dyc_healthbar.hpmax", "dychpmaxdirty")
        l1l1l1l1ll11ll1l11ll:ListenForEvent("dychpmaxdirty", function(l1l1l1l1ll11ll1l11ll)
            l1l1l1l1ll11ll1l11ll["dychpmax"] = l1l1l1l1ll11ll1l11ll["dychpmax_net"]:value()
        end
        )
    end
    local l11ll11l11ll1l1ll1ll = - 1
    local ll11l1l1l1l11ll11l11 = - 1
    local l1l1l1l1l1l1ll1l1ll1 = 0
    l1l1l1l1ll11ll1l11ll["dycHbStarted"] =(string.sub("ll1l11ll11l1l1l11l11", 7, 12) ~= "ll11l1")
    l1l1l1l1ll11ll1l11ll["OnRemoveEntity"] = function(l1l1l1l1ll11ll1l11ll)
        if l1ll1ll1ll1ll1l11ll1() and l1l1l1l1ll11ll1l11ll["dychbowner"] and TUNING["DYC_HEALTHBAR_DDON"] and ll1l1l11l1l1l11ll11l(l1l1l1l1ll11ll1l11ll["dychbowner"]) then
            local l11l11l11ll11l1l11l1 = SpawnPrefab "dyc_damagedisplay"
            l11l11l11ll11l1l11l1:DamageDisplay(l1l1l1l1ll11ll1l11ll["dychbowner"],{hpNewDefault = l1l1l1l1ll11ll1l11ll["dychp"]})
        end
        l1l1l1l1ll11ll1l11ll["Label"]:SetText " "
        if l1l1l1l1ll11ll1l11ll["dychbowner"] then
            l1l1l1l1ll11ll1l11ll["dychbowner"]["dychealthbar"] = nil
        end
        if l1l1l1l1ll11ll1l11ll["dychbtext"] then
            l1l1l1l1ll11ll1l11ll["dychbtext"]:Remove()
        end
        if l1l1l1l1ll11ll1l11ll["dychbtask"] then
            l1l1l1l1ll11ll1l11ll["dychbtask"]:Cancel()
        end
    end
    function l1l1l1l1ll11ll1l11ll:DYCHBSetTimer(ll1l1ll1l1l11ll1l1ll)
        l1l1l1l1l1l1ll1l1ll1 = ll1l1ll1l1l11ll1l1ll
    end
    l1l1l1l1ll11ll1l11ll["dychbtask"] = l1l1l1l1ll11ll1l11ll:DoPeriodicTask(FRAMES, function()
        if not l1l1l1l1ll11ll1l11ll["dycHbStarted"] then
            return
        end
        local l1l1ll1l11l11l11l1l1 = l1l1l1l1ll11ll1l11ll["dychbowner"] if not l1l1ll1l11l11l11l1l1 then
            return
        end
        local ll11l1l1ll11l11ll1l1 = l1l1l1l1ll11ll1l11ll["dychbattacker"] local l1l1l11l11ll1l1l1l1l = nil if not l11ll1l1ll1l1ll1ll11() then
            l1l1l11l11ll1l1l1l1l = l1l1ll1l11l11l11l1l1["components"]["health"]
        else
            l1l1l11l11ll1l1l1l1l = l1l1ll1l11l11l11l1l1["replica"]["health"]
        end
        if not l1l1ll1l11l11l11l1l1:IsValid() or (not l1ll1ll1ll1ll1l11ll1() and not ll1l1l11l1l1l11ll11l(l1l1ll1l11l11l11l1l1)) or (l11ll1l1ll1l1ll1ll11() and not l1l1ll1l11l11l11l1l1:HasTag "player") or l1l1l11l11ll1l1l1l1l == nil or l1l1l11l11ll1l1l1l1l:IsDead() or l1l1l1l1l1l1ll1l1ll1 >= TUNING["DYC_HEALTHBAR_DURATION"] then
            if not l11ll1l1ll1l1ll1ll11() then
                l1l1l1l1ll11ll1l11ll:Remove() return
            end
        end
        if l1l1ll1l11l11l11l1l1["dychealthbar"] ~= l1l1l1l1ll11ll1l11ll then
            l1l1l1l1ll11ll1l11ll:Remove() return
        end
        if not l1l1ll1l11l11l11l1l1:IsValid() then
            return
        end
        local ll1l1l11l11ll1ll1l1l = 0 local ll11ll11l1l1l11ll1l1 = 0 if not l1ll1ll1ll1ll1l11ll1() then
            ll1l1l11l11ll1ll1l1l = l1l1l11l11ll1l1l1l1l["currenthealth"] ll11ll11l1l1l11ll1l1 = l1l1l11l11ll1l1l1l1l["maxhealth"]
        else
            ll1l1l11l11ll1ll1l1l = l1l1l1l1ll11ll1l11ll["dychp"] ll11ll11l1l1l11ll1l1 = l1l1l1l1ll11ll1l11ll["dychpmax"]
        end
        if l1l1l11l11ll1l1l1l1l ~= nil and (TUNING["DYC_HEALTHBAR_FORCEUPDATE"] ==(331 * 415+430 ~= 137805) or l11ll11l11ll1l1ll1ll ~= ll1l1l11l11ll1ll1l1l or ll11l1l1l1l11ll11l11 ~= ll11ll11l1l1l11ll1l1) then
            l11ll11l11ll1l1ll1ll = ll1l1l11l11ll1ll1l1l ll11l1l1l1l11ll11l11 = ll11ll11l1l1l11ll1l1 l1l1l1l1ll11ll1l11ll["Label"]:Enable((140 * 93 * 210-119+106 == 2734187)) l1l1l1l1ll11ll1l11ll["Label"]:SetText(l11ll1ll1ll1ll11l1ll(l11ll11l11ll1l1ll1ll, ll11l1l1l1l11ll11l11)) l1l1l1l1ll11ll1l11ll["dychbtext"]["Label"]:Enable((166 * 98-426+490 ~= 16337)) if TUNING["DYC_HEALTHBAR_VALUE"] then
                if TUNING["DYC_HEALTHBAR_POSITION"] ~= 0 then
                    l1l1l1l1ll11ll1l11ll["dychbtext"]["Label"]:SetText(string["format"]("%d/%d\n   ", l11ll11l11ll1l1ll1ll, ll11l1l1l1l11ll11l11))
                else
                    l1l1l1l1ll11ll1l11ll["dychbtext"]["Label"]:SetText(string["format"]("  \n  \n%d/%d\n   ", l11ll11l11ll1l1ll1ll, ll11l1l1l1l11ll11l11))
                end
            else
                l1l1l1l1ll11ll1l11ll["dychbtext"]["Label"]:SetText ""
            end
            if l1l1l1l1ll11ll1l11ll["SetHBHeight"] and l1l1l1l1ll11ll1l11ll["dychbheightconst"] then
                l1l1l1l1ll11ll1l11ll:SetHBHeight(l1l1l1l1ll11ll1l11ll["dychbheightconst"])
            end
            local l11l11l1ll11l1l11l1l = l11ll11l11ll1l1ll1ll / ll11l1l1l1l11ll11l11 if TUNING["DYC_HEALTHBAR_COLOR"] == nil then
                l1l1l1l1ll11ll1l11ll["Label"]:SetColour(ll1l11ll1l11l1ll11ll((1-l11l11l1ll11l1l11l1l) * 2), ll1l11ll1l11l1ll11ll(l11l11l1ll11l1l11l1l * 2), 0)
            elseif type(TUNING["DYC_HEALTHBAR_COLOR"]) == "table" then
                l1l1l1l1ll11ll1l11ll["Label"]:SetColour(TUNING["DYC_HEALTHBAR_COLOR"]:Get())
            else
            end
        end
        local l1l11l11ll1l1ll1l11l =(string.sub("l1ll1l1l11l11l1l1l1l", 7, 12) == "1l11l1") local l1ll1l11l11l11ll11l1 = nil if not l11ll1l1ll1l1ll1ll11() then
            l1ll1l11l11l11ll11l1 = l1l1ll1l11l11l11l1l1["components"]["combat"]
        else
            l1ll1l11l11l11ll11l1 = l1l1ll1l11l11l11l1l1["replica"]["combat"]
        end
        if l1ll1l11l11l11ll11l1 and l1ll1l11l11l11ll11l1["target"] then
            l1l11l11ll1l1ll1l11l =(224+353+395 * 82+242 == 33219)
        else
            if ll11l1l1ll11l11ll1l1 and ll11l1l1ll11l11ll1l1:IsValid() then
                local l11ll11l11ll11l11ll1 = nil local ll11ll11l1l1ll11ll11 = nil if not l11ll1l1ll1l1ll1ll11() then
                    l11ll11l11ll11l11ll1 = ll11l1l1ll11l11ll1l1["components"]["health"] ll11ll11l1l1ll11ll11 = ll11l1l1ll11l11ll1l1["components"]["combat"]
                else
                    l11ll11l11ll11l11ll1 = ll11l1l1ll11l11ll1l1["replica"]["health"] ll11ll11l1l1ll11ll11 = ll11l1l1ll11l11ll1l1["replica"]["combat"]
                end
                if l11ll11l11ll11l11ll1 and not l11ll11l11ll11l11ll1:IsDead() and ll11ll11l1l1ll11ll11 and ll11ll11l1l1ll11ll11["target"] == l1l1ll1l11l11l11l1l1 then
                    l1l11l11ll1l1ll1l11l =(string.sub("ll11l1ll1ll11l11l1l1", 8, 13) ~= "l1ll11")
                end
            end
        end
        if l1l11l11ll1l1ll1l11l then
            l1l1l1l1l1l1ll1l1ll1 = l1l1l1l1l1l1ll1l1ll1 + FRAMES
        else
            l1l1l1l1l1l1ll1l1ll1 = 0
        end
        if l1ll1ll1ll1ll1l11ll1() or TUNING["DYC_HEALTHBAR_POSITION"] == 0 then
        else
            local l1l1l11l1ll1ll1ll1l1 = l1l1ll1l11l11l11l1l1:GetPosition() l1l1l11l1ll1ll1ll1l1["y"] = l1l1l1l1ll11ll1l11ll["dychbheight"] or 0 l1l1l1l1ll11ll1l11ll["Transform"]:SetPosition(l1l1l11l1ll1ll1ll1l1:Get())
        end
    end
    )
    if l11ll1l1ll1l1ll1ll11() then
        l1l1l1l1ll11ll1l11ll:DoTaskInTime(0, function()
            l1l1l1l1ll11ll1l11ll:InitHB()
        end
        )
    end
    return l1l1l1l1ll11ll1l11ll

end

local function ll1l1ll1ll1ll11l11ll(l1l1ll11ll1l11l1l1ll, ll1l11ll1ll11ll11l1l, l1ll1l1ll11l1l1l11ll)
    if not l1l1ll11ll1l11l1l1ll:IsValid() or not ll1l11ll1ll11ll11l1l:IsValid() or ll1l11ll1ll11ll11l1l["dycddcd"] ==(104-177-384+275 ~= - 178) then
        l1l1ll11ll1l11l1l1ll:Remove()
        return
    end
    ll1l11ll1ll11ll11l1l["dycddcd"] =(string.sub("ll1ll11l11l11l11ll1l", 8, 14) ~= "1111l1l")
    local l1ll1l11l1l1l1ll1l11 = nil if not l11ll1l1ll1l1ll1ll11() then
        l1ll1l11l1l1l1ll1l11 = ll1l11ll1ll11ll11l1l["components"]["health"]
    else
        l1ll1l11l1l1l1ll1l11 = ll1l11ll1ll11ll11l1l["replica"]["health"]
    end
    l1l1ll11ll1l11l1l1ll["Transform"]:SetPosition((ll1l11ll1ll11ll11l1l:GetPosition() + Vector3(0, ll1l11l11l1ll1ll11ll(ll1l11ll1ll11ll11l1l) * 0.65, 0)):Get())
    local l1ll1l1ll1l11l1ll1ll =(l1ll1l1ll11l1l1l11ll and l1ll1l1ll11l1l1l11ll["hpOld"]) or (not l1ll1ll1ll1ll1l11ll1() and ll1l11ll1ll11ll11l1l["components"]["health"]["currenthealth"]) or (ll1l11ll1ll11ll11l1l["dychealthbar"] and ll1l11ll1ll11ll11l1l["dychealthbar"]["dychp"]) or (l1ll1l11l1l1l1ll1l11 and l1ll1l11l1l1l1ll1l11:IsDead() and 0) or (l1ll1l1ll11l1l1l11ll and l1ll1l1ll11l1l1l11ll["hpOldDefault"]) or 0
    local l1l11ll1l1l1l11l1ll1 =(string.sub("l11ll11l11l1ll11ll11", 6, 13) ~= "11l11l1l")
    local l11l1l1l1l1l11ll11ll = math["random"]() * 360
    local ll11l1ll1ll11ll1ll11 = TUNING["DYC_HEALTHBAR_DDDURATION"] / 2
    local ll1l1ll11l11l1ll11ll = 1
    local l11l1ll1l1ll1l11l11l = 2
    local ll1ll11l11l11ll11ll1 = 2 * l11l1ll1l1ll1l11l11l / ll11l1ll1ll11ll1ll11 / ll11l1ll1ll11ll1ll11
    local ll1l1l1l1ll11ll1l11l = 0
    local ll1l1ll1l1l1l1ll1l11 = ll1l1ll11l11l1ll11ll / ll11l1ll1ll11ll1ll11
    local l1l1l1l1l11l1l11ll11 = math["sqrt"](2 * ll1ll11l11l11ll11ll1 * l11l1ll1l1ll1l11l11l)
    local ll1ll1ll11ll11ll11l1 = ll11l1ll1ll11ll1ll11 * 2
    local l11l1ll11l1ll1ll1l1l =(string.sub("l11l11ll11l11ll1ll11", 7, 11) ~= "ll11l")
    local l11l1l1l1l1l11l1ll1l = TUNING["DYC_HEALTHBAR_DDDELAY"]
    local ll1l1l11l1l11l1ll11l = 0
    l1l1ll11ll1l11l1l1ll["dycddtask"] = l1l1ll11ll1l11l1l1ll:DoPeriodicTask(FRAMES, function()
        if not l1l1ll11ll1l11l1l1ll:IsValid() or not ll1l11ll1ll11ll11l1l:IsValid() then
            l1l1ll11ll1l11l1l1ll["dycddtask"]:Cancel() l1l1ll11ll1l11l1l1ll:Remove() return
        end
        ll1l1l11l1l11l1ll11l = ll1l1l11l1l11l1ll11l + FRAMES ll1l1l1l1ll11ll1l11l = ll1l1l11l1l11l1ll11l - l11l1l1l1l1l11l1ll1l if ll1l1l11l1l11l1ll11l > l11l1l1l1l1l11l1ll1l then
            if l1l11ll1l1l1l11l1ll1 ==(string.sub("l1l1l1l1l1ll1ll1ll11", 9, 13) ~= "l1ll1") then
                ll1l11ll1ll11ll11l1l["dycddcd"] =(381-377+422 ~= 426) local l1l11ll11l11ll11l1l1 =(l1ll1l1ll11l1l1l11ll and l1ll1l1ll11l1l1l11ll["hpNew"]) or (not l1ll1ll1ll1ll1l11ll1() and ll1l11ll1ll11ll11l1l["components"]["health"]["currenthealth"]) or (ll1l11ll1ll11ll11l1l["dychealthbar"] and ll1l11ll1ll11ll11l1l["dychealthbar"]["dychp"]) or (l1ll1l11l1l1l1ll1l11 and l1ll1l11l1l1l1ll1l11:IsDead() and 0) or (l1ll1l1ll11l1l1l11ll and l1ll1l1ll11l1l1l11ll["hpNewDefault"]) or 0 local ll1ll1ll1ll11ll1l1l1 = l1l11ll11l11ll11l1l1 - l1ll1l1ll1l11l1ll1ll local l1ll1l1l11l11l11l1l1 = math["abs"](ll1ll1ll1ll11ll1l1l1) if l1ll1l1l11l11l11l1l1 < TUNING["DYC_HEALTHBAR_DDTHRESHOLD"] then
                    l1l1ll11ll1l11l1l1ll["dycddtask"]:Cancel() l1l1ll11ll1l11l1l1ll:Remove() return
                else
                    l1l11ll1l1l1l11l1ll1 =(479+427+481-97 == 1290) l1l1ll11ll1l11l1l1ll["Label"]:Enable((string.sub("l1l11ll11l11ll11l11l", 6, 12) ~= "ll1lll1")) local l1ll1l11l11l11l11ll1 = "" if ll1ll1ll1ll11ll1l1l1 > 0 then
                        l1l1ll11ll1l11l1l1ll["Label"]:SetColour(0, 1, 0) l1ll1l11l11l11l11ll1 = "+"
                    else
                        l1l1ll11ll1l11l1l1ll["Label"]:SetColour(1, 0, 0) l11l1ll11l1ll1ll1l1l =(183+457-75-481 == 84)
                    end
                    if l1ll1l1l11l11l11l1l1 < 1 then
                        l1l1ll11ll1l11l1l1ll["Label"]:SetText(l1ll1l11l11l11l11ll1 .. string["format"]("%.2f", ll1ll1ll1ll11ll1l1l1))
                    elseif l1ll1l1l11l11l11l1l1 < 100 then
                        l1l1ll11ll1l11l1l1ll["Label"]:SetText(l1ll1l11l11l11l11ll1 .. string["format"]("%.1f", ll1ll1ll1ll11ll1l1l1))
                    else
                        l1l1ll11ll1l11l1l1ll["Label"]:SetText(l1ll1l11l11l11l11ll1 .. string["format"]("%d", ll1ll1ll1ll11ll1l1l1))
                    end
                end
            end
            local l11l11l1ll11l1ll1l1l = l1l1ll11ll1l11l1l1ll:GetPosition() local l1ll1l11l11l1l1ll1ll = Vector3(ll1l1ll1l1l1l1ll1l11 * FRAMES * math["cos"](l11l1l1l1l1l11ll11ll), l1l1l1l1l11l1l11ll11 * FRAMES, ll1l1ll1l1l1l1ll1l11 * FRAMES * math["sin"](l11l1l1l1l1l11ll11ll)) l1l1ll11ll1l11l1l1ll["Transform"]:SetPosition(l11l11l1ll11l1ll1l1l["x"] + l1ll1l11l11l1l1ll1ll["x"], l11l11l1ll11l1ll1l1l["y"] + l1ll1l11l11l1l1ll1ll["y"], l11l11l1ll11l1ll1l1l["z"] + l1ll1l11l11l1l1ll1ll["z"]) l1l1l1l1l11l1l11ll11 = l1l1l1l1l11l1l11ll11 - ll1ll11l11l11ll11ll1 * FRAMES local l11l1ll1l1l11ll1ll11 =(1-math["abs"](ll1l1l1l1ll11ll1l11l / ll11l1ll1ll11ll1ll11 - 1)) *(TUNING["DYC_HEALTHBAR_DDSIZE2"] - TUNING["DYC_HEALTHBAR_DDSIZE1"]) + TUNING["DYC_HEALTHBAR_DDSIZE1"] l1l1ll11ll1l11l1l1ll["Label"]:SetFontSize(l11l1ll1l1l11ll1ll11) if l11l1ll11l1ll1ll1l1l then
                local l1l11l1l11l1ll1l11ll = 1-ll1l11ll1l11l1ll11ll(ll1l1l1l1ll11ll1l11l / ll11l1ll1ll11ll1ll11 - 0.5) l1l1ll11ll1l11l1l1ll["Label"]:SetColour(1, l1l11l1l11l1ll1l11ll, l1l11l1l11l1ll1l11ll)
            end
            if ll1l1l1l1ll11ll1l11l >= ll1ll1ll11ll11ll11l1 then
                l1l1ll11ll1l11l1l1ll["dycddtask"]:Cancel() l1l1ll11ll1l11l1l1ll:Remove()
            end
        end
    end
    )

end

local function l1l1l11l1l11l1l11l1l()
    local l1l1ll1l1ll1l1ll1l11 = ll1l1ll1ll1l1l11l11l()
    l1l1ll1l1ll1l1ll1l11["Label"]:SetFontSize(TUNING["DYC_HEALTHBAR_DDSIZE1"])
    l1l1ll1l1ll1l1ll1l11["Label"]:Enable((110 * 465 * 416+429 ~= 21278829))
    l1l1ll1l1ll1l1ll1l11["InitHB"] = nil l1l1ll1l1ll1l1ll1l11["DamageDisplay"] = ll1l1ll1ll1ll11l11ll
    return l1l1ll1l1ll1l1ll1l11

end

return Prefab("dyc_damagedisplay", l1l1l11l1l11l1l11l1l), Prefab("dyc_healthbarchild", ll11ll11l1l11ll1ll11), Prefab("dyc_healthbar", ll1l1ll1l1l1ll1ll11l)