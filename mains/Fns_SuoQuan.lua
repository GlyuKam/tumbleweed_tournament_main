local ll11l1l1ll11ll1l1l1l = 1

function gz_MarkShrink()
    if TUNING["dc_points_shrink"] == nil then
        return
    end
    local l11l11l1l11ll1l1l11l = TUNING["dc_points_shrink"][ll11l1l1ll11ll1l1l1l]
    if l11l11l1l11ll1l1l11l == nil then
        return
    end
    local ll1l1ll1ll11ll11ll11, l1ll11ll1l1l11ll1ll1, l1ll1l1ll1l1l1l1ll1l = TUNING["gz_multiplayer_point"]:Get()
    for ll1ll1l11ll1ll11l1l1, ll1l1l1l11l1ll1l11l1 in ipairs(l11l11l1l11ll1l1l11l)
    do
        local l1ll11l1ll11ll1l1l11, ll1l1ll11ll1ll1l1l1l, l11ll1ll11ll1l1ll1ll = ll1l1l1l11l1ll1l11l1[1] + ll1l1ll1ll11ll11ll11, 0, ll1l1l1l11l1ll1l11l1[2] + l1ll1l1ll1l1l1l1ll1l
        local l1ll1l1l1ll1l1l1ll1l = TheWorld["Map"]:GetTileAtPoint(l1ll11l1ll11ll1l1l11, ll1l1ll11ll1ll1l1l1l, l11ll1ll11ll1l1ll1ll)
        if l1ll1l1l1ll1l1l1ll1l == WORLD_TILES["CHECKER"] then
            gz_SetTile(l1ll11l1ll11ll1l1l11, ll1l1ll11ll1ll1l1l1l, l11ll1ll11ll1l1ll1ll, "MONKEY_DOCK")
        end
    end
    ll11l1l1ll11ll1l1l1l = ll11l1l1ll11ll1l1l1l + 1

end

GLOBAL["gz_MarkShrink"] = gz_MarkShrink

function gz_MarkEnd()
    if TUNING["dc_points_end"] == nil then
        return
    end
    local x, l1l1l11l1l11ll1ll11l, z = TUNING["gz_multiplayer_point"]:Get()
    for _, tile in ipairs(TUNING["dc_points_end"]) do
        gz_SetTile(tile[1] + x, 0, tile[2] + z, "CARPET")
    end

end

GLOBAL["gz_MarkEnd"] = gz_MarkEnd

function gz_ClearSite()
    local l1ll1l11ll1l1ll1ll1l = 4
    local l11ll1ll11l11ll11ll1 ={}
    for l11l1l11ll1l1ll11l11, l1ll1l1ll11l11ll1ll1 in pairs(TheWorld["gz_team_managers"])
    do
        if l1ll1l1ll11l11ll1ll1["players"] == nil or not next(l1ll1l1ll11l11ll1ll1["players"]) then
            local l1l1ll1ll1l1ll1ll1ll, l1l1ll1l11l11ll1l11l, l1ll11l1ll1ll1ll11l1 = l1ll1l1ll11l11ll1ll1["Transform"]:GetWorldPosition()
            local ll1ll1ll11ll11ll11l1, l11ll11l11ll11l1ll1l, l1l1l1l1ll11l11l1l1l = TheWorld["Map"]:GetTileCenterPoint(l1l1ll1ll1l1ll1ll1ll, l1l1ll1l11l11ll1l11l, l1ll11l1ll1ll1ll11l1)
            for l1l1l1l11ll1ll11l1ll = - 3, 3, 1
            do
                for l11ll1l1l1l1l1ll1ll1 = - 3, 3, 1
                do
                    local l1l11l11l11ll1l11l1l = ll1ll1ll11ll11ll11l1 + l1ll1l11ll1l1ll1ll1l * l1l1l1l11ll1ll11l1ll
                    local l1l1l1ll1ll1ll1l1l1l = l1l1l1l1ll11l11l1l1l + l1ll1l11ll1l1ll1ll1l * l11ll1l1l1l1l1ll1ll1
                    if TheWorld["Pathfinder"]:IsClear(l1l1ll1ll1l1ll1ll1ll, l1l1ll1l11l11ll1l11l, l1ll11l1ll1ll1ll11l1, l1l11l11l11ll1l11l1l, 0, l1l1l1ll1ll1ll1l1l1l,{ignorewalls =(430+434 * 360+37 ~= 156715), ignorecreep =(string.sub("ll11ll11ll1ll1l1l1ll", 9, 14) ~= "l1lll1"), allowocean =(245-405+311-18 ~= 133)}) then
                        table["insert"](l11ll1ll11l11ll11ll1, Point(l1l11l11l11ll1l11l1l, 0, l1l1l1ll1ll1ll1l1l1l))
                    end
                end
            end
            l1ll1l1ll11l11ll1ll1:Remove()
        end
    end
    local l1l11l1ll1l11l11ll1l, l1l1ll1l11l11ll1l1l1, ll11l1l11ll1ll1ll1l1 = TUNING["gz_multiplayer_point"]:Get()
    for ll1ll11l1l1ll11l1ll1 = - 3, 3, 1
    do
        for l11l11l1l1ll1ll11l11 = - 3, 3, 1
        do
            local l11l1l1l11l11l11l11l = l1l11l1ll1l11l11ll1l + l1ll1l11ll1l1ll1ll1l * ll1ll11l1l1ll11l1ll1
            local ll11l1ll1ll11l1ll1l1 = ll11l1l11ll1ll1ll1l1 + l1ll1l11ll1l1ll1ll1l * l11l11l1l1ll1ll11l11
            if TheWorld["Pathfinder"]:IsClear(l1l11l1ll1l11l11ll1l, l1l1ll1l11l11ll1l1l1, ll11l1l11ll1ll1ll1l1, l11l1l1l11l11l11l11l, 0, ll11l1ll1ll11l1ll1l1,{ignorewalls =(331+374-500-5 == 200), ignorecreep =(231-147 * 365 * 270 ~= - 14486616), allowocean =(87 * 352-14+132 == 30751)}) then
                table["insert"](l11ll1ll11l11ll11ll1, Point(l11l1l1l11l11l11l11l, 0, ll11l1ll1ll11l1ll1l1))
                local l1ll1l11l1l11l1l1l1l = TheSim:FindEntities(l11l1l1l11l11l11l11l, 0, ll11l1ll1ll11l1ll1l1, 2.83, nil,{"NOCLICK", "player", "CLASSIFIED", "epic"})
                for l11ll11l11ll1l11l1ll, ll11l1ll1l1l1ll11l11 in pairs(l1ll1l11l1l11l1l1l1l)
                do
                    if ll11l1ll1l1l1ll11l11:IsValid() then
                        ll11l1ll1l1l1ll11l11:Remove()
                    end
                end
            end
        end
    end
    for l11ll1ll1l11l1l11ll1, l1ll11l1ll1l1l1ll1l1 in ipairs(l11ll1ll11l11ll11ll1)
    do
        local l1ll11ll1ll1l1l1l1l1, l11ll11ll11l11ll1ll1, ll11l1ll1l11l11ll1ll = l1ll11l1ll1l1l1ll1l1:Get()
        gz_SetTile(l1ll11ll1ll1l1l1l1l1, 0, ll11l1ll1l11l11ll1ll, "OCEAN_COASTAL")
    end
    l11ll1ll11l11ll11ll1 = nil

end

GLOBAL["gz_ClearSite"] = gz_ClearSite

local l1l1l1l1l1l1l1ll1l11 ={}

function gz_SetTile(l1ll1l11l11ll11ll1ll, ll1l1ll1l1l1l1ll1l1l, l11ll1l1ll1ll1ll1ll1, l1l1l1ll1ll1ll1l11l1)
    if not (TUNING["GZ_ON_GOING"] or TUNING["GZ_DEBUG"]) then
        return
    end
    local ll11l1ll1ll11l11l1ll, ll11l1l1ll11ll1l1ll1, l11l1l1l1ll1ll11l1ll = TheWorld["Map"]:GetTileCenterPoint(l1ll1l11l11ll11ll1ll, ll1l1ll1l1l1l1ll1l1l, l11ll1l1ll1ll1ll1ll1)
    local ll11l1l11l1ll11l1l1l, l1ll1l11ll1l11l1l1ll = TheWorld["Map"]:GetTileCoordsAtPoint(l1ll1l11l11ll11ll1ll, ll1l1ll1l1l1l1ll1l1l, l11ll1l1ll1ll1ll1ll1)
    local ll11l1ll11l1l11l1l11 = TheWorld["Map"]:GetTileAtPoint(l1ll1l11l11ll11ll1ll, ll1l1ll1l1l1l1ll1l1l, l11ll1l1ll1ll1ll1ll1)
    local ll11ll11l1l1l11l1ll1 = WORLD_TILES[l1l1l1ll1ll1ll1l11l1]
    if ll11l1ll11l1l11l1l11 ~= ll11ll11l1l1l11l1ll1 then
        TheWorld["Map"]:SetTile(ll11l1l11l1ll11l1l1l, l1ll1l11ll1l11l1l1ll, ll11ll11l1l1l11l1ll1)
        if ll11ll11l1l1l11l1ll1 == WORLD_TILES["MONKEY_DOCK"] then
            if TheWorld["components"]["dockmanager"] ~= nil then
                TheWorld["components"]["dockmanager"]:_GenerateDockDataForTile(ll11l1l11l1ll11l1l1l, l1ll1l11ll1l11l1l1ll)
                table["insert"](l1l1l1l1l1l1l1ll1l11,{cx = ll11l1ll1ll11l11l1ll, cy = ll11l1l1ll11ll1l1ll1, cz = l11l1l1l1ll1ll11l1ll})
            end
        elseif ll11l1ll11l1l11l1l11 == WORLD_TILES["MONKEY_DOCK"] then
            for l11ll11l1l1l11l1ll1l = # l1l1l1l1l1l1l1ll1l11, 1, - 1
            do
                local l11l1l11l1l1l11l11ll = l1l1l1l1l1l1l1ll1l11[l11ll11l1l1l11l1ll1l]
                if l11l1l11l1l1l11l11ll["cx"] == ll11l1ll1ll11l11l1ll and l11l1l11l1l1l11l11ll["cy"] == ll11l1l1ll11ll1l1ll1 and l11l1l11l1l1l11l11ll["cz"] == l11l1l1l1ll1ll11l1ll then
                    table["remove"](l1l1l1l1l1l1l1ll1l11, l11ll11l1l1l11l1ll1l)
                end
            end
        end
    end

end

GLOBAL["gz_SetTile"] = gz_SetTile

local ll11l1l1l1l1ll1l1l11 ={lava_pond =(string.sub("l11ll1ll11ll1l11ll11", 7, 12) == "ll11ll"), sword_lunarplant_blade_fx =(223 * 189 * 0 * 234+109 == 109)}

function gz_AddWhiteClean(ll1l1l1ll11ll1l1l1l1)
    ll11l1l1l1l1ll1l1l11[ll1l1l1ll11ll1l1l1l1] =(string.sub("l11ll1ll1ll1l1l11ll1", 9, 14) ~= "1lll1l")

end

GLOBAL["gz_AddWhiteClean"] = gz_AddWhiteClean

local ll1l1l1l11ll1ll11ll1 ={"NOCLICK", "player", "CLASSIFIED", "projectile"}

function DC_Clean()
    local ll1l1l11ll11l1l1l1ll ={}
    for l1l1l11ll11l11ll11ll, l1l11l1l1l11l1l1ll11 in pairs(Ents)
    do
        repeat
            if not l1l11l1l1l11l1l1ll11["prefab"] then
                break
            end
            if ll11l1l1l1l1ll1l1l11[l1l11l1l1l11l1l1ll11["prefab"]] then
                break
            end
            if not l1l11l1l1l11l1l1ll11["Transform"] then
                break
            end
            if not l1l11l1l1l11l1l1ll11:IsValid() then
                break
            end
            if l1l11l1l1l11l1l1ll11["inlimbo"] then
                break
            end
            if l1l11l1l1l11l1l1ll11["AttachToOwner"] then
                break
            end
            if l1l11l1l1l11l1l1ll11["parent"] then
                break
            end
            if l1l11l1l1l11l1l1ll11["components"]["combat"] then
                break
            end
            if l1l11l1l1l11l1l1ll11["components"]["health"] then
                break
            end
            if l1l11l1l1l11l1l1ll11:HasOneOfTags(ll1l1l1l11ll1ll11ll1) then
                break
            end
            local l1ll1ll1l11l11ll1ll1, l1ll11ll1ll1ll1l11l1, ll1l1l1ll1l1ll1ll1ll = l1l11l1l1l11l1l1ll11["Transform"]:GetWorldPosition()
            if TheWorld["Map"]:IsOceanAtPoint(l1ll1ll1l11l11ll1ll1, l1ll11ll1ll1ll1l11l1, ll1l1l1ll1l1ll1ll1ll,(255+92-398 ~= - 47)) then
                table["insert"](ll1l1l11ll11l1l1l1ll, l1l11l1l1l11l1l1ll11)
            end
        until
        (205-23-167+382 * 182 == 69539)
    end
    for l11ll11l1l1l11ll1l11, ll11l1l11ll11l1l1l1l in ipairs(ll1l1l11ll11l1l1l1ll)
    do
        if ll11l1l11ll11l1l1l1l and ll11l1l11ll11l1l1l1l:IsValid() then
            ll11l1l11ll11l1l1l1l:Remove()
        end
    end
    ll1l1l11ll11l1l1l1ll = nil

end

GLOBAL["DC_Clean"] = DC_Clean

local radius = 8

local NoDocks = function(pos)
    local x, y, z = pos:Get()
    local new_tile = TheWorld["Map"]:GetTileAtPoint(x, y, z)
    return new_tile ~= WORLD_TILES["MONKEY_DOCK"]

end

local function MoveTileManager()
    for _, team_manager in pairs(TheWorld["gz_team_managers"]) do
        if team_manager["survive_m"] then
            local _x, _y, _z = team_manager["Transform"]:GetWorldPosition()
            local _point = Point(_x, _y, _z)
            for i = 0, 16, 2 do
                local angle = math["random"]() * 2 * PI
                local iterasiya = i
                local offset = FindWalkableOffset(_point, angle, iterasiya, radius, false, true, NoDocks, false, false)
                if offset then
                    local x, y, z = TheWorld["Map"]:GetTileCenterPoint(_x + offset["x"], _y + offset["y"], _z + offset["z"])
                    team_manager["Transform"]:SetPosition(x, y, z)
                    break
                end
            end
        end
    end

end

local function ll1l11l1ll1ll1l1l11l()
    local ll1ll1ll1ll1ll1l1ll1 = math["max"](8, TUNING["GZ_AUTO_SPAWN_PERIOD"] - TUNING["GZ_AUTO_SPAWN_CUT"])
    gz_SetSpawnPeriod(ll1ll1ll1ll1ll1l1ll1)
    TUNING["GZ_COUNT_SUOQUAN"] = TUNING["GZ_COUNT_SUOQUAN"] + 1
    if TUNING["GZ_COUNT_SUOQUAN"] >= TUNING["gz_SpecialModeStartTime"] then
        gz_GameModeRule()
        gz_SpecialModeNotSpawnGrass()
    end
    TheWorld:PushEvent("event_suoquan", TUNING["GZ_COUNT_SUOQUAN"])

end

local function watchworldstatement(world)
    if TUNING["GZ_GAME_OVER"] then
        return
    end
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    if not TheWorld["gz_start_time"] then
        return
    end
    if (TheWorld["state"]["cycles"] + TheWorld["state"]["time"]) - TheWorld["gz_start_time"] < 1 then
        return
    end
    local l1l11l1l11l1l1l1l1l1 = math["max"](8, TUNING["GZ_AUTO_SPAWN_PERIOD"] - TUNING["GZ_AUTO_SPAWN_CUT"])
    if # l1l1l1l1l1l1l1ll1l11 == 0 then
        ll1l11l1ll1ll1l1l11l()
        return
    end
    world:StartThread(function()
        TheNet:Announce(STRINGS["DC_FGC"]["JIJIANGSUOQUAN"]) -- Доки ломает
        Sleep(0.3) TheNet:Announce "5" 
        Sleep(1) TheNet:Announce "4" 
        Sleep(1) TheNet:Announce "3" 
        Sleep(1) TheNet:Announce "2" 
        Sleep(1) TheNet:Announce "1" 
        Sleep(1) 
        TheNet:Announce(STRINGS["DC_FGC"]["SUOQUAN"]) 
        local dock_manager = world["components"]["dockmanager"] 
        for l11l1l11l11l1l11ll1l, l11ll1ll11ll1l1l1ll1 in ipairs(l1l1l1l1l1l1l1ll1l11) do
            local ll11ll1ll1l1l11l1l11, ll11l1l1l1ll1l1l11ll, ll1l11l1l1ll11l1l11l = l11ll1ll11ll1l1l1ll1["cx"], l11ll1ll11ll1l1l1ll1["cy"], l11ll1ll11ll1l1l1ll1["cz"]
            local ll1l1l1l1l11l1l11ll1, ll1ll1l1ll11l1l11l11 = TheWorld["Map"]:GetTileCoordsAtPoint(ll11ll1ll1l1l11l1l11, ll11l1l1l1ll1l1l11ll, ll1l11l1l1ll11l1l11l) 
            dock_manager:DamageDockAtTile(ll1l1l1l1l11l1l11ll1, ll1ll1l1ll11l1l11l11, TUNING["MONKEYISLANDDOCK_HEALTH"])
        end
        l1l1l1l1l1l1l1ll1l11 = nil 
        l1l1l1l1l1l1l1ll1l11 ={} 
        Sleep(5) 
        ll1l11l1ll1ll1l1l11l() 
        gz_MarkShrink() 
        MoveTileManager()
    end
    )
    world:DoTaskInTime(10, DC_Clean)

end

AddPrefabPostInit("world", function(world)
    world["gz_team_managers"] ={} 
    world["gz_afk_task"] ={} 
    world["gz_afk_id"] ={} 
    world:WatchWorldState("startday", watchworldstatement)

end
)