local upvaluehacker = require "util/fgc_upvaluehelper"

local gamemodes = require "List/list_game_modes"

local special_gamemodes = gamemodes["special_modes"]

local _gamemodes = gamemodes["game_modes"]

local function GiveLoot(player, loot)
    if loot ~= nil then
        local podarok = SpawnPrefab "gift"
        local container_loot ={}
        for _, item in ipairs(loot)
        do
            if item["stack"] then
                table["insert"](container_loot,{prefab = item["prefab"], data ={stackable ={stack = item["stack"]}}})
            elseif item["num"] then
                for _ = 1, item["num"], 1
                do
                    table["insert"](container_loot,{prefab = item["prefab"]})
                end
            end
        end
        podarok["components"]["unwrappable"]["itemdata"] = container_loot
        player["components"]["inventory"]:GiveItem(podarok)
    end

end

local boats ={"boat_rectangle_item", "boat_raft_item", "boat_caravel_item", "boat_pirate_item", "boat_moon_item", "boat_grass_item", "boat_item", "boat_ancient_item", "dragonboat_kit"}

local _boats

local oars ={"oar_driftwood", "malbatross_beak"}

local bumpers ={"boat_bumper_kelp_kit", "boat_bumper_shell_kit", "boat_bumper_yotd_kit"}

local gems ={"redgem", "orangegem", "yellowgem", "greengem", "bluegem", "purplegem"}

local function ll1ll11l1ll1ll11l11l()
    if _boats == nil then
        _boats ={}
        for _, boat in ipairs(boats)
        do
            if GLOBAL["Prefabs"][boat] ~= nil then
                table["insert"](_boats, boat)
            end
        end
    end
    if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] and TUNING["gz_multiplayer_point"] then
        local crab = SpawnPrefab "crabking"
        crab["Transform"]:SetPosition(TUNING["gz_multiplayer_point"]:Get())
        local trader = crab["components"]["trader"] and crab["components"]["trader"]["onaccept"]
        if trader then
            for i = 1, 9, 1
            do
                if # crab["socketed"] >= 9 then
                    break
                end
                local gem = gems[math["random"](# gems)]
                if math["random"]() < 0.05 then
                    gem = "opalpreciousgem"
                end
                if # crab["socketed"] == 8 and math["random"]() < 0.01 then
                    gem = "hermit_pearl"
                end
                trader(crab, nil, SpawnPrefab(gem))
            end
        end
        local entitysleep = upvaluehacker["GetEventHandle"](crab, "entitysleep", "prefabs/crabking")
        if entitysleep then
            crab:RemoveEventCallback("entitysleep", entitysleep)
        end
        crab:ListenForEvent("death", function(inst, killer)
            local p_killer = killer and killer["afflicter"] 
            if not p_killer then
                return
            end
            local player 
            if p_killer:HasTag "player" then
                player = p_killer
            elseif p_killer["components"]["follower"] then
                local follower = p_killer["components"]["follower"]["leader"] 
                if follower and follower:HasTag "player" then
                    player = follower
                end
            end
            local team_manager = player and player["team_manager"] 
            if not (team_manager and team_manager:IsValid()) then
                return
            end
            for _, _player in pairs(team_manager["players"]) do
                if _player and _player:IsValid() and not _player:HasTag "playerghost" and _player["components"]["gz_player"]["survive_p"] then
                    GiveLoot(_player,{{prefab = "ruins_bat", num = 1},{prefab = "ruinshat", num = 1},{prefab = "armorruins", num = 1}})
                end
            end
        end
        )
    end
    for _, _player in ipairs(AllPlayers) do
        if not _player:HasTag "playerghost" and not _player["components"]["gz_player"]:IsWatch() and _player["components"]["gz_player"]["survive_p"] then
            if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] then
                GiveLoot(_player,{{prefab = _boats[math["random"](# _boats)], num = 1},{prefab = "boatpatch", stack = 3},{prefab = oars[math["random"](# oars)], num = 1},{prefab = "steeringwheel_item", num = 1},{prefab = bumpers[math["random"](# bumpers)], stack = 3}})
                GiveLoot(_player,{{prefab = "boat_cannon_kit", num = 2},{prefab = "cannonball_rock_item", stack = 10},{prefab = "waterballoon", stack = 1}})
            else
                GiveLoot(_player,{{prefab = "boat_cannon_kit", num = 1},{prefab = "cannonball_rock_item", stack = 3}})
                local boatshit ={{prefab = "boatpatch", stack = 2},{prefab = bumpers[math["random"](# bumpers)], stack = 2}}
                if math["random"]() < 0.3 then
                    table["insert"](boatshit,{prefab = _boats[math["random"](# _boats)], num = 1})
                end
                if math["random"]() < 0.3 then
                    table["insert"](boatshit,{prefab = oars[math["random"](# oars)], num = 1})
                end
                if math["random"]() < 0.3 then
                    table["insert"](boatshit,{prefab = "steeringwheel_item", num = 1})
                end
                GiveLoot(_player, boatshit)
            end
        end
    end

end

local function l1l1l11l1ll1ll1l1ll1()
    for ll11ll11l1l1l11l1ll1, l11ll11l1l1l11l1ll1l in ipairs(AllPlayers)
    do
        if not l11ll11l1l1l11l1ll1l:HasTag "playerghost" and not l11ll11l1l1l11l1ll1l["components"]["gz_player"]:IsWatch() and l11ll11l1l1l11l1ll1l["components"]["gz_player"]["survive_p"] then
            if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] then
                GiveLoot(l11ll11l1l1l11l1ll1l,{{prefab = "boat_cannon_kit", num = 2},{prefab = "cannonball_rock_item", stack = 10},{prefab = "dock_kit", stack = 10},{prefab = "wall_ruins_item", stack = 5}})
            else
                GiveLoot(l11ll11l1l1l11l1ll1l,{{prefab = "boat_cannon_kit", num = 1},{prefab = "cannonball_rock_item", stack = 3},{prefab = "dock_kit", stack = 5},{prefab = "wall_ruins_item", stack = 5}})
            end
        end
    end

end

local l11ll1ll1l1l11l11l1l = require "List/list_points_land"

local function l1ll1l11ll1l1ll1ll1l(l11l1l11l1l1l11l11ll, ll1l1l1ll11ll1l1l1l1)
    local ll1l1l11ll11l1l1l1ll = SpawnPrefab "miasma_cloud"
    ll1l1l11ll11l1l1l1ll["Transform"]:SetPosition(l11l1l11l1l1l11l11ll, 0, ll1l1l1ll11ll1l1l1l1)
    return ll1l1l11ll11l1l1l1ll

end

local function l11ll1ll11l11ll11ll1(l1l1l11ll11l11ll11ll)
    local l1l11l1l1l11l1l1ll11 = l11ll1ll1l1l11l11l1l[l1l1l11ll11l11ll11ll]
    if not l1l11l1l1l11l1l1ll11 then
        return
    end
    local l1ll1ll1l11l11ll1ll1, l1ll11ll1ll1ll1l11l1, ll1l1l1ll1l1ll1ll1ll = TUNING["gz_multiplayer_point"]:Get()
    for l11ll11l1l1l11ll1l11, ll11l1l11ll11l1l1l1l in ipairs(l1l11l1l1l11l1l1ll11)
    do
        local ll11l11ll11l11ll1l11 = l1ll1ll1l11l11ll1ll1 + ll11l1l11ll11l1l1l1l[1]
        local l11l1l11ll1l1l1l11ll = ll1l1l1ll1l1ll1ll1ll + ll11l1l11ll11l1l1l1l[2]
        local l1ll1l1ll1l1ll1l11l1 = TheWorld["Map"]:GetTileAtPoint(ll11l11ll11l11ll1l11, 0, l11l1l11ll1l1l1l11ll)
        if l1ll1l1ll1l1ll1l11l1 ~= WORLD_TILES["OCEAN_COASTAL"] then
            l1ll1l11ll1l1ll1ll1l(ll11l11ll11l11ll1l11, l11l1l11ll1l1l1l11ll)
        end
    end
    TheWorld:PushEvent("event_TouDu", l1l1l11ll11l11ll11ll)
    TUNING["MIASMA_DEBUFF_TICK_VALUE"] = - l1l1l11ll11l11ll11ll

end

local function l1l11l1ll1l11l11ll1l()
    if TUNING["gz_multiplayer_point"] then
        if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] then
            local l1ll11l1l11l1l11l11l, l1ll11l11l1l11ll1ll1, ll1l1l11l11l1l11ll11 = TUNING["gz_multiplayer_point"]:Get()
            local l11l11l1l11l11l11l11 = SpawnPrefab "dc_slot_machine"
            if l11l11l1l11l11l11l11 then
                l11l11l1l11l11l11l11["Transform"]:SetPosition(l1ll11l1l11l1l11l11l, l1ll11l11l1l11ll1ll1, ll1l1l11l11l1l11ll11)
            end
            local ll11ll11ll1l1l1l11l1 = 4
            for l1l1l1l11ll1l11l11ll = - 2, 2, 1
            do
                for ll11l1l1ll11l11l11ll = - 2, 2, 1
                do
                    local ll11l11l1l1ll1ll1l11 = l1ll11l1l11l1l11l11l + ll11ll11ll1l1l1l11l1 * l1l1l1l11ll1l11l11ll
                    local ll1l1l11l11l1l1l1ll1 = ll1l1l11l11l1l11ll11 + ll11ll11ll1l1l1l11l1 * ll11l1l1ll11l11l11ll
                    gz_SetTile(ll11l11l1l1ll1ll1l11, 0, ll1l1l11l11l1l1l1ll1, "CHECKER")
                end
            end
            for l1l1ll1l11ll11ll1l11, l1ll11l11ll1l1l11l11 in pairs(TheWorld["gz_team_managers"])
            do
                if l1ll11l11ll1l1l11l11["survive_m"] and l1ll11l11ll1l1l11l11:IsValid() then
                    for ll1l11ll1l11ll11ll1l, l1ll1l1ll1l1l1ll1ll1 in ipairs(l11ll1ll1l1l11l11l1l)
                    do
                        if ll1l11ll1l11ll11ll1l > 2 then
                            local l11ll1l1ll1l1l11l1l1 = l1ll1l1ll1l1l1ll1ll1[l1l1ll1l11ll11ll1l11]
                            local l1l1ll11l1ll11l1l11l = l1ll11l1l11l1l11l11l + l11ll1l1ll1l1l11l1l1[1]
                            local ll1ll1ll1ll1ll1l1ll1 = ll1l1l11l11l1l11ll11 + l11ll1l1ll1l1l11l1l1[2]
                            gz_SetTile(l1l1ll11l1ll11l1l11l, 0, ll1ll1ll1ll1ll1l1ll1, "CHECKER")
                        end
                    end
                end
            end
            TheWorld:DoTaskInTime(60 * 1, function()
                l11ll1ll11l11ll11ll1(1)
            end
            )
            TheWorld:DoTaskInTime(60 * 3, function()
                l11ll1ll11l11ll11ll1(2)
            end
            )
            TheWorld:DoTaskInTime(60 * 5, function()
                l11ll1ll11l11ll11ll1(3)
            end
            )
            TheWorld:DoTaskInTime(60 * 7, function()
                l11ll1ll11l11ll11ll1(4)
            end
            )
            TheWorld:DoTaskInTime(60 * 9, function()
                l11ll1ll11l11ll11ll1(5)
            end
            )
            TheWorld:DoTaskInTime(60 * 11, function()
                l11ll1ll11l11ll11ll1(6)
            end
            )
        elseif TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] + 1 then
            local prefab = SpawnPrefab(math["random"]() < 0.8 and "toadstool" or "toadstool_dark")
            prefab["Transform"]:SetPosition(TUNING["gz_multiplayer_point"]:Get())
            if prefab["sg"] and prefab["sg"]["sg"] and prefab["sg"]["sg"]["states"] then
                prefab["sg"]["sg"]["states"]["burrow"] = prefab["sg"]["sg"]["states"]["idle"]
            end
            prefab:ListenForEvent("death", function(inst, _killer)
                local killer = _killer and _killer["afflicter"] if not killer then
                    return
                end
                local player 
                if killer:HasTag "player" then
                    player = killer
                elseif killer["components"]["follower"] then
                    local killer_f = killer["components"]["follower"]["leader"] 
                    if killer_f and killer_f:HasTag "player" then
                        player = killer_f
                    end
                end
                local team_manager = player and player["team_manager"] 
                if not (team_manager and team_manager:IsValid()) then
                    return
                end
                for _, teammate in pairs(team_manager["players"]) do
                    if teammate and teammate:IsValid() and not teammate:HasTag "playerghost" and teammate["components"]["gz_player"]["survive_p"] then
                        GiveLoot(teammate,{{prefab = "ruins_bat", num = 1},{prefab = "ruinshat", num = 1},{prefab = "armorruins", num = 1}})
                    end
                end
            end
            )
        end
    end
    for _, player in ipairs(AllPlayers)
    do
        if not player:HasTag "playerghost" and not player["components"]["gz_player"]:IsWatch() and player["components"]["gz_player"]["survive_p"] then
            if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] then
                GiveLoot(player,{{prefab = "boat_cannon_kit", num = 2},{prefab = "cannonball_rock_item", stack = 5},{prefab = "wall_ruins_item", stack = 5},{prefab = "quagmire_coin1", stack = 5},{prefab = "quagmire_coin2", stack = 5}})
            else
                GiveLoot(player,{{prefab = "boat_cannon_kit", num = 1},{prefab = "cannonball_rock_item", stack = 3},{prefab = "wall_ruins_item", stack = 5}})
            end
        end
    end

end

local l1l1ll1l11l11ll1l1l1 ={}

local ll11l1l11ll1ll1ll1l1 ={}

local function l11l1l11ll1l1ll11l11(l11l11l1l11ll11ll1ll)
    if l11l11l1l11ll11ll1ll:HasTag "playerghost" then
        return
    end
    local ll11l11ll11l1ll11l11 = l11l11l1l11ll11ll1ll["components"]["health"]
    if not ll11l11ll11l1ll11l11 then
        return
    end
    if ll11l11ll11l1ll11l11:IsDead() then
        return
    end
    l11l11l1l11ll11ll1ll:AddTag "notarget"
    ll11l11ll11l1ll11l11:SetInvincible((18 * 57 * 167 * 121 == 20732382))
    table["insert"](l1l1ll1l11l11ll1l1l1, l11l11l1l11ll11ll1ll)

end

local function l1ll1l1ll11l11ll1ll1()
    local l1ll11ll11ll11l11ll1 ={}
    for l1ll1l11ll1l11l1l11l, l11ll1ll1ll1ll11ll11 in pairs(TheWorld["gz_team_managers"])
    do
        if l11ll1ll1ll1ll11ll11["survive_m"] and l11ll1ll1ll1ll11ll11:IsValid() then
            table["insert"](l1ll11ll11ll11l11ll1, l11ll1ll1ll1ll11ll11)
        end
    end
    return l1ll11ll11ll11l11ll1

end

local function l1l1ll1ll1l1ll1ll1ll(l11ll1l1l1ll11ll1l11)
    local l1ll1l11l1l11ll1l1ll, l1l11ll1l1l1ll1ll1ll, ll11l11l1l1l1l11l1ll = TUNING["gz_multiplayer_point"]:Get()
    local l1l11l11l11ll11ll1ll = TUNING["dc_points_arena"][l11ll1l1l1ll11ll1l11]
    local ll11l1l1l11l11l11l11 = l1ll1l11l1l11ll1l1ll + l1l11l11l11ll11ll1ll[1] + math["random"](- 600, 600) / 100
    local l1l1l11l1l1ll11l1ll1 = 0
    local ll1l1l11ll11l11l1ll1 = ll11l11l1l1l1l11l1ll + l1l11l11l11ll11ll1ll[2] + math["random"](- 600, 600) / 100
    return ll11l1l1l11l11l11l11, l1l1l11l1l1ll11l1ll1, ll1l1l11ll11l11l1ll1

end

local function l1l1ll1l11l11ll1l11l(l11l1l1l1l1l1l1l11l1, ll1l11l11l1ll1ll1l11)
    for ll1l1l1l11l1l1l1l11l, l11l11ll11l11l1ll1ll in pairs(l11l1l1l1l1l1l1l11l1["players"])
    do
        if l11l11ll11l11l1ll1ll and l11l11ll11l11l1ll1ll:IsValid() and l11l11ll11l11l1ll1ll["components"]["gz_player"]["survive_p"] then
            if l11l11ll11l11l1ll1ll["components"]["playercontroller"] then
                l11l11ll11l11l1ll1ll["components"]["playercontroller"]:Enable((109 * 189 * 70-42 ~= 1442028))
                if l11l11ll11l11l1ll1ll["task_group"] then
                    l11l11ll11l11l1ll1ll["task_group"]:Cancel()
                    l11l11ll11l11l1ll1ll["task_group"] = nil
                end
                l11l11ll11l11l1ll1ll["task_group"] = l11l11ll11l11l1ll1ll:DoTaskInTime(1, function()
                    l11l11ll11l11l1ll1ll["components"]["playercontroller"]:Enable((string.sub("ll11l11l1ll1l11ll1l1", 7, 13) ~= "lll1l1l"))
                end
                )
            end
            l11l11ll11l11l1ll1ll["Transform"]:SetPosition(l1l1ll1ll1l1ll1ll1ll(ll1l11l11l1ll1ll1l11))
            l11l1l11ll1l1ll11l11(l11l11ll11l11l1ll1ll)
            if l11l11ll11l11l1ll1ll["components"]["leader"] ~= nil then
                for ll1l11ll11l11ll1l11l, ll1l1l11l1l1l11l11ll in pairs(l11l11ll11l11l1ll1ll["components"]["leader"]["followers"])
                do
                    if not (ll1l11ll11l11ll1l11l["components"]["follower"] ~= nil and ll1l11ll11l11ll1l11l["components"]["follower"]["noleashing"]) then
                        if ll1l11ll11l11ll1l11l["Physics"] ~= nil then
                            ll1l11ll11l11ll1l11l["Physics"]:Teleport(l1l1ll1ll1l1ll1ll1ll(ll1l11l11l1ll1ll1l11))
                        else
                            ll1l11ll11l11ll1l11l["Transform"]:SetPosition(l1l1ll1ll1l1ll1ll1ll(ll1l11l11l1ll1ll1l11))
                        end
                        l11l1l11ll1l1ll11l11(ll1l11ll11l11ll1l11l)
                    end
                end
            end
        end
    end
    local ll1ll11l11ll1ll1l11l, ll1l11l11l11l1l1l11l, l11l11l1ll1ll1ll1ll1 = l11l1l1l1l1l1l1l11l1["Transform"]:GetWorldPosition()
    local l1l1l1l11ll1l11ll1l1, ll1ll11ll1l1l1l1l1ll, l11l11ll11l11ll1ll1l = TheWorld["Map"]:GetTileCenterPoint(ll1ll11l11ll1ll1l11l, ll1l11l11l11l1l1l11l, l11l11l1ll1ll1ll1ll1)
    local ll1ll1ll1ll1l11ll1ll = 4
    for l1l11l1ll1l1ll1l1l1l = - 2, 2, 1
    do
        for l11l11ll1l1ll1ll11l1 = - 2, 2, 1
        do
            local ll11ll11l1l11l11l1l1 = l1l1l1l11ll1l11ll1l1 + ll1ll1ll1ll1l11ll1ll * l1l11l1ll1l1ll1l1l1l
            local l1l1l1ll1ll1ll11ll11 = l11l11ll11l11ll1ll1l + ll1ll1ll1ll1l11ll1ll * l11l11ll1l1ll1ll11l1
            if TheWorld["Pathfinder"]:IsClear(ll1ll11l11ll1ll1l11l, ll1l11l11l11l1l1l11l, l11l11l1ll1ll1ll1ll1, ll11ll11l1l11l11l1l1, 0, l1l1l1ll1ll1ll11ll11,{ignorewalls =(304 * 285+27 == 86667), ignorecreep =(483 * 454+451 * 244 == 329326), allowocean =(string.sub("l11ll1l1ll1ll1l11l1l", 6, 13) ~= "1l1ll1ll")}) then
                l1ll1l11ll1l1ll1ll1l(ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11)
            end
        end
    end

end

local function l1ll11l1ll1ll1ll11l1(ll1ll1ll11ll1l1l11l1)
    for l1l11ll11l11ll11l11l, ll11l11ll1l1l1l1ll1l in ipairs(ll1ll1ll11ll1l1l11l1)
    do
        local l1l11l11ll1ll11ll1l1 = ll11l11ll1l1l1l1ll1l[1]
        local l1ll1l1ll11l1l11l11l = ll11l11ll1l1l1l1ll1l[2]
        l1l11l11ll1ll11ll1l1["arena_rival"] = l1ll1l1ll11l1l11l11l
        l1ll1l1ll11l1l11l11l["arena_rival"] = l1l11l11ll1ll11ll1l1
        l1l11l11ll1ll11ll1l1["arena_num"] = l1l11ll11l11ll11l11l
        l1ll1l1ll11l1l11l11l["arena_num"] = l1l11ll11l11ll11l11l
        l1l1ll1l11l11ll1l11l(l1l11l11ll1ll11ll1l1, l1l11ll11l11ll11l11l)
        l1l1ll1l11l11ll1l11l(l1ll1l1ll11l1l11l11l, l1l11ll11l11ll11l11l)
    end

end

local function ll1ll1ll11ll11ll11l1(l11ll1ll1l11l1ll1l11)
    local ll1ll1l1l11l1ll1l11l = 0
    local l1ll1ll1l1ll11ll11ll = 0
    for ll11l1l1ll11l1l1l1ll, l11l11l1ll1l1ll11ll1 in pairs(l11ll1ll1l11l1ll1l11["players"])
    do
        if l11l11l1ll1l1ll11ll1 and l11l11l1ll1l1ll11ll1:IsValid() and l11l11l1ll1l1ll11ll1["components"]["gz_player"]["survive_p"] and not l11l11l1ll1l1ll11ll1:HasTag "playerghost" then
            ll1ll1l1l11l1ll1l11l = ll1ll1l1l11l1ll1l11l + 1
            if l11l11l1ll1l1ll11ll1["components"]["health"] then
                l1ll1ll1l1ll11ll11ll = l1ll1ll1l1ll11ll11ll + l11l11l1ll1l1ll11ll1["components"]["health"]["currenthealth"]
            end
        end
    end
    return ll1ll1l1l11l1ll1l11l, l1ll1ll1l1ll11ll11ll

end

local function l11ll11l11ll11l1ll1l(l11l1ll11ll11l1l11ll, l1ll1l1ll1l1ll1ll11l)
    local l11ll1ll1l11l1ll1l1l, ll1ll11ll11ll1ll1l11, l11l1l1l11ll1l11ll11 = TUNING["gz_multiplayer_point"]:Get()
    local l1ll1ll1ll11l1l11l11, l11ll11l1ll1ll1ll1ll, ll11l11l11ll1l11ll1l = l11l1ll11ll11l1l11ll["Transform"]:GetWorldPosition()
    local ll11l11ll1l1l1ll1l1l = TUNING["dc_points_arena"][l1ll1l1ll1l1ll1ll11l]
    local l1ll1l1l11l11l11l1l1 = SpawnPrefab "wormhole"
    l1ll1l1l11l11l11l1l1["Transform"]:SetPosition(l1ll1ll1ll11l1l11l11, 0, ll11l11l11ll1l11ll1l)
    table["insert"](ll11l1l11ll1ll1ll1l1, l1ll1l1l11l11l11l1l1)
    local ll11ll1ll1l1l11l1ll1 = SpawnPrefab "wormhole"
    ll11ll1ll1l1l11l1ll1["Transform"]:SetPosition(l11ll1ll1l11l1ll1l1l + ll11l11ll1l1l1ll1l1l[1] + 4, 0, l11l1l1l11ll1l11ll11 + ll11l11ll1l1l1ll1l1l[2])
    table["insert"](ll11l1l11ll1ll1ll1l1, ll11ll1ll1l1l11l1ll1)
    l1ll1l1l11l11l11l1l1["components"]["teleporter"]:Target(ll11ll1ll1l1l11l1ll1)
    ll11ll1ll1l1l11l1ll1["components"]["teleporter"]:Target(l1ll1l1l11l11l11l1l1)
    local l1l1ll11l11l1l1l1ll1 = SpawnPrefab "dc_slot_machine"
    if l1l1ll11l11l1l1l1ll1 then
        l1l1ll11l11l1l1l1ll1["Transform"]:SetPosition(l11ll1ll1l11l1ll1l1l + ll11l11ll1l1l1ll1l1l[1] - 4, 0, l11l1l1l11ll1l11ll11 + ll11l11ll1l1l1ll1l1l[2])
        table["insert"](ll11l1l11ll1ll1ll1l1, l1l1ll11l11l1l1l1ll1)
        local l11l11l11l1ll1l1ll1l = SpawnPrefab "quagmire_coin3"
        if l11l11l11l1ll1l1ll1l then
            l11l11l11l1ll1l1ll1l["components"]["stackable"]:SetStackSize(5)
            l11l11l11l1ll1l1ll1l["Transform"]:SetPosition(l11ll1ll1l11l1ll1l1l + ll11l11ll1l1l1ll1l1l[1], 0, l11l1l1l11ll1l11ll11 + ll11l11ll1l1l1ll1l1l[2] + 4)
        end
        local ll1l1l11ll1l1l1l11l1 = SpawnPrefab "quagmire_coin4"
        if ll1l1l11ll1l1l1l11l1 then
            ll1l1l11ll1l1l1l11l1["components"]["stackable"]:SetStackSize(5)
            ll1l1l11ll1l1l1l11l1["Transform"]:SetPosition(l11ll1ll1l11l1ll1l1l + ll11l11ll1l1l1ll1l1l[1], 0, l11l1l1l11ll1l11ll11 + ll11l11ll1l1l1ll1l1l[2] - 4)
        end
    end

end

local function l1l1l1l1ll11l11l1l1l(l1l1l11l1ll11l1l11l1)
    local ll1l1l1l1l1l1ll11l11 = nil if # l1l1l11l1ll11l1l11l1 % 2 ~= 0 then
        local l1ll11l11l1l11l1l1ll = math["huge"]
        for l1l1l1l11ll11l1l11l1, l1l11ll1ll1l1ll1l1ll in ipairs(l1l1l11l1ll11l1l11l1)
        do
            if not l1l11ll1ll1l1ll1l1ll["byeCount"] then
                l1l11ll1ll1l1ll1l1ll["byeCount"] = 0
            end
            l1ll11l11l1l11l1l1ll = math["min"](l1ll11l11l1l11l1l1ll, l1l11ll1ll1l1ll1l1ll["byeCount"])
        end
        local ll1ll1l1l1l11l11ll1l ={}
        for l11ll11l1l1l1l1l1l1l, ll11l1ll11ll1l1l11l1 in ipairs(l1l1l11l1ll11l1l11l1)
        do
            if ll11l1ll11ll1l1l11l1["byeCount"] == l1ll11l11l1l11l1l1ll then
                table["insert"](ll1ll1l1l1l11l11ll1l, ll11l1ll11ll1l1l11l1)
            end
        end
        ll1l1l1l1l1l1ll11l11 = table["remove"](ll1ll1l1l1l11l11ll1l, math["random"](1, # ll1ll1l1l1l11l11ll1l))
        ll1l1l1l1l1l1ll11l11["byeCount"] = ll1l1l1l1l1l1ll11l11["byeCount"] + 1
        ll1ll1l1l1l11l11ll1l = nil for l11l1l1l11l1ll1l11l1, l11l11ll11l1l1l11l11 in ipairs(l1l1l11l1ll11l1l11l1)
        do
            if l11l11ll11l1l1l11l11 == ll1l1l1l1l1l1ll11l11 then
                table["remove"](l1l1l11l1ll11l1l11l1, l11l1l1l11l1ll1l11l1)
                break
            end
        end
    end
    if ll1l1l1l1l1l1ll11l11 ~= nil then
        l11ll11l11ll11l1ll1l(ll1l1l1l1l1l1ll11l11, # TUNING["dc_points_arena"])
    end

end

local function l1l1l1l11ll1ll11l1ll()
    local function l11l1l11ll1ll11l11ll()
        local l1l11l11ll11ll11l1l1 = l1ll1l1ll11l11ll1ll1()
        if # l1l11l11ll11ll11l1l1 <= 1 then
            return
        end
        for l1l1l1ll1l1l1l11ll1l, l1ll1ll1l1l1l1l1ll1l in ipairs(ll11l1l11ll1ll1ll1l1)
        do
            if l1ll1ll1l1l1l1l1ll1l:IsValid() then
                l1ll1ll1l1l1l1l1ll1l:Remove()
            end
        end
        ll11l1l11ll1ll1ll1l1 = nil ll11l1l11ll1ll1ll1l1 ={}
        l1l1l1l1ll11l11l1l1l(l1l11l11ll11ll11l1l1)
        local l1l11ll1l11l1l1ll1ll ={}
        while # l1l11l11ll11ll11l1l1 > 1
        do
            local l11l11l11l1l11ll11l1 = table["remove"](l1l11l11ll11ll11l1l1, math["random"](1, # l1l11l11ll11ll11l1l1))
            local ll1l11ll1l1l1l1ll1ll = table["remove"](l1l11l11ll11ll11l1l1, math["random"](1, # l1l11l11ll11ll11l1l1))
            table["insert"](l1l11ll1l11l1l1ll1ll,{l11l11l11l1l11ll11l1, ll1l11ll1l1l1l1ll1ll})
        end
        l1ll11l1ll1ll1ll11l1(l1l11ll1l11l1l1ll1ll)
        TheWorld:StartThread(function()
            TheNet:Announce(STRINGS["DC_FGC"]["DAOJISHIJIECHU"]) 
            Sleep(0.3) 
            TheNet:Announce "5" 
            Sleep(1) 
            TheNet:Announce "4" 
            Sleep(1) 
            TheNet:Announce "3" 
            Sleep(1) 
            TheNet:Announce "2" 
            Sleep(1) 
            TheNet:Announce "1" 
            Sleep(1) 
            TheNet:Announce(STRINGS["DC_FGC"]["XINYILUNKAISHI"]) 
            for l11l11l1l1ll1l11ll1l, l11l11ll1l1l1l11l1l1 in ipairs(l1l1ll1l11l11ll1l1l1) do
                l11l11ll1l1l1l11l1l1:RemoveTag "notarget" if l11l11ll1l1l1l11l1l1["components"]["health"] then
                    l11l11ll1l1l1l11l1l1["components"]["health"]:SetInvincible(false)
                end
            end
            l1l1ll1l11l11ll1l1l1 = nil l1l1ll1l11l11ll1l1l1 ={}
        end
        )
        TheWorld["arena_force_end"] = TheWorld:DoTaskInTime(5 * 60, function()
            for ll11ll1ll1l11l1l1ll1, ll1l11l11ll1ll1l11l1 in ipairs(l1l11ll1l11l1l1ll1ll) do
                local ll1ll1l1ll11l1l11ll1 = ll1l11l11ll1ll1l11l1[1] local ll11l11l1ll11l1l1l1l = ll1l11l11ll1ll1l11l1[2] if ll1ll1l1ll11l1l11ll1["survive_m"] and ll1ll1l1ll11l1l11ll1:IsValid() and ll11l11l1ll11l1l1l1l["survive_m"] and ll11l11l1ll11l1l1l1l:IsValid() then
                    local l1l11ll1l1l1l11l1l1l, ll11l11ll1l1l1l11ll1 = ll1ll1ll11ll11ll11l1(ll1ll1l1ll11l1l11ll1) local l11ll1l1ll1l11l11l11, l1l1l1l1l1l11l1l1ll1 = ll1ll1ll11ll11ll11l1(ll11l11l1ll11l1l1l1l) if l1l11ll1l1l1l11l1l1l > l11ll1l1ll1l11l11l11 then
                        ll11l11l1ll11l1l1l1l:TeamOut "幸存玩家人数低于竞争对手！"
                    elseif l1l11ll1l1l1l11l1l1l < l11ll1l1ll1l11l11l11 then
                        ll1ll1l1ll11l1l11ll1:TeamOut "幸存玩家人数低于竞争对手！"
                    elseif l1l11ll1l1l1l11l1l1l == l11ll1l1ll1l11l11l11 then
                        if ll11l11ll1l1l1l11ll1 > l1l1l1l1l1l11l1l1ll1 then
                            ll11l11l1ll11l1l1l1l:TeamOut "幸存玩家总血量低于竞争对手！"
                        elseif ll11l11ll1l1l1l11ll1 < l1l1l1l1l1l11l1l1ll1 then
                            ll1ll1l1ll11l1l11ll1:TeamOut "幸存玩家总血量低于竞争对手！"
                        elseif ll11l11ll1l1l1l11ll1 == l1l1l1l1l1l11l1l1ll1 then
                        end
                    end
                end
            end
            l1l1l1l11ll1ll11l1ll()
        end
        )
    end
    TheWorld:StartThread(function()
        TheNet:Announce(STRINGS["DC_FGC"]["XINYILUNDAOJISHI"]) Sleep(0.3) TheNet:Announce "10" Sleep(1) TheNet:Announce "9" Sleep(1) TheNet:Announce "8" Sleep(1) TheNet:Announce "7" Sleep(1) TheNet:Announce "6" Sleep(1) TheNet:Announce "5" Sleep(1) TheNet:Announce "4" Sleep(1) TheNet:Announce "3" Sleep(1) TheNet:Announce "2" Sleep(1) TheNet:Announce "1" Sleep(1) TheNet:Announce(STRINGS["DC_FGC"]["CHUANZHILEITAI"]) l11l1l11ll1ll11l11ll()
    end
    )

end

local function l11ll1l1l1l1l1ll1ll1()
    if not TUNING["gz_multiplayer_point"] then
        return
    end
    if TUNING["GZ_COUNT_SUOQUAN"] ~= TUNING["gz_SpecialModeStartTime"] then
        return
    end
    local l11l1ll1ll1l1l1l1l1l, l11ll11ll11l1l1ll1l1, l1l11l1l1l11l11l11l1 = TUNING["gz_multiplayer_point"]:Get()
    local ll11l1l11ll11l1l11l1 = 4
    for l11ll11l1ll1l11ll1ll, ll1ll1ll1ll1l1ll1l11 in ipairs(TUNING["dc_points_arena"])
    do
        for l1l11l1l1l1ll11ll1l1 = - 2, 2, 1
        do
            for l11l1l1l11l1l1ll11l1 = - 2, 2, 1
            do
                local ll1ll1ll1ll11l11l11l = l11l1ll1ll1l1l1l1l1l + ll11l1l11ll11l1l11l1 * l1l11l1l1l1ll11ll1l1 + ll1ll1ll1ll1l1ll1l11[1]
                local l1ll1l1l11ll1l11l1ll = l1l11l1l1l11l11l11l1 + ll11l1l11ll11l1l11l1 * l11l1l1l11l1l1ll11l1 + ll1ll1ll1ll1l1ll1l11[2]
                gz_SetTile(ll1ll1ll1ll11l11l11l, 0, l1ll1l1l11ll1l11l1ll, "CHECKER")
            end
        end
    end
    TheWorld:ListenForEvent("event_TeamOut", function(l1ll1ll1l1l1ll1ll1l1, l1ll1l1l11ll11ll1ll1)
        local l11l1l1l1ll11ll1ll1l = l1ll1l1l11ll11ll1ll1 and l1ll1l1l11ll11ll1ll1["manager"] if not (l11l1l1l1ll11ll1ll1l and l11l1l1l1ll11ll1ll1l["arena_rival"] and l11l1l1l1ll11ll1ll1l["arena_num"]) then
            return
        end
        local ll1l11ll1l11ll1ll1ll = l11l1l1l1ll11ll1ll1l["arena_rival"] if not (ll1l11ll1l11ll1ll1ll and ll1l11ll1l11ll1ll1ll["survive_m"] and ll1l11ll1l11ll1ll1ll["arena_rival"] and ll1l11ll1l11ll1ll1ll["arena_num"]) then
            return
        end
        local ll1l1l11ll11l1l1ll11, l11l1ll11l1l11l1l1ll, ll1l1l1l11l1ll11l1l1 = ll1l11ll1l11ll1ll1ll["Transform"]:GetWorldPosition() local ll1l11l11ll11ll1ll1l, ll11l11l1l11l1l1ll1l, l1l11ll1ll1l11l1l1ll = TheWorld["Map"]:GetTileCenterPoint(ll1l1l11ll11l1l1ll11, l11l1ll11l1l11l1l1ll, ll1l1l1l11l1ll11l1l1) local ll11l1l11ll11l1l11l1 = 4 for l1ll1ll1l1ll1l1ll11l = - 2, 2, 1 do
            for ll1ll11l1l1l1l11ll11 = - 2, 2, 1 do
                local l11l1l11ll11l1l11l11 = ll1l11l11ll11ll1ll1l + ll11l1l11ll11l1l11l1 * l1ll1ll1l1ll1l1ll11l local ll1l1l11l1l11ll1l11l = l1l11ll1ll1l11l1l1ll + ll11l1l11ll11l1l11l1 * ll1ll11l1l1l1l11ll11 if TheWorld["Pathfinder"]:IsClear(ll1l1l11ll11l1l1ll11, l11l1ll11l1l11l1l1ll, ll1l1l1l11l1ll11l1l1, l11l1l11ll11l1l11l11, 0, ll1l1l11l1l11ll1l11l,{ignorewalls =(string.sub("l1l1l1ll11ll1ll1l11l", 9, 11) == "11l"), ignorecreep =(286-451-135 == - 300), allowocean =(string.sub("l11l11l11l11ll11l1ll", 6, 14) == "l11l111ll")}) then
                    local l1l11l11l1ll1ll1ll1l = TheSim:FindEntities(l11l1l11ll11l1l11l11, 0, ll1l1l11l1l11ll1l11l, 2.83) for ll11l1ll11ll1l1l1ll1, l11ll11l1ll1ll1l1l1l in ipairs(l1l11l11l1ll1ll1ll1l) do
                        if l11ll11l1ll1ll1l1l1l and l11ll11l1ll1ll1l1l1l["prefab"] == "miasma_cloud" and l11ll11l1ll1ll1l1l1l:IsValid() then
                            l11ll11l1ll1ll1l1l1l:Remove()
                        end
                    end
                end
            end
        end
        l11ll11l11ll11l1ll1l(ll1l11ll1l11ll1ll1ll, ll1l11ll1l11ll1ll1ll["arena_num"])
    end
    )
    l1l1l1l11ll1ll11l1ll()

end

function gz_GameModeRule()
    if TUNING["gz_GameMode"] == "Rondom" or (TUNING["gz_GameMode"] == "Land" and TUNING["gz_Site"] ~= 8) then
        if TUNING["gz_Site"] ~= 8 then
            for l11l11ll1ll1l11ll1ll, l1l1l1l1l1l1l1l1ll11 in ipairs(special_gamemodes)
            do
                if l1l1l1l1l1l1l1l1ll11["data"] == "Land" then
                    table["remove"](special_gamemodes, l11l11ll1ll1l11ll1ll)
                end
            end
        end
        local l11ll11l11ll1l1l1l1l = special_gamemodes[math["random"](# special_gamemodes)]
        TUNING["gz_GameMode"] = l11ll11l11ll1l1l1l1l["data"]
        TheNet:Announce(string["format"](STRINGS["DC_FGC"]["SUIJIMOSHI"], l11ll11l11ll1l1l1l1l["description"]))
        if TUNING["gz_GameMode"] == "Land" or TUNING["gz_GameMode"] == "Arena" then
            TUNING["gz_ContinueSpawnGrass"] =(string.sub("l11ll11ll1ll1l11l11l", 8, 14) ~= "ll1ll1l")
        end
    end
    if TUNING["GZ_COUNT_SUOQUAN"] == TUNING["gz_SpecialModeStartTime"] then
        TheNet:Announce(_gamemodes[TUNING["gz_GameMode"]]["announce"])
    end
    if TUNING["gz_GameMode"] == "Classic" then
    elseif TUNING["gz_GameMode"] == "Naval" then
        ll1ll11l1ll1ll11l11l()
    elseif TUNING["gz_GameMode"] == "Wharf" then
        l1l1l11l1ll1ll1l1ll1()
    elseif TUNING["gz_GameMode"] == "Land" then
        l1l11l1ll1l11l11ll1l()
    elseif TUNING["gz_GameMode"] == "Arena" then
        l11ll1l1l1l1l1ll1ll1()
    end

end

GLOBAL["gz_GameModeRule"] = gz_GameModeRule

function gz_SpecialModeNotSpawnGrass()
    if TUNING["gz_GameMode"] == "Classic" then
        return
    end
    if TUNING["gz_ContinueSpawnGrass"] then
        return
    end
    if TheWorld["auto_weed"] then
        gz_AutoSpawn()
    end
    TUNING["GZ_CAN_AUTO_WEED"] =(string.sub("l1ll1ll1l11ll1ll11l1", 7, 14) == "l1ll1111")

end

GLOBAL["gz_SpecialModeNotSpawnGrass"] = gz_SpecialModeNotSpawnGrass

function gz_SetGameMode(ll1ll1l1ll1l11ll11l1)
    if TUNING["GZ_COUNT_SUOQUAN"] >= TUNING["gz_SpecialModeStartTime"] then
        TheNet:Announce(STRINGS["DC_FGC"]["XIACIZAODIAN"])
        return
    end
    if ll1ll1l1ll1l11ll11l1 == "Classic" or ll1ll1l1ll1l11ll11l1 == 1 then
        TUNING["gz_GameMode"] = "Classic"
    elseif ll1ll1l1ll1l11ll11l1 == "Naval" or ll1ll1l1ll1l11ll11l1 == 2 then
        TUNING["gz_GameMode"] = "Naval"
    elseif ll1ll1l1ll1l11ll11l1 == "Wharf" or ll1ll1l1ll1l11ll11l1 == 3 then
        TUNING["gz_GameMode"] = "Wharf"
    elseif ll1ll1l1ll1l11ll11l1 == "Land" or ll1ll1l1ll1l11ll11l1 == 4 then
        TUNING["gz_GameMode"] = "Land"
    elseif ll1ll1l1ll1l11ll11l1 == "Arena" or ll1ll1l1ll1l11ll11l1 == 5 then
        TUNING["gz_GameMode"] = "Arena"
    elseif ll1ll1l1ll1l11ll11l1 == "Rondom" or ll1ll1l1ll1l11ll11l1 == 6 then
        TUNING["gz_GameMode"] = "Rondom"
    else
        gz_SetGameMode(math["random"](6))
        return
    end
    TheNet:Announce(string["format"](STRINGS["DC_FGC"]["MOSHIYIXIUGAI"], _gamemodes[TUNING["gz_GameMode"]]["description"]))

end

GLOBAL["gz_SetGameMode"] = gz_SetGameMode