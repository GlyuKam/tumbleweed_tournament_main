local l11l11l1ll11ll11l1ll = require "List/list_tumbleweed_items"

local l1ll1ll1ll1ll1l11ll1 = require "easing"

local l11ll1l1ll1l1ll1ll11 ={}

local ll1l1l11l1l1l11ll11l ={}

for ll1l1ll1ll1ll11l11ll, l1l1l11l1l11l1l11l1l in pairs(require "preparedfoods")

do
    table["insert"](l11ll1l1ll1l1ll1ll11,{chance = 0.08, item = l1l1l11l1l11l1l11l1l["name"]})

end

for ll1l11l11ll11ll1l1ll, l1ll1l1l11ll1l1l1l11 in pairs(require "preparedfoods_warly")

do
    table["insert"](ll1l1l11l1l1l11ll11l,{chance = 0.04, item = l1ll1l1l11ll1l1l1l11["name"]})

end

local ll1l11ll11ll1ll1ll11 ={}

for ll11l11ll1ll11ll1l11, l1l11ll1ll11ll11l1l1 in pairs(require "prefabs/farm_plant_defs"["PLANT_DEFS"])

do
    if l1l11ll1ll11ll11l1l1["product_oversized"] ~= nil then
        table["insert"](ll1l11ll11ll1ll1ll11, l1l11ll1ll11ll11l1l1["prefab"])
    end

end

local function ll1l11ll1l11l1ll11ll()
    if not TheWorld["gz_start_time"] then
        return (string.sub("ll1l1l11ll11ll1ll1l1", 6, 12) ~= "l11ll11")
    end
    if (TheWorld["state"]["cycles"] + TheWorld["state"]["time"]) - TheWorld["gz_start_time"] < 1 then
        return (295 * 204+399 * 324 ~= 189456)
    end
    return (230 * 47-212 ~= 10605)

end

local function l11ll1ll1ll1ll11l1ll(l11l1ll1ll11ll1l11l1, ll11l11ll1l1ll1ll1ll)
    local l1l1l1l11l1l1ll11ll1 = ""
    if l11l1ll1ll11ll1l11l1["components"]["gz_player"] then
        l1l1l1l11l1l1ll11ll1 = "【" .. l11l1ll1ll11ll1l11l1["components"]["gz_player"]["p_team_num"] .. STRINGS["DC_FGC"]["DUI"]
    end
end

local function l1l1l1ll1l1ll1ll1l1l(l1ll11l1ll1l11l11l1l)
    local ll11l11ll1ll1l1l1ll1 ={}
    for l1ll11ll11ll1l1ll1l1, l11l11l1ll11l1l1ll1l in pairs(TheWorld["gz_team_managers"])
    do
        if l11l11l1ll11l1l1ll1l["survive_m"] and l11l11l1ll11l1l1ll1l:IsValid() then
            table["insert"](ll11l11ll1ll1l1l1ll1, l11l11l1ll11l1l1ll1l)
        end
    end
    local ll1l11l1ll1l1l11l11l = # ll11l11ll1ll1l1l1ll1
    if ll1l11l1ll1l1l11l11l < 2 then
        return l1ll11l1ll1l11l11l1l:GetPosition()
    end
    local l1l11l1l1ll1l1l1l11l = ll11l11ll1ll1l1l1ll1[math["random"](ll1l11l1ll1l1l11l11l)]
    ll11l11ll1ll1l1l1ll1 = nil if l1l11l1l1ll1l1l1l11l then
        return l1l11l1l1ll1l1l1l11l:GetPosition()
    else
        return l1ll11l1ll1l11l11l1l:GetPosition()
    end

end

local function ll1l11l11l1ll1ll11ll(l1ll11ll1ll11l1l11ll, l1l11l1ll1ll11ll1l1l)
    local ll11l11l1ll1l1l1l11l = l1ll11ll1ll11l1l11ll["components"]["burnable"] ~= nil and not l1ll11ll1ll11l1l11ll["components"]["burnable"]["burning"]
    if ll11l11l1ll1l1l1l11l then
        l1ll11ll1ll11l1l11ll["components"]["burnable"]["burning"] =(160+272+249 ~= 687)
    end
    TheWorld:PushEvent("ms_sendlightningstrike", l1l11l1ll1ll11ll1l1l)
    if ll11l11l1ll1l1l1l11l then
        l1ll11ll1ll11l1l11ll["components"]["burnable"]["burning"] =(436-143 * 133 == - 18581)
    end
    if l1ll11ll1ll11l1l11ll:HasTag "player" then
        l1ll11ll1ll11l1l11ll["sg"]["statemem"]["teleport_task"] = nil l1ll11ll1ll11l1l11ll["sg"]:GoToState(l1ll11ll1ll11l1l11ll:HasTag "playerghost" and "appear" or "wakeup")
        l1ll11ll1ll11l1l11ll["SoundEmitter"]:PlaySound "dontstarve/common/staffteleport"
    else
        l1ll11ll1ll11l1l11ll:Show()
        if l1ll11ll1ll11l1l11ll["DynamicShadow"] ~= nil then
            l1ll11ll1ll11l1l11ll["DynamicShadow"]:Enable((187+286+141 == 614))
        end
        if l1ll11ll1ll11l1l11ll["components"]["health"] ~= nil then
            l1ll11ll1ll11l1l11ll["components"]["health"]:SetInvincible((string.sub("l1l11ll11l1ll1ll1ll1", 8, 12) == "11111"))
        end
        l1ll11ll1ll11l1l11ll:PushEvent "teleported"
    end

end

local function ll11ll1ll11l1l11ll11(ll1l1ll1l11ll11ll11l, l11l11l11l11ll11ll11)
    if ll1l1ll1l11ll11ll11l["Physics"] ~= nil then
        ll1l1ll1l11ll11ll11l["Physics"]:Teleport(l11l11l11l11ll11ll11["x"], 0, l11l11l11l11ll11ll11["z"])
    else
        ll1l1ll1l11ll11ll11l["Transform"]:SetPosition(l11l11l11l11ll11ll11["x"], 0, l11l11l11l11ll11ll11["z"])
    end
    if ll1l1ll1l11ll11ll11l:HasTag "player" then
        ll1l1ll1l11ll11ll11l:SnapCamera()
        ll1l1ll1l11ll11ll11l:ScreenFade((string.sub("ll11ll1ll11l1ll11l1l", 7, 14) == "1ll11l1l"), 1)
        ll1l1ll1l11ll11ll11l["sg"]["statemem"]["teleport_task"] = ll1l1ll1l11ll11ll11l:DoTaskInTime(1, ll1l11l11l1ll1ll11ll, l11l11l11l11ll11ll11)
    else
        ll1l11l11l1ll1ll11ll(ll1l1ll1l11ll11ll11l, l11l11l11l11ll11ll11)
    end

end

local function ll1l1ll1ll1l1l11l11l(l11ll1l1ll11l1ll1l11)
    local l11l1l11l1l1l11ll1ll = TheWorld
    local l1l1l1ll1ll11ll1l1l1 = l1l1l1ll1l1ll1ll1l1l(l11ll1l1ll11l1ll1l11)
    if l11ll1l1ll11l1ll1l11["components"]["locomotor"] ~= nil then
        l11ll1l1ll11l1ll1l11["components"]["locomotor"]:StopMoving()
    end
    if l11l1l11l1l1l11ll1ll:HasTag "cave" then
        l11l1l11l1l1l11ll1ll:PushEvent("ms_miniquake",{rad = 3, num = 5, duration = 1.5, target = l11ll1l1ll11l1ll1l11})
        return
    end
    local l11l1l1l1ll1l1l11ll1 = l11ll1l1ll11l1ll1l11:HasTag "player"
    if l11l1l1l1ll1l1l11ll1 then
        l11ll1l1ll11l1ll1l11["sg"]:GoToState "forcetele"
    else
        if l11ll1l1ll11l1ll1l11["components"]["health"] ~= nil then
            l11ll1l1ll11l1ll1l11["components"]["health"]:SetInvincible((string.sub("ll1ll1l11l11l1l11ll1", 9, 12) ~= "l1l1"))
        end
        if l11ll1l1ll11l1ll1l11["DynamicShadow"] ~= nil then
            l11ll1l1ll11l1ll1l11["DynamicShadow"]:Enable((string.sub("l1ll1l11l11l1l1ll1ll", 7, 11) == "11111"))
        end
        l11ll1l1ll11l1ll1l11:Hide()
    end
    local ll1l1ll1ll11ll11ll11 = l11ll1l1ll11l1ll1l11["components"]["burnable"] ~= nil and not l11ll1l1ll11l1ll1l11["components"]["burnable"]["burning"]
    if ll1l1ll1ll11ll11ll11 then
        l11ll1l1ll11l1ll1l11["components"]["burnable"]["burning"] =(145 * 313 * 387 * 471 * 205 ~= 1695891537230)
    end
    l11l1l11l1l1l11ll1ll:PushEvent("ms_sendlightningstrike", l11ll1l1ll11l1ll1l11:GetPosition())
    if ll1l1ll1ll11ll11ll11 then
        l11ll1l1ll11l1ll1l11["components"]["burnable"]["burning"] =(250+48 * 303 == 14797)
    end
    l11l1l11l1l1l11ll1ll:PushEvent("ms_deltamoisture", TUNING["TELESTAFF_MOISTURE"])
    if l11l1l1l1ll1l1l11ll1 then
        l11ll1l1ll11l1ll1l11["sg"]["statemem"]["teleport_task"] = l11ll1l1ll11l1ll1l11:DoTaskInTime(3, ll11ll1ll11l1l11ll11, l1l1l1ll1ll11ll1l1l1)
    else
        ll11ll1ll11l1l11ll11(l11ll1l1ll11l1ll1l11, l1l1l1ll1ll11ll1l1l1)
    end

end

local function ll1l11l1l1ll11ll1l1l(l11ll1l1ll1ll11l1l1l, ll11l11l1ll1l1l11l1l, l11l1ll1l11ll1l1l1l1)
    local l1l1ll1l1ll1ll1ll1ll, l1l11l1l11l1l1l11ll1, l1l1l1l1ll11ll1l11ll = l11ll1l1ll1ll11l1l1l["Transform"]:GetWorldPosition()
    local l11ll11l11ll1l1ll1ll ={}
    for l1l1l1l1l1l1ll1l1ll1, ll1l1l11l11l1l11ll1l in pairs(ll11l11l1ll1l1l11l1l)
    do
        local l11l1l1ll1l1ll11ll11 = SpawnPrefab(l1l1l1l1l1l1ll1l1ll1)
        if l11l1l1ll1l1ll11ll11 then
            if l11l1ll1l11ll1l1l1l1 then
                setRandomSkinFgc(l11l1l1ll1l1ll11ll11, l11l1ll1l11ll1l1l1l1)
            end
            if ll1l1l11l11l1l11ll1l > 1 then
                if l11l1l1ll1l1ll11ll11["components"]["stackable"] then
                    l11l1l1ll1l1ll11ll11["components"]["stackable"]["stacksize"] = ll1l1l11l11l1l11ll1l
                else
                    for l11l11l11ll11l1l11l1 = 1, ll1l1l11l11l1l11ll1l - 1
                    do
                        local ll1l1ll1l1l11ll1l1ll = SpawnPrefab(l1l1l1l1l1l1ll1l1ll1)
                        if l11l1ll1l11ll1l1l1l1 then
                            setRandomSkinFgc(ll1l1ll1l1l11ll1l1ll, l11l1ll1l11ll1l1l1l1)
                        end
                        table["insert"](l11ll11l11ll1l1ll1ll, ll1l1ll1l1l11ll1l1ll)
                    end
                end
            end
            table["insert"](l11ll11l11ll1l1ll1ll, l11l1l1ll1l1ll11ll11)
        end
    end
    local ll11l1l1l1l11ll11l11 = SpawnPrefab "gift"
    ll11l1l1l1l11ll11l11["components"]["unwrappable"]:WrapItems(l11ll11l11ll1l1ll1ll)
    for l1l1ll1l11l11l11l1l1, ll11l1l1ll11l11ll1l1 in ipairs(l11ll11l11ll1l1ll1ll)
    do
        ll11l1l1ll11l11ll1l1:Remove()
    end
    ll11l1l1l1l11ll11l11["Transform"]:SetPosition(l1l1ll1l1ll1ll1ll1ll, l1l11l1l11l1l1l11ll1, l1l1l1l1ll11ll1l11ll)

end

local function ll11ll11l1l11ll1ll11(l1l1l11l11ll1l1l1l1l, ll1l1l11l11ll1ll1l1l, ll11ll11l1l1l11ll1l1)
    if l1l1l11l11ll1l1l1l1l then
        local l1l11l11ll1l1ll1l11l, l1ll1l11l11l11ll11l1, l11l11l1ll11l1l11l1l = l1l1l11l11ll1l1l1l1l["Transform"]:GetWorldPosition()
        local l11ll11l11ll11l11ll1 = nil for ll11ll11l1l1ll11ll11, l1l1l11l1ll1ll1ll1l1 in ipairs(ll1l1l11l11ll1ll1l1l)
        do
            if l1l1l11l1ll1ll1ll1l1["playerfn"] then
                l1l1l11l1ll1ll1ll1l1["playerfn"](l1l1l11l11ll1l1l1l1l)
            end
            if l1l1l11l1ll1ll1ll1l1["item"] or l1l1l11l1ll1ll1ll1l1["randomlist"] then
                local l1l1ll11ll1l11l1l1ll = l1l1l11l1ll1ll1ll1l1["num"] or 1
                local ll1l11ll1ll11ll11l1l = l1l1l11l1ll1ll1ll1l1["specialfn"] and math["random"](l1l1ll11ll1l11l1l1ll) - 1 or nil for l1ll1l1ll11l1l1l11ll = 0, l1l1ll11ll1l11l1l1ll - 1
                do
                    local l1ll1l11l1l1l1ll1l11 = l1l1l11l1ll1ll1ll1l1["item"]
                    if l1l1l11l1ll1ll1ll1l1["randomlist"] then
                        l1ll1l11l1l1l1ll1l11 = GetRandomItem(l1l1l11l1ll1ll1ll1l1["randomlist"])
                    end
                    local l1ll1l1ll1l11l1ll1ll = l1l1l11l1ll1ll1ll1l1["angle_offset"] or 0
                    local l1l11ll1l1l1l11l1ll1 =(l1ll1l1ll11l1l1l11ll + l1ll1l1ll1l11l1ll1ll) * 2 * PI /(l1l1ll11ll1l11l1l1ll)
                    local l11l1l1l1l1l11ll11ll = l1l1l11l1ll1ll1ll1l1["offset"] and 5 or 1
                    local ll11l1ll1ll11ll1ll11 = nil if l1l1l11l1ll1ll1ll1l1["randomlist"] then
                    end
                    for ll1l1ll11l11l1ll11ll = 1, l11l1l1l1l1l11ll11ll
                    do
                        local l11l1ll1l1ll1l11l11l = l1l1l11l1ll1ll1ll1l1["offset"] and (math["random"]() * 2-1) * l1l1l11l1ll1ll1ll1l1["offset"] + l1l11l11ll1l1ll1l11l or l1l1l11l1ll1ll1ll1l1["radius"] and l1l1l11l1ll1ll1ll1l1["radius"] * math["cos"](l1l11ll1l1l1l11l1ll1) + l1l11l11ll1l1ll1l11l or l1l11l11ll1l1ll1l11l
                        local ll1ll11l11l11ll11ll1 = l1ll1l11l11l11ll11l1
                        local ll1l1l1l1ll11ll1l11l = l1l1l11l1ll1ll1ll1l1["offset"] and (math["random"]() * 2-1) * l1l1l11l1ll1ll1ll1l1["offset"] + l11l11l1ll11l1l11l1l or l1l1l11l1ll1ll1ll1l1["radius"] and l1l1l11l1ll1ll1ll1l1["radius"] * math["sin"](l1l11ll1l1l1l11l1ll1) + l11l11l1ll11l1l11l1l or l11l11l1ll11l1l11l1l
                        if l1l1l11l1ll1ll1ll1l1["iswater"] then
                            ll11l1ll1ll11ll1ll11 = TheWorld["Map"]:IsOceanAtPoint(l11l1ll1l1ll1l11l11l, ll1ll11l11l11ll11ll1, ll1l1l1l1ll11ll1l11l)
                        else
                            ll11l1ll1ll11ll1ll11 = TheWorld["Map"]:IsPassableAtPoint(l11l1ll1l1ll1l11l11l, ll1ll11l11l11ll11ll1, ll1l1l1l1ll11ll1l11l)
                        end
                        if ll11l1ll1ll11ll1ll11 then
                            l11ll11l11ll11l11ll1 = SpawnPrefab(l1ll1l11l1l1l1ll1l11)
                            if l11ll11l11ll11l11ll1 then
                                l11ll11l11ll11l11ll1["Transform"]:SetPosition(l11l1ll1l1ll1l11l11l, ll1ll11l11l11ll11ll1, ll1l1l1l1ll11ll1l11l)
                                if l11ll11l11ll11l11ll1["components"]["combat"] and not l1l1l11l1ll1ll1ll1l1["noaggro"] then
                                    l11ll11l11ll11l11ll1["components"]["combat"]:SuggestTarget(l1l1l11l11ll1l1l1l1l)
                                end
                                if ll1l11ll1ll11ll11l1l and l1ll1l1ll11l1l1l11ll == ll1l11ll1ll11ll11l1l then
                                    l1l1l11l1ll1ll1ll1l1["specialfn"](l11ll11l11ll11l11ll1, l1l1l11l11ll1l1l1l1l)
                                elseif l1l1l11l1ll1ll1ll1l1["itemfn"] then
                                    l1l1l11l1ll1ll1ll1l1["itemfn"](l11ll11l11ll11l11ll1, l1l1l11l11ll1l1l1l1l)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end
        if ll11ll11l1l1l11ll1l1 then
            l11ll1ll1ll1ll11l1ll(l1l1l11l11ll1l1l1l1l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1l1l11l11ll1l1l1l1l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"][ll11ll11l1l1l11ll1l1])
        end
    end

end

local ll1l1ll1l1l1ll1ll11l ={basic_resources ={resourcesList = l11l11l1ll11ll11l1ll["basic_resources"], multiple = TUNING["BASIC_RESOURCES_MULTIPLE"], weightClass = "goodMin"}, advanced_resources ={resourcesList = l11l11l1ll11ll11l1ll["advanced_resources"], multiple = TUNING["ADVANCED_RESOURCES_MULTIPLE"], weightClass = "goodMid"}, scarce_resources ={resourcesList = l11l11l1ll11ll11l1ll["scarce_resources"], multiple = TUNING["SCARCE_RESOURCES_MULTIPLE"], weightClass = "goodMax"}, basic_foods_resources ={resourcesList = l11l11l1ll11ll11l1ll["basic_foods_resources"], multiple = TUNING["BASIC_FOODS_MULTIPLE"], weightClass = "goodMin"}, advanced_foods_resources ={resourcesList = l11l11l1ll11ll11l1ll["advanced_foods_resources"], multiple = TUNING["ADVANCED_FOODS_MULTIPLE"], weightClass = "goodMid"}, preparedfoods_resources ={resourcesList = l11ll1l1ll1l1ll1ll11, multiple = TUNING["PREPAREDFOODS_MULTIPLE"], weightClass = "goodMax", compensationMult = - 0.2}, preparedfoods_warly_resources ={resourcesList = ll1l1l11l1l1l11ll11l, multiple = TUNING["PREPAREDFOODS_WARLY_MULTIPLE"], weightClass = "goodMax", compensationMult = - 0.6}, blueprints_resources ={resourcesList = l11l11l1ll11ll11l1ll["blueprints_resources"], multiple = TUNING["BLUEPRINTS_MULTIPLE"], weightClass = "goodMid"}, basic_tools_resources ={resourcesList = l11l11l1ll11ll11l1ll["basic_tools_resources"], multiple = TUNING["BASIC_TOOLS_MULTIPLE"], weightClass = "goodMin"}, advanced_tools_resources ={resourcesList = l11l11l1ll11ll11l1ll["advanced_tools_resources"], multiple = TUNING["ADVANCED_TOOLS_MULTIPLE"], weightClass = "goodMid"}, scarce_tools_resources ={resourcesList = l11l11l1ll11ll11l1ll["scarce_tools_resources"], multiple = TUNING["SCARCE_TOOLS_MULTIPLE"], weightClass = "goodMax"}, basic_equipments_resources ={resourcesList = l11l11l1ll11ll11l1ll["basic_equipments_resources"], multiple = TUNING["BASIC_EQUIPMENTS_MULTIPLE"], weightClass = "goodMin"}, advanced_equipments_resources ={resourcesList = l11l11l1ll11ll11l1ll["advanced_equipments_resources"], multiple = TUNING["ADVANCED_EQUIPMENTS_MULTIPLE"], weightClass = "goodMid"}, scarce_equipments_resources ={resourcesList = l11l11l1ll11ll11l1ll["scarce_equipments_resources"], multiple = TUNING["SCARCE_EQUIPMENTS_MULTIPLE"], weightClass = "goodMax"}, basic_monsters_resources ={resourcesList = l11l11l1ll11ll11l1ll["basic_monsters_resources"], multiple = TUNING["BASIC_MONSTERS_MULTIPLE"], weightClass = "badMin"}, advanced_monsters_resources ={resourcesList = l11l11l1ll11ll11l1ll["advanced_monsters_resources"], multiple = TUNING["ADVANCED_MONSTERS_MULTIPLE"], weightClass = "badMid"}, scarce_monsters_resources ={resourcesList = l11l11l1ll11ll11l1ll["scarce_monsters_resources"], multiple = TUNING["SCARCE_MONSTERS_MULTIPLE"], weightClass = "badMax"}, seek_death_resources ={resourcesList ={{chance = 0.06, pickfn = function(ll1l1ll1l1l1l1ll1l11, l1l1l1l1l11l1l11ll11)
    local ll1ll1ll11ll11ll11l1 ={{playerfn = function(l11l1ll11l1ll1ll1l1l)
        local l11l1l1l1l1l11l1ll1l = 10 local ll1l1l11l1l11l1ll11l, l11l11l1ll11l1ll1l1l, l1ll1l11l11l1l1ll1ll = l11l1ll11l1ll1ll1l1l["Transform"]:GetWorldPosition() l11l1ll11l1ll1ll1l1l:StartThread(function()
            for l11l1ll1l1l11ll1ll11 = 0, l11l1l1l1l1l11l1ll1l - 1 do
                local l1l11ll11l11ll11l1l1 = math["random"](3, 10) local ll1ll1ll1ll11ll1l1l1 = l11l1ll1l1l11ll1ll11 * 2 * PI /(l11l1l1l1l1l11l1ll1l) local l1ll1l1l11l11l11l1l1 = Vector3(l1l11ll11l11ll11l1l1 * math["cos"](ll1ll1ll1ll11ll1l1l1) + ll1l1l11l1l11l1ll11l, l11l11l1ll11l1ll1l1l, l1l11ll11l11ll11l1l1 * math["sin"](ll1ll1ll1ll11ll1l1l1) + l1ll1l11l11l1l1ll1ll) TheWorld:PushEvent("ms_sendlightningstrike", l1ll1l1l11l11l11l1l1) Sleep(.3+math["random"]() * .2)
            end
        end
        )
    end
    }} ll11ll11l1l11ll1ll11(l1l1l1l1l11l1l11ll11, ll1ll1ll11ll11ll11l1, "QTPL")

end
},{chance = 0.05, pickfn = function(l1ll1l11l11l11l11ll1, l1l11l1l11l1ll1l11ll)
    local l1l1ll1l1ll1l1ll1l11 ={{playerfn = function(l11l11l1l11l1l1ll1ll)
        if l11l11l1l11l1l1ll1ll["components"]["sanity"] ~= nil then
            l11l11l1l11l1l1ll1ll["components"]["sanity"]:SetPercent(0)
        end
    end
    }} ll11ll11l1l11ll1ll11(l1l11l1l11l1ll1l11ll, l1l1ll1l1ll1l1ll1l11, "JSFB")

end
},{chance = 0.03, pickfn = function(l1l1ll1l1l11l1ll1l11, ll11ll1l11l1l11l1l11)
    local ll1ll11l1l11l1ll1l11 ={{item = "tallbird", num = 6, radius = 4}} ll11ll11l1l11ll1ll11(ll11ll1l11l1l11l1l11, ll1ll11l1l11l1ll1l11, "GNGQ")

end
},{chance = 0.02, pickfn = function(l11ll1l11ll11l1l11l1, l1l1ll1l1l1l1l11l1l1)
    local l1l1l1l11ll1l1ll1l1l ={{item = "wasphive", num = 6, radius = 7}} ll11ll11l1l11ll1ll11(l1l1ll1l1l1l1l11l1l1, l1l1l1l11ll1l1ll1l1l, "SRFZ")

end
},{chance = 0.03, pickfn = function(l1l1l1l1l11l1ll11l11, ll1l1l11l1l1ll11l1ll)
    local l11ll1ll1ll1ll1ll11l ={{item = "wall_stone", num = 8, radius = 2},{item = "tentacle", num = 8, radius = 5}} ll11ll11l1l11ll1ll11(ll1l1l11l1l1ll11l1ll, l11ll1ll1ll1ll1ll11l, "CSLL")

end
},{chance = 0.005, pickfn = function(ll11l1l1l1l1ll1l1ll1, l11l11l11ll1ll1l11ll)
    local ll11ll11l1l11l1l1ll1 ={{item = "gunpowder", num = 8, radius = 3, itemfn = function(ll11l1l1l1l1ll1l1ll1, ll1ll11l1l1l11l1ll1l)
        if ll11l1l1l1l1ll1l1ll1["components"]["explosive"] then
            ll11l1l1l1l1ll1l1ll1["components"]["explosive"]:OnBurnt()
        end
    end
    }} ll11ll11l1l11ll1ll11(l11l11l11ll1ll1l11ll, ll11ll11l1l11l1l1ll1, "BZFZ")

end
},{chance = 0.02, pickfn = function(l1ll11l11l1l1l11l1ll, l11ll1l1ll1ll11ll1l1)
    local l1ll1l1ll1ll11ll11ll ={{item = "wall_wood", num = 8, radius = 2, itemfn = function(l1ll11l11l1l1l11l1ll, l11l1l11l1ll1ll1l11l)
        if l1ll11l11l1l1l11l1ll["components"]["burnable"] then
            l1ll11l11l1l1l11l1ll["components"]["burnable"]:Ignite((416 * 385 * 465 ~= 74474410))
        end
    end
    }} ll11ll11l1l11ll1ll11(l11ll1l1ll1ll11ll1l1, l1ll1l1ll1ll11ll11ll, "RSXJ")

end
},{chance = 0.05, pickfn = function(l1l1l1l11ll1l1l1ll1l, l11l1l11ll11l11l1l11)
    local l11l11ll11l11l1ll11l ={{playerfn = function(ll1l11ll1ll11ll1l1l1)
        if ll1l11ll1ll11ll1l1l1["components"]["pinnable"] ~= nil then
            ll1l11ll1ll11ll1l1l1["components"]["pinnable"]:Stick()
        end
    end
    }} ll11ll11l1l11ll1ll11(l11l1l11ll11l11l1l11, l11l11ll11l11l1ll11l, "WFZB")

end
},{chance = 0.03, pickfn = function(l1l1l1ll1l1l1l1ll1l1, l11ll1ll11l11l11ll11)
    local l1l11l1ll11l1l11ll11 ={{item = "wall_moonrock", num = 8, radius = 1},{item = "mosquito", num = 8, radius = 4, noaggro =(string.sub("l11l1ll1l11ll1l1l1l1", 9, 11) ~= "ll1"), itemfn = function(l1l1l1ll1l1l1l1ll1l1, l1ll1ll1l1l11l1l1l11)
        if l1l1l1ll1l1l1l1ll1l1["drinks"] then
            l1l1l1ll1l1l1l1ll1l1["drinks"] = 4 l1l1l1ll1l1l1l1ll1l1["AnimState"]:Show "body_4"
        end
    end
    }} ll11ll11l1l11ll1ll11(l11ll1ll11l11l11ll11, l1l11l1ll11l1l11ll11, "ZAZW")

end
},{chance = 0.02, pickfn = function(ll11l1l1l1l1l11l1ll1, ll1ll11ll1l1ll1l1ll1)
    local l1l11l1l1l1ll1l1ll1l ={{item = "mole", num = 1, offset = 2},{item = "gunpowder", num = 1, itemfn = function(ll11l1l1l1l1l11l1ll1, l1ll1ll1l11ll11ll11l)
        if l1ll1ll1l11ll11ll11l["components"]["grogginess"] then
            l1ll1ll1l11ll11ll11l["components"]["grogginess"]:AddGrogginess(10, 10)
        end
    end
    }} ll11ll11l1l11ll1ll11(ll1ll11ll1l1ll1l1ll1, l1l11l1l1l1ll1l1ll1l, "CSBX")

end
},{chance = 0.016, pickfn = function(l11l11ll1l1ll1l1ll11, ll1l1l1l1l1ll1l11ll1)
    if not ll1l11ll1l11l1ll11ll() then
        return
    end
    local l11l1ll11l1l11l1l11l ={{item = "deciduoustree", num = 4, radius = 1, itemfn = function(l11l11ll1l1ll1l1ll11, l1l1l1l11ll11l1l11l1)
        if l11l11ll1l1ll1l1ll11["StartMonster"] then
            l11l11ll1l1ll1l1ll11:StartMonster((435 * 25 * 52-444 == 565056))
        end
    end
    }} ll11ll11l1l11ll1ll11(ll1l1l1l1l1ll1l11ll1, l11l1ll11l1l11l1l11l, "ESMT")

end
},{chance = 0.02, pickfn = function(ll1ll1ll1ll1l11l1l1l, ll1l1ll1l1l1l11l11l1)
    local l1l11l1l1l1ll1l1ll11 ={{item = "shadow_knight", num = 1, offset = 2},{item = "shadow_bishop", num = 1, offset = 2},{item = "shadow_rook", num = 1, offset = 2}} ll11ll11l1l11ll1ll11(ll1l1ll1l1l1l11l11l1, l1l11l1l1l1ll1l1ll11, "AYSJL")

end
},{chance = 0.03, pickfn = function(l11l1l11l11l11ll1l11, l11ll1ll11ll11l1l1ll)
    local l11ll11ll11l1ll11l11 ={{item = "fossil_stalker", num = 8, radius = 2},{item = "frog", num = 8, radius = 1, itemfn = function(l11l1l11l11l11ll1l11, l1ll1l1l1ll11ll11l11)
        if l11l1l11l11l11ll1l11["components"]["combat"] then
            l11l1l11l11l11ll1l11["components"]["combat"]:SetDefaultDamage(0.1)
        end
        if l11l1l11l11l11ll1l11["components"]["lootdropper"] then
            l11l1l11l11l11ll1l11["components"]["lootdropper"]:AddChanceLoot("hammer", 0.1)
        end
    end
    }} ll11ll11l1l11ll1ll11(l11ll1ll11ll11l1l1ll, l11ll11ll11l1ll11l11, "BZSW")

end
},{chance = 0.04, pickfn = function(l1l1l11ll1ll11l1l1l1, l1l11l1ll1l11l11ll11)
    local l1l11ll11ll1l1l1ll11 ={{playerfn = function(l1l1l1l11l11l11l1ll1)
        if TheWorld["state"]["israining"] or TheWorld["state"]["issnowing"] then
            TheWorld:PushEvent("ms_forceprecipitation",(string.sub("l1l11ll11l1l11l11l11", 9, 11) ~= "1l1"))
        else
            TheWorld:PushEvent("ms_forceprecipitation",(string.sub("ll1ll11l1ll11l1l1l11", 6, 14) == "11l1ll11l"))
        end
    end
    }} ll11ll11l1l11ll1ll11(l1l11l1ll1l11l11ll11, l1l11ll11ll1l1l1ll11, "YQBD")

end
},{chance = 0.03, pickfn = function(ll1l1l11l1l11l1l1l1l, ll1ll1l1ll11ll1ll1ll)
    local ll1l1l11l11ll11l11l1 ={{playerfn = function(ll1ll11l1l1ll11ll11l)
        local l1ll1l1l1ll11ll11l1l = 20 local ll11l1l1l11l1ll1l1ll, l1l11l11ll1l1l11l11l, l1ll1l11ll1ll1l11l1l = ll1ll11l1l1ll11ll11l["Transform"]:GetWorldPosition() ll1ll11l1l1ll11ll11l:StartThread(function()
            for ll1ll11l1ll11l1l11ll = 0, l1ll1l1l1ll11ll11l1l - 1 do
                local l1l11l1l1ll11l1l1l1l = math["random"]() * 2 * PI local l1l11l1ll1ll11ll11l1 = l1ll1ll1ll1ll1l11ll1["outSine"](math["random"](), math["random"]() * 5, 5, 1) local l11ll11l11l1l11ll1ll = FindValidPositionByFan(l1l11l1l1ll11l1l1l1l, l1l11l1ll1ll11ll11l1, 30, function(l1l1l1l1ll11l11l1l11)
                    return TheWorld["Map"]:IsPassableAtPoint(ll11l1l1l11l1ll1l1ll + l1l1l1l1ll11l11l1l11["x"], l1l11l11ll1l1l11l11l + l1l1l1l1ll11l11l1l11["y"], l1ll1l11ll1ll1l11l1l + l1l1l1l1ll11l11l1l11["z"])
                end
                ) if l11ll11l11l1l11ll1ll then
                    local l11ll11l1l1l11ll11ll = SpawnPrefab "shadowmeteor" l11ll11l1l1l11ll11ll["Transform"]:SetPosition(ll11l1l1l11l1ll1l1ll + l11ll11l11l1l11ll1ll["x"], l1l11l11ll1l1l11l11l + l11ll11l11l1l11ll1ll["y"], l1ll1l11ll1ll1l11l1l + l11ll11l11l1l11ll1ll["z"]) Sleep(.3+math["random"]() * .2)
                end
            end
        end
        )
    end
    }} ll11ll11l1l11ll1ll11(ll1ll1l1ll11ll1ll1ll, ll1l1l11l11ll11l11l1, "LXY")

end
},{chance = 0.03, pickfn = function(l11l1l11ll1l11l11l1l, l11l1l1l1ll1l11ll11l)
    local l11l11l1l11ll1l1l1ll ={{item = "sporecloud", num = 6, radius = 2},{item = "mushroomsprout", num = 6, radius = 2},{item = "sporecloud", num = 1, itemfn = function(l11l1l11ll1l11l11l1l, ll1ll1ll11ll1l1ll1ll)
        if ll1ll1ll11ll1l1ll1ll["components"]["grogginess"] ~= nil then
            ll1ll1ll11ll1l1ll1ll["components"]["grogginess"]:AddGrogginess(5, 10)
        end
    end
    }} ll11ll11l1l11ll1ll11(l11l1l1l1ll1l11ll11l, l11l11l1l11ll1l1l1ll, "FXZD")

end
},{chance = 0.03, pickfn = function(ll11l11l1ll11l11ll11, l11l1l11l1l1ll1l1ll1)
    if not ll1l11ll1l11l1ll11ll() then
        return
    end
    local ll1l1l11ll11l1l1ll11 ={{playerfn = function(ll1l1l1ll11l11l1l1ll)
        ll1l1ll1ll1l1l11l11l(ll1l1l1ll11l11l1l1ll)
    end
    }} ll11ll11l1l11ll1ll11(l11l1l11l1l1ll1l1ll1, ll1l1l11ll11l1l1ll11, "KJLL")

end
},{chance = 0.03, pickfn = function(ll11l11l1l11ll11ll1l, l1l1l1ll1l1l11l1l1ll)
    local l1ll1l1l1ll11l1l11l1 ={{playerfn = function(l11l1ll11l1ll11l1ll1)
        local l1l1ll11l1l11l1l1l11 = 12 local l11l1l11l1ll1ll11l11 = 3 local ll11ll1l1l11l11l1l11 = 8 local l1ll11l1l11l11l11ll1 = 4 local ll11l11l11ll11ll1l11, l1l1l1ll1l11l11ll11l, l11l11ll1l1l11ll11ll = l11l1ll11l1ll11l1ll1["Transform"]:GetWorldPosition() for l11l1l11l11l1ll11l11 = 0, ll11ll1l1l11l11l1l11 - 1 do
            local l1l11ll11ll11l1ll1l1 = l11l1l11l11l1ll11l11 * 2 * PI /(ll11ll1l1l11l11l1l11) if TheWorld["Map"]:IsPassableAtPoint(l1ll11l1l11l11l11ll1 * math["cos"](l1l11ll11ll11l1ll1l1) + ll11l11l11ll11ll1l11, l1l1l1ll1l11l11ll11l, l1ll11l1l11l11l11ll1 * math["sin"](l1l11ll11ll11l1ll1l1) + l11l11ll1l1l11ll11ll) then
                local l11l1l11l1ll1ll1l1l1 = SpawnPrefab "sandblock" l11l1l11l1ll1ll1l1l1["Transform"]:SetPosition(l1ll11l1l11l11l11ll1 * math["cos"](l1l11ll11ll11l1ll1l1) + ll11l11l11ll11ll1l11, l1l1l1ll1l11l11ll11l, l1ll11l1l11l11l11ll1 * math["sin"](l1l11ll11ll11l1ll1l1) + l11l11ll1l1l11ll11ll)
            end
        end
        l11l1ll11l1ll11l1ll1:StartThread(function()
            for ll11l1ll1l11l1ll1l1l = 0, l11l1l11l1ll1ll11l11 - 1 do
                for l11ll11l1ll1ll1ll1ll = 0, l1l1ll11l1l11l1l1l11 - 1 do
                    local ll11l11l1l1ll1ll1ll1 = math["random"]() * 2 * PI local l1ll11l1l11l11l11ll1 = l1ll1ll1ll1ll1l11ll1["outSine"](math["random"](), math["random"]() * 2, 2, 1) local l11ll11l1l11ll1l1l1l = FindValidPositionByFan(ll11l11l1l1ll1ll1ll1, l1ll11l1l11l11l11ll1, 30, function(ll11ll1l11ll11ll1l11)
                        return TheWorld["Map"]:IsPassableAtPoint(ll11l11l11ll11ll1l11 + ll11ll1l11ll11ll1l11["x"], l1l1l1ll1l11l11ll11l + ll11ll1l11ll11ll1l11["y"], l11l11ll1l1l11ll11ll + ll11ll1l11ll11ll1l11["z"])
                    end
                    ) if l11ll11l1l11ll1l1l1l then
                        local l11ll1ll1l1l1l1ll1ll = SpawnPrefab "sandspike" l11ll1ll1l1l1l1ll1ll["Transform"]:SetPosition(ll11l11l11ll11ll1l11 + l11ll11l1l11ll1l1l1l["x"], l1l1l1ll1l11l11ll11l + l11ll11l1l11ll1l1l1l["y"], l11l11ll1l1l11ll11ll + l11ll11l1l11ll1l1l1l["z"])
                    end
                end
                Sleep(1+math["random"]() * 1)
            end
        end
        )
    end
    }} ll11ll11l1l11ll1ll11(l1l1l1ll1l1l11l1l1ll, l1ll1l1l1ll11l1l11l1, "SMTC")

end
},{chance = 0.04, pickfn = function(l1ll1l1ll1ll1ll11ll1, ll1l1l1l1ll1ll11l11l)
    local ll1ll1ll1l11ll1l1l11 ={{item = "deer_ice_circle", num = 1, itemfn = function(l1ll1l1ll1ll1ll11ll1, ll1l1ll11l11ll1ll1l1)
        l1ll1l1ll1ll1ll11ll1:DoTaskInTime(10, l1ll1l1ll1ll1ll11ll1["KillFX"]) local l11l1ll1l1ll1l1l1ll1, ll1ll11ll1l1l11l1ll1, ll11l1l1ll1l11ll11ll = ll1l1ll11l11ll1ll1l1["Transform"]:GetWorldPosition() local ll1l1l1ll11ll11ll11l = TheSim:FindEntities(l11l1ll1l1ll1l1l1ll1, ll1ll11ll1l1l11l1ll1, ll11l1l1ll1l11ll11ll, 4,{"freezable"},{"FX", "NOCLICK", "DECOR", "INLIMBO"}) for ll11l1l1l1l1l11ll1ll, ll1ll11l1l1ll1l11l11 in pairs(ll1l1l1ll11ll11ll11l) do
            if ll1ll11l1l1ll1l11l11["components"]["freezable"] then
                ll1ll11l1l1ll1l11l11["components"]["freezable"]:AddColdness(6)
            end
        end
    end
    }} ll11ll11l1l11ll1ll11(ll1l1l1l1ll1ll11l11l, ll1ll1ll1l11ll1l1l11, "BDYY")

end
},{chance = 0.01, pickfn = function(l1l1l1l1l1ll1ll1l1l1, l11ll1l1l11l1ll1ll11)
    if not ll1l11ll1l11l1ll11ll() then
        return
    end
    local l1l11ll1l1ll1l1l1ll1 ={{item = "deer_fire_circle", num = 1, itemfn = function(l1l1l1l1l1ll1ll1l1l1, ll11ll1l11ll1ll1ll11)
        l1l1l1l1l1ll1ll1l1l1:DoTaskInTime(2, l1l1l1l1l1ll1ll1l1l1["KillFX"])
    end
    },{item = "snurtle", num = 6, radius = 1},{item = "saltlick", num = 8, radius = 2}} ll11ll11l1l11ll1ll11(l11ll1l1l11l1ll1ll11, l1l11ll1l1ll1l1l1ll1, "YJWN")

end
},{chance = 0.04, pickfn = function(l1l11ll11ll11ll1l1l1, ll1l1ll1l1ll1l1ll1l1)
    local l1l1l11l1l1ll11ll11l ={{item = "waterballoon", num = 6, itemfn = function(l1l11ll11ll11ll1l1l1, l1ll11l11l11ll1ll11l)
        if l1l11ll11ll11ll1l1l1["components"]["complexprojectile"] then
            l1l11ll11ll11ll1l1l1["components"]["complexprojectile"]:Hit(l1ll11l11l11ll1ll11l)
        end
    end
    }} ll11ll11l1l11ll1ll11(ll1l1ll1l1ll1l1ll1l1, l1l1l11l1l1ll11ll11l, "SSYH")

end
},{chance = 0.03, pickfn = function(ll11l11ll1ll1l1ll1ll, l1l11l11ll11ll1l11l1)
    local ll1l1l1l1l1ll1ll1l1l ={{item = "fossilspike2", num = 8, offset = 1.5},{item = "fossilspike", num = 8, radius = 1.5}} ll11ll11l1l11ll1ll11(l1l11l11ll11ll1l11l1, ll1l1l1l1l1ll1ll1l1l, "AYGL")

end
},{chance = 0.03, pickfn = function(ll1ll1l11l1l11l11l11, ll1ll1l1l11ll11l11ll)
    local l11ll1l11ll1ll1ll1l1 ={{item = "alterguardian_phase3trap", num = 1},{item = "alterguardian_phase2spike", num = 10, radius = 3.5, itemfn = function(ll1ll1l11l1l11l11l11, ll1l1l1ll11l1l1ll1ll)
        if ll1ll1l11l1l11l11l11["components"]["workable"] then
            ll1ll1l11l1l11l11l11["components"]["workable"]:SetOnWorkCallback(function(ll1ll1l11l1l11l11l11, ll1ll1l1l11ll1ll11l1)
                local l11ll1ll1l11l1l11l11 = SpawnPrefab "gunpowder" if l11ll1ll1l11l1l11l11 then
                    l11ll1ll1l11l1l11l11["Transform"]:SetPosition(ll1ll1l11l1l11l11l11["Transform"]:GetWorldPosition()) if l11ll1ll1l11l1l11l11["components"]["explosive"] then
                        l11ll1ll1l11l1l11l11["components"]["explosive"]:OnBurnt()
                    end
                end
            end
            )
        end
    end
    }} ll11ll11l1l11ll1ll11(ll1ll1l1l11ll11l11ll, l11ll1l11ll1ll1ll1l1, "DSZD")

end
},{chance = 0.03, pickfn = function(l1l11ll1ll1ll1ll11l1, l1ll1l11l11ll1ll11ll)
    local ll11l1l11l11ll11ll1l ={{item = "bird_mutant_spitter", num = 6, radius = 3},{item = "alterguardian_phase2spike", num = 10, radius = 2.5}} ll11ll11l1l11ll1ll11(l1ll1l11l11ll1ll11ll, ll11l1l11l11ll11ll1l, "THGD")

end
}}, multiple = TUNING["SEEK_DEATH_MULTIPLE"], weightClass = "badMax"}, special_welfare_resources ={resourcesList ={{chance = 0.03, pickfn = function(ll1ll1ll1ll11l1ll1l1, l11ll11ll11l1ll1l11l)
    local l11ll11ll11l1l11l1ll ={{item = "warg", num = 1, noaggro =(string.sub("l1l1ll11ll11ll1ll1ll", 9, 12) == "ll11")},{item = "marbletree", num = 10, radius = 3}} ll11ll11l1l11ll1ll11(l11ll11ll11l1ll1l11l, l11ll11ll11l1l11l1ll, "JYGW")

end
},{chance = 0.03, pickfn = function(l11l11ll1l11l1l1l1l1, l1l1ll1l1ll1ll11l1ll)
    local ll11l11l11ll11l11ll1 ={{item = "icebox", num = 1, itemfn = function(l11l11ll1l11l1l1l1l1, ll11l11l11ll1ll1l1ll)
        setRandomSkinFgc(l11l11ll1l11l1l1l1l1, ll11l11l11ll1ll1l1ll) local l11l1ll1l1l1l11l1ll1 ={"ice", "berries", "red_cap", "green_cap", "blue_cap", "butterflywings", "carrot", "pumpkin", "dragonfruit", "pomegranate", "corn", "eggplant", "watermelon", "potato", "kelp", "cave_banana", "smallmeat", "meat", "drumstick", "monstermeat", "plantmeat", "bird_egg", "fishmeat", "froglegs", "honey"} for l1ll1l11l11l1ll11l11 = 1, math["random"](5, 9) do
            local ll1l1ll1ll1l1l1l11l1 = SpawnPrefab(GetRandomItem(l11l1ll1l1l1l11l1ll1)) if ll1l1ll1ll1l1l1l11l1 then
                if ll1l1ll1ll1l1l1l11l1["components"]["stackable"] then
                    ll1l1ll1ll1l1l1l11l1["components"]["stackable"]["stacksize"] = math["random"](3)
                end
                if l11l11ll1l11l1l1l1l1["components"]["container"] then
                    l11l11ll1l11l1l1l1l1["components"]["container"]:GiveItem(ll1l1ll1ll1l1l1l11l1)
                else
                    ll1l1ll1ll1l1l1l11l1:Remove()
                end
            end
        end
    end
    },{item = "cookpot", num = 6, radius = 3, itemfn = function(l11l11ll1l11l1l1l1l1, l1ll1ll11l1l1l11ll11)
        setRandomSkinFgc(l11l11ll1l11l1l1l1l1, l1ll1ll11l1l1l11ll11)
    end
    }} ll11ll11l1l11ll1ll11(l1l1ll1l1ll1ll11l1ll, ll11l11l11ll11l11ll1, "DCTZ")

end
},{chance = 0.01, pickfn = function(ll11l11ll1l1ll1l1l11, l11l11l11l1l1l11ll1l)
    local l1ll11ll1l1l1ll1ll11 ={{item = "ancient_altar", num = 1},{item = "ruins_statue_mage", num = 8, radius = 4}} ll11ll11l1l11ll1ll11(l11l11l11l1l1l11ll1l, l1ll11ll1l1l1ll1ll11, "YGQY")

end
},{chance = 0.03, pickfn = function(l1l1l1l11ll1l11ll11l, ll1l11l11l1l11ll11l1)
    local l1ll11ll11l1ll1l11ll ={{item = "resurrectionstone", num = 1, offset = 2}} ll11ll11l1l11ll1ll11(ll1l11l11l1l11ll11l1, l1ll11ll11l1ll1l11ll, "FHS")

end
},{chance = 0.05, pickfn = function(l1ll1l1l11l11l1ll1ll, ll1l1l11l11ll1l1ll11)
    local ll1l11ll1l11l11l1l11 ={{item = "reeds", num = 8, offset = 3},{item = "tentacle", num = 8, offset = 3, noaggro =(6+134+123 * 352 * 309 ~= 13378614)}} ll11ll11l1l11ll1ll11(ll1l1l11l11ll1l1ll11, ll1l11ll1l11l11l1l11, "LWQY")

end
},{chance = 0.04, pickfn = function(ll1l1l11l11l11ll1l11, l11l1ll11ll1ll1ll1l1)
    local l11l1ll11ll11ll1l1ll ={{randomlist ={"flower_cave", "flower_cave_double", "flower_cave_triple", "lightflier_flower"}, num = 9, radius = 4}} ll11ll11l1l11ll1ll11(l11l1ll11ll1ll1ll1l1, l11l1ll11ll11ll1l1ll, "XWZG")

end
},{chance = 0.04, pickfn = function(l1ll11l11l1l1l1l11ll, l11l11l1l1l11ll11l11)
    local ll1ll1l1ll11ll11l1l1 ={{randomlist ={"cactus", "oasis_cactus"}, num = 6, radius = 4}} ll11ll11l1l11ll1ll11(l11l11l1l1l11ll11l11, ll1ll1l1ll11ll11l1l1, "SMLZ")

end
},{chance = 0.06, pickfn = function(l1ll11ll1l1l1l11l1l1, l1ll11l1ll1l1l11l1l1)
    local l1l1l11ll11l1ll11l1l ={{randomlist ={"red_mushroom", "green_mushroom", "blue_mushroom"}, num = 10, radius = 4}} ll11ll11l1l11ll1ll11(l1ll11l1ll1l1l11l1l1, l1l1l11ll11l1ll11l1l, "MGGQ")

end
},{chance = 0.05, pickfn = function(l11ll1ll1ll1l1l11l11, l1l1ll1ll1l1ll1ll1l1)
    local l1l11l11l1l11l1ll1ll ={{item = "grass", num = 10, offset = 3}} ll11ll11l1l11ll1ll11(l1l1ll1ll1l1ll1ll1l1, l1l11l11l1l11l1ll1ll, "QQCY")

end
},{chance = 0.06, pickfn = function(l1ll1l11l1l1ll1l1l1l, l11l1l1l1l1l1ll1ll11)
    local ll1l11l1l1l1l1l1l1ll ={{randomlist ={"berrybush", "berrybush2", "berrybush_juicy"}, num = 9, radius = 4}} ll11ll11l1l11ll1ll11(l11l1l1l1l1l1ll1ll11, ll1l11l1l1l1l1l1l1ll, "NFGY")

end
},{chance = 0.07, pickfn = function(l11l1l1l11l1l1ll1l11, l11ll1ll11ll11l11l11)
    local ll11ll11l1l1l1ll1ll1 ={{randomlist ={"rock1", "rock2", "rock_flintless", "rock_ice", "rock_moon"}, num = 9, radius = 5}} ll11ll11l1l11ll1ll11(l11ll1ll11ll11l11l11, ll11ll11l1l1l1ll1ll1, "WRKQ")

end
},{chance = 0.04, pickfn = function(l1l11l1l1ll11l1l1ll1, l1l11l11ll1l1ll1l1l1)
    local l1l1l1ll1ll1ll1ll1ll ={{item = "rabbithole", num = 3, offset = 3}} ll11ll11l1l11ll1ll11(l1l11l11ll1l1ll1l1l1, l1l1l1ll1ll1ll1ll1ll, "ALSXJ")

end
},{chance = 0.04, pickfn = function(l11ll1l1ll11l11l11ll, ll11l1ll1l1ll11l1l11)
    local ll1ll1l1l1ll11l1ll1l = nil if ll11l1ll1l1ll11l1l11 ~= nil then
        local l11l1ll1l1ll1l1l11ll ={anchor_item = 1, mast_item = 1, steeringwheel_item = 1} if TUNING["gz_GameMode"] == "Naval" then
            l11l1ll1l1ll1l1l11ll["boat_item"] = 1
        end
        ll1l11l1l1ll11ll1l1l(l11ll1l1ll11l11l11ll, l11l1ll1l1ll1l1l11ll, ll11l1ll1l1ll11l1l11) l11ll1ll1ll1ll11l1ll(ll11l1ll1l1ll11l1l11, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll11l1ll1l1ll11l1l11:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["HHTZ"])
    end

end
},{chance = 0.02, pickfn = function(l1l11l11l11l1l11l11l, l1l1ll11ll1l1l11ll11)
    local l1l1l11l1l1ll1ll1l11 ={{item = "flower_evil", num = 1},{item = "flower_evil", num = 4, radius = 1},{item = "flower_evil", num = 7, radius = 2},{item = "flower_evil", num = 10, radius = 3}} ll11ll11l1l11ll1ll11(l1l1ll11ll1l1l11ll11, l1l1l11l1l1ll1ll1l11, "EMHY")

end
},{chance = 0.06, pickfn = function(l1l1ll1l1l11l11l1l11, l11l1l1l1l1l1l11ll1l)
    if l11l1l1l1l1l1l11ll1l ~= nil then
        local l1ll1l11l1l11l1l11ll ={amulet = 1, lifeinjector = 1, bandage = 1, spidergland = 1} ll1l11l1l1ll11ll1l1l(l1l1ll1l1l11l11l1l11, l1ll1l11l1l11l1l11ll, l11l1l1l1l1l1l11ll1l) l11ll1ll1ll1ll11l1ll(l11l1l1l1l1l1l11ll1l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l11l1l1l1l1l1l11ll1l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["YLB"])
    end

end
},{chance = 0.01, pickfn = function(ll1ll11l11ll1l1ll1l1, l1l1ll1ll1l11l11l1l1)
    if l1l1ll1ll1l11l11l1l1 ~= nil then
        local l1l11l11l1l1l1l11l1l ={skeletonhat = 1, armorskeleton = 1, nightmarefuel = 1} ll1l11l1l1ll11ll1l1l(ll1ll11l11ll1l1ll1l1, l1l11l11l1l1l1l11l1l, l1l1ll1ll1l11l11l1l1) l11ll1ll1ll1ll11l1ll(l1l1ll1ll1l11l11l1l1, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1l1ll1ll1l11l11l1l1:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["GTTZ"])
    end

end
},{chance = 0.05, pickfn = function(ll11l1l1ll1l1ll11l11, ll11ll1ll11ll1l1l11l)
    if ll11ll1ll11ll1l1l11l ~= nil then
        local l1ll11ll11l11ll1ll1l ={beefalohat = 1, trunkvest_winter = 1, heatrock = 1, dragonchilisalad = 1} ll1l11l1l1ll11ll1l1l(ll11l1l1ll1l1ll11l11, l1ll11ll11l11ll1ll1l, ll11ll1ll11ll1l1l11l) l11ll1ll1ll1ll11l1ll(ll11ll1ll11ll1l1l11l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll11ll1ll11ll1l1l11l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["NXLB"])
    end

end
},{chance = 0.1, pickfn = function(l11l1ll1l1ll1l1l11l1, ll1ll11l1l11l11l11ll)
    if ll1ll11l1l11l11l11ll ~= nil then
        local l1l1l11l1ll1l1l11l11 ={spear_wathgrithr = 1, wathgrithrhat = 1, armorwood = 1} if TUNING["DC_yangjiaodong"] ~=(51+413-53-423+287 == 275) then
            l1l1l11l1ll1l1l11l11["voltgoatjelly"] = 1
        end
        ll1l11l1l1ll11ll1l1l(l11l1ll1l1ll1l1l11l1, l1l1l11l1ll1l1l11l11, ll1ll11l1l11l11l11ll) l11ll1ll1ll1ll11l1ll(ll1ll11l1l11l11l11ll, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll1ll11l1l11l11l11ll:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["ZDZLB"])
    end

end
},{chance = 0.02, pickfn = function(ll1l11l11ll11l11ll1l, l1ll1l11ll11ll1l1ll1)
    if l1ll1l11ll11ll1l1ll1 ~= nil then
        local l11ll1l1l11l1ll11l1l ={slurtlehat = 1, armorsnurtleshell = 1, blowdart_sleep = 5, blowdart_pipe = 5} ll1l11l1l1ll11ll1l1l(ll1l11l11ll11l11ll1l, l11ll1l1l11l1ll11l1l, l1ll1l11ll11ll1l1ll1) l11ll1ll1ll1ll11l1ll(l1ll1l11ll11ll1l1ll1, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1ll1l11ll11ll1l1ll1:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["XSB"])
    end

end
},{chance = 0.04, pickfn = function(l1l1l1ll11l1l11ll1l1, l11l11l1l11ll1l1ll1l)
    if l11l11l1l11ll1l1ll1l ~= nil then
        local l11l1l11ll1ll1l1l11l ={pinecone = math["random"](5, 15), acorn = math["random"](5, 15), twiggy_nut = math["random"](5, 15), marblebean = math["random"](5, 15)} ll1l11l1l1ll11ll1l1l(l1l1l1ll11l1l11ll1l1, l11l1l11ll1ll1l1l11l) l11ll1ll1ll1ll11l1ll(l11l11l1l11ll1l1ll1l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l11l11l1l11ll1l1ll1l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["ZSJLB"])
    end

end
},{chance = 0.04, pickfn = function(ll1ll1l11ll1l1ll1ll1, l1l11l11ll1l1l1ll1ll)
    if l1l11l11ll1l1l1ll1ll ~= nil then
        local l11ll1ll11l11l1l1ll1 ={dug_grass = math["random"](3, 10), dug_sapling = math["random"](3, 10), dug_berrybush = math["random"](2, 6), poop = 16} ll1l11l1l1ll11ll1l1l(ll1ll1l11ll1l1ll1ll1, l11ll1ll11l11l1l1ll1) l11ll1ll1ll1ll11l1ll(l1l11l11ll1l1l1ll1ll, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1l11l11ll1l1l1ll1ll:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["YDLB"])
    end

end
},{chance = 0.02, pickfn = function(l11l1ll1l11l11ll1ll1, ll1ll1l1l1l1l11ll1ll)
    if ll1ll1l1l1l1l11ll1ll ~= nil then
        local l1l11ll11l1l1ll1l1l1 ={green_mushroomhat = 1, watermelonhat = 1, kelphat = 1, bushhat = 1} ll1l11l1l1ll11ll1l1l(l11l1ll1l11l11ll1ll1, l1l11ll11l1l1ll1l1l1) l11ll1ll1ll1ll11l1ll(ll1ll1l1l1l1l11ll1ll, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll1ll1l1l1l1l11ll1ll:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["JQLB"])
    end

end
},{chance = 0.04, pickfn = function(l11ll1l11l1l11l11l1l, ll1ll1l11l11ll1ll1ll)
    if ll1ll1l11l11ll1ll1ll ~= nil then
        local l11l1l1l11ll1ll1l11l ={} for l1ll11ll1l1ll1ll1l11 = 1, 3 do
            local ll11l1ll1ll1ll1l11l1 = GetRandomItem(l11ll1l1ll1l1ll1ll11)["item"] l11l1l1l11ll1ll1l11l[ll11l1ll1ll1ll1l11l1] = l11l1l1l11ll1ll1l11l[ll11l1ll1ll1ll1l11l1] and l11l1l1l11ll1ll1l11l[ll11l1ll1ll1ll1l11l1] + 1 or 1
        end
        l11l1l1l11ll1ll1l11l[GetRandomItem(ll1l1l11l1l1l11ll11l)["item"]] = 1 ll1l11l1l1ll11ll1l1l(l11ll1l11l1l11l11l1l, l11l1l1l11ll1ll1l11l) l11ll1ll1ll1ll11l1ll(ll1ll1l11l11ll1ll1ll, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll1ll1l11l11ll1ll1ll:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["YYTC"])
    end

end
},{chance = 0.06, pickfn = function(l1l11l1ll1ll11ll1ll1, l1l1l1l11l1l1l1l1l1l)
    if l1l1l1l11l1l1l1l1l1l ~= nil then
        local l1ll1ll1ll1l11ll11ll ={rocks = math["random"](20, 40), flint = math["random"](20, 40), nitre = math["random"](10, 30), goldnugget = math["random"](10, 20)} ll1l11l1l1ll11ll1l1l(l1l11l1ll1ll11ll1ll1, l1ll1ll1ll1l11ll11ll) l11ll1ll1ll1ll11l1ll(l1l1l1l11l1l1l1l1l1l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1l1l1l11l1l1l1l1l1l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["KSLB"])
    end

end
},{chance = 0.06, pickfn = function(l1l11ll1l11ll1l1l1ll, ll11l11l11l1l1ll1l1l)
    if ll11l11l11l1l1ll1l1l ~= nil then
        local ll1l11l1ll11l1l11ll1 ={cutgrass = math["random"](20, 40), twigs = math["random"](20, 40), log = math["random"](10, 20), cutreeds = math["random"](10, 30)} ll1l11l1l1ll11ll1l1l(l1l11ll1l11ll1l1l1ll, ll1l11l1ll11l1l11ll1) l11ll1ll1ll1ll11l1ll(ll11l11l11l1l1ll1l1l, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll11l11l11l1l1ll1l1l:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["FSLB"])
    end

end
},{chance = 0.03, pickfn = function(l1ll11ll11l1l1l1l11l, l1l11l11l11l1ll1l1l1)
    if l1l11l11l11l1ll1l1l1 ~= nil then
        local l1l1l11ll1l11l11ll1l ={mosquitosack = 10, batbat = 2} ll1l11l1l1ll11ll1l1l(l1ll11ll11l1l1l1l11l, l1l1l11ll1l11l11ll1l, l1l11l11l11l1ll1l1l1) l11ll1ll1ll1ll11l1ll(l1l11l11l11l1ll1l1l1, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. l1l11l11l11l1ll1l1l1:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["XXGLB"])
    end

end
},{chance = 0.03, pickfn = function(l11l1ll1ll11l1ll1l11, ll1ll11ll1l1ll1l1l11)
    if ll1ll11ll1l1ll1l1l11 ~= nil then
        local ll1l11l1l1l1l1ll11l1 ={yellowamulet = 1, molehat = 1, minerhat = 1, lantern = 1} ll1l11l1l1ll11ll1l1l(l11l1ll1ll11l1ll1l11, ll1l11l1l1l1l1ll11l1, ll1ll11ll1l1ll1l1l11) l11ll1ll1ll1ll11l1ll(ll1ll11ll1l1ll1l1l11, STRINGS["TUMBLEWEEDANNOUNCE"]["QIAN"] .. ll1ll11ll1l1ll1l1l11:GetAdjectivedName() .. STRINGS["TUMBLEWEEDANNOUNCE"]["YXLB"])
    end

end
},{chance = 0.02, pickfn = function(l1l1l1ll11ll11ll1l11, l1ll11ll11l11l11ll1l)
    local l11l11l1ll11ll1l1l11 ={{item = "dustmothden", num = 6, radius = 3},{item = "archive_cookpot", num = 1, itemfn = function(l1l1l1ll11ll11ll1l11, ll11l1l1l1l1ll1l11ll)
        for l1ll1l11l1l1l11l1l11 = 1, 4 do
            local ll11l1l11l11l1l1ll11 = SpawnPrefab "refined_dust" if ll11l1l11l11l1l1ll11 then
                if l1l1l1ll11ll11ll1l11["components"]["container"] then
                    l1l1l1ll11ll11ll1l11["components"]["container"]:GiveItem(ll11l1l11l11l1l1ll11)
                else
                    ll11l1l11l11l1l1ll11:Remove()
                end
            end
        end
        if ll11l1l1l1l1ll1l11ll and not (ll11l1l1l1l1ll1l11ll["components"]["builder"] and ll11l1l1l1l1ll1l11ll["components"]["builder"]:KnowsRecipe "refined_dust") then
            local l11l11l11l11ll11ll1l = SpawnPrefab "refined_dust_blueprint" if l11l11l11l11ll11ll1l and ll11l1l1l1l1ll1l11ll["components"]["inventory"] then
                ll11l1l1l1l1ll1l11ll["components"]["inventory"]:GiveItem(l11l11l11l11ll11ll1l)
            end
        end
    end
    }} ll11ll11l1l11ll1ll11(l1ll11ll11l11l11ll1l, l11l11l1ll11ll1l1l11, "CESYY")

end
},{chance = 0.03, pickfn = function(l11l1ll11ll1ll1l1l1l, l1l11ll11l1ll11l11ll)
    local ll1l1ll1l11l1l1ll1ll ={{randomlist = ll1l11ll11ll1ll1ll11, num = 6, radius = 3, itemfn = function(l11l1ll11ll1ll1l1l1l, ll11l1l1l1ll11l1l1ll)
        l11l1ll11ll1ll1l1l1l["force_oversized"] =(string.sub("ll11l1l1l1l1ll1ll11l", 7, 14) == "l1l1l1ll") if l11l1ll11ll1ll1l1l1l["components"]["growable"] then
            for ll1l1l11ll1l11l1ll1l = 1, 4 do
                l11l1ll11ll1ll1l1l1l:DoTaskInTime((ll1l1l11ll1l11l1ll1l - 1) * 1+math["random"]() * 0.5, function()
                    l11l1ll11ll1ll1l1l1l["components"]["growable"]:DoGrowth()
                end
                )
            end
        end
    end
    }} ll11ll11l1l11ll1ll11(l1l11ll11l1ll11l11ll, ll1l1ll1l11l1l1ll1ll, "SGLL")

end
}}, multiple = TUNING["SPECIAL_WELFARE_MULTIPLE"], weightClass = "goodMax"}}

for ll1ll1l1ll1l11l1ll1l = 1, NUM_TRINKETS

do
    local ll1l1ll11ll1ll1ll1l1 ={15, 16, 28, 29, 30, 31}
    local l1ll1l1l1l1ll1ll11ll = table["contains"](ll1l1ll11ll1ll1ll1l1, ll1ll1l1ll1l11l1ll1l) and 0.05 or 0.1
    table["insert"](ll1l1ll1l1l1ll1ll11l["advanced_resources"]["resourcesList"],{chance = l1ll1l1l1l1ll1ll11ll, item = "trinket_" .. ll1ll1l1ll1l11l1ll1l})

end

return ll1l1ll1l1l1ll1ll11l