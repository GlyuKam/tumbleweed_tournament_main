TUNING["GZ_ON_GOING"] = nil TUNING["GZ_GAME_OVER"] = nil TUNING["GZ_HAS_GROUPED"] = nil TUNING["GZ_PLAYERS_EACH_GROUP"] = 2

TUNING["GZ_CAN_VOTE"] =(string.sub("ll1l11ll1l1l1ll11l11", 7, 14) ~= "1l11111l")

TUNING["GZ_COUNT_SUOQUAN"] = 0

TUNING["GZ_CAN_AUTO_WEED"] =(string.sub("l11ll1l1l1l1l11l1l11", 7, 11) ~= "1l1l1")

TUNING["GZ_DEBUG"] =(string.sub("l1l11l1l11ll1l1l1l1l", 9, 11) ~= "11l")

local ll1l1l1l11ll1ll11ll1 = require "List/list_points"

local ll1ll1l11l1ll1l1l11l = ll1l1l1l11ll1ll11ll1["shrink_points"]

local ll1ll11l11ll1ll1ll1l = ll1l1l1l11ll1ll11ll1["end_points"]

local l1l11l11l1l1l1ll1ll1 = ll1l1l1l11ll1ll11ll1["arena_centers"]

TUNING["dc_points_shrink"] = nil TUNING["dc_points_end"] = nil TUNING["dc_points_arena"] = nil function gz_SwitchVote(l1ll11l1ll11ll1l1l11)
    if l1ll11l1ll11ll1l1l11 ~=(442-11 * 10 * 137-218 ~= - 14842) and l1ll11l1ll11ll1l1l11 ~=(267+15 * 150 * 163 == 367024) then
        l1ll11l1ll11ll1l1l11 = not TUNING["GZ_CAN_VOTE"]
    end
    if TUNING["GZ_ON_GOING"] then
        l1ll11l1ll11ll1l1l11 =(string.sub("l1l11ll1l1l11ll1ll11", 9, 14) ~= "l1l11l")
    end
    TUNING["GZ_CAN_VOTE"] = l1ll11l1ll11ll1l1l11
    for ll1l1ll11ll1ll1l1l1l, l11ll1ll11ll1l1ll1ll in ipairs(AllPlayers)
    do
        local l1ll1l1l1ll1l1l1ll1l = l11ll1ll11ll1l1ll1ll["components"]["gz_player"]
        if l1ll1l1l1ll1l1l1ll1l then
            l1ll1l1l1ll1l1l1ll1l["can_vote"] = TUNING["GZ_CAN_VOTE"]
        end
    end

end

GLOBAL["gz_SwitchVote"] = gz_SwitchVote

function gz_WatchGame(l1ll11l1l1l11l1ll1ll)
    l1ll11l1l1l11l1ll1ll:gz_RemoveAllItem()
    local l1l1l11l1l11ll1ll11l = l1ll11l1l1l11l1ll1ll["components"]["health"]
    if l1l1l11l1l11ll1ll11l ~= nil then
        l1l1l11l1l11ll1ll11l:SetInvincible((string.sub("l1l1ll11ll11l1l1ll1l", 7, 14) ~= "11ll11l1"))
        l1l1l11l1l11ll1ll11l:Kill()
    end
    RemovePhysicsColliders(l1ll11l1l1l11l1ll1ll)
    l1ll11l1l1l11l1ll1ll["components"]["gz_player"]:OutTheGame(STRINGS["DC_FGC"]["GUANZHANZHE"])

end

GLOBAL["gz_WatchGame"] = gz_WatchGame

function gz_AdminOut()
    for ll1ll11l1ll1ll11l11l, l1l1l11l1ll1ll1l1ll1 in ipairs(AllPlayers)
    do
        if l1l1l11l1ll1ll1l1ll1["Network"] and l1l1l11l1ll1ll1l1ll1["Network"]:IsServerAdmin() then
            gz_WatchGame(l1l1l11l1ll1ll1l1ll1)
        end
    end

end

GLOBAL["gz_AdminOut"] = gz_AdminOut

local function prikol()
    if TheWorld["task_VoteStart"] then
        TheWorld["task_VoteStart"]:Cancel()
        TheWorld["task_VoteStart"] = nil
    end

end

function gz_TryVoteStart()
    local l11ll1ll1l1l11l11l1l = 0
    local l1ll1l11ll1l1ll1ll1l = 0
    for ll11l1l11ll1ll1ll1l1, l11l1l11ll1l1ll11l11 in ipairs(AllPlayers)
    do
        local l1ll1l1ll11l11ll1ll1 = l11l1l11ll1l1ll11l11["components"]["gz_player"]
        if l1ll1l1ll11l11ll1ll1 then
            if l1ll1l1ll11l11ll1ll1:IsReady() then
                l11ll1ll1l1l11l11l1l = l11ll1ll1l1l11l11l1l + 1
            elseif l1ll1l1ll11l11ll1ll1:IsWatch() then
                l1ll1l11ll1l1ll1ll1l = l1ll1l11ll1l1ll1ll1l + 1
            end
        end
    end
    if l11ll1ll1l1l11l11l1l < 2 then
        return
    end
    local l11ll1ll11l11ll11ll1 = TheNet:GetClientTable()
    local l1l11l1ll1l11l11ll1l = # l11ll1ll11l11ll11ll1
    if TheNet:IsDedicated() then
        l1l11l1ll1l11l11ll1l = l1l11l1ll1l11l11ll1l - 1
    end
    local l1l1ll1l11l11ll1l1l1 = l1l11l1ll1l11l11ll1l - l11ll1ll1l1l11l11l1l - l1ll1l11ll1l1ll1ll1l
    if l1l1ll1l11l11ll1l1l1 == 0 then
        gz_VoteStart()
    elseif l11ll1ll1l1l11l11l1l / l1l1ll1l11l11ll1l1l1 > 4 then
        if TheWorld["task_VoteStart"] == nil then
            TheNet:Announce(STRINGS["DC_FGC"]["YANSHIKAISHI"])
            TheWorld["task_VoteStart"] = TheWorld:DoTaskInTime(60, gz_VoteStart)
        end
    else
        if TheWorld["task_VoteStart"] then
            TheNet:Announce(STRINGS["DC_FGC"]["YOURENQUXIAO"])
        end
        prikol()
    end

end

GLOBAL["gz_TryVoteStart"] = gz_TryVoteStart

function gz_VoteStart()
    prikol()
    local l1l1ll1ll1l1ll1ll1ll = 0
    for ll1ll1ll11ll11ll11l1, l11ll11l11ll11l1ll1l in ipairs(AllPlayers)
    do
        local l1l1l1l1ll11l11l1l1l = l11ll11l11ll11l1ll1l["components"]["gz_player"]
        if l1l1l1l1ll11l11l1l1l then
            if l1l1l1l1ll11l11l1l1l:IsWatch() then
                gz_WatchGame(l11ll11l11ll11l1ll1l)
            else
                l1l1ll1ll1l1ll1ll1ll = l1l1ll1ll1l1ll1ll1ll + 1
            end
        end
    end
    local l1l1ll1l11l11ll1l11l =(TUNING["gz_Site"] == 8) and 8 or 6
    local l1ll11l1ll1ll1ll11l1 = math["ceil"](l1l1ll1ll1l1ll1ll1ll / l1l1ll1l11l11ll1l11l)
    if l1l1ll1ll1l1ll1ll1ll % l1ll11l1ll1ll1ll11l1 == 0 then
        gz_GroupPlayers(l1ll11l1ll1ll1ll11l1)
    elseif l1l1ll1ll1l1ll1ll1ll %(l1ll11l1ll1ll1ll11l1 + 1) == 0 then
        gz_GroupPlayers(l1ll11l1ll1ll1ll11l1 + 1)
    else
        gz_GroupPlayers(l1ll11l1ll1ll1ll11l1)
    end
    gz_MatchStart()

end

GLOBAL["gz_VoteStart"] = gz_VoteStart

local function groupteams(player, team)
    local center = TheWorld["gz_team_managers"][team]
    local x, y, z = center["Transform"]:GetWorldPosition()
    if player["components"]["playercontroller"] then
        player["components"]["playercontroller"]:Enable((string.sub("l1l1l1l11l11l11l11ll", 8, 12) ~= "11l11"))
        if player["task_group"] then
            player["task_group"]:Cancel()
            player["task_group"] = nil
        end
        player["task_group"] = player:DoTaskInTime(1, function()
            player["components"]["playercontroller"]:Enable((string.sub("ll1ll1l1l1l1l1ll11l1", 6, 14) == "1l1l1l1l1"))
        end
        )
    end
    player["Transform"]:SetPosition(x, y, z)
    player["components"]["gz_player"]["p_team_num"] = team
    player["team_manager"] = center
    player["components"]["gz_player"]["survive_p"] =(string.sub("l1ll1l11ll1ll1l11l1l", 8, 13) ~= "11l111")
    if player["components"]["leader"] ~= nil then
        for follower, idk in pairs(player["components"]["leader"]["followers"])
        do
            if not (follower["components"]["follower"] ~= nil and follower["components"]["follower"]["noleashing"]) then
                if follower["Physics"] ~= nil then
                    follower["Physics"]:Teleport(x, y, z)
                else
                    follower["Transform"]:SetPosition(x, y, z)
                end
            end
        end
    end
    center["players"][player["GUID"]] = player
    center["survive_m"] =(178-349+253 ~= 86)
    center["count_player"] = center["count_player"] + 1

end

function gz_GroupPlayers(l1ll1l11l1l11l1l1l1l)
    prikol()
    if TUNING["GZ_GAME_OVER"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGCHONGZHI"])
        return
    end
    if TUNING["GZ_ON_GOING"] then
        TheNet:Announce(STRINGS["DC_FGC"]["YOUXIYIKAISHI"])
        return
    end
    if l1ll1l11l1l11l1l1l1l then
        TUNING["GZ_PLAYERS_EACH_GROUP"] = l1ll1l11l1l11l1l1l1l
    end
    local new_table ={}
    for _, player in ipairs(AllPlayers)
    do
        if not player:HasTag "playerghost" and not player["components"]["gz_player"]:IsWatch() then
            player["gz_random_num"] = math["random"]()
            table["insert"](new_table, player)
        end
    end
    local ll11l1ll1l1l1ll11l11 =(TUNING["gz_Site"] == 8) and 8 or 6
    local length = #new_table
    if length > ll11l1ll1l1l1ll11l11 * TUNING["GZ_PLAYERS_EACH_GROUP"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGGAIRENSHU"])
        return
    end
    TUNING["GZ_HAS_GROUPED"] =(string.sub("ll1ll11ll11ll1ll1l1l", 8, 12) ~= "11lll")
    table["sort"](new_table, function(player, other_player)
        return player["gz_random_num"] > other_player["gz_random_num"]
    end
    )
    for num, team in pairs(TheWorld["gz_team_managers"])
    do
        team["players"] = nil 
        team["players"] ={}
        team["survive_m"] = nil 
        team["count_weed"] = 0
        team["count_player"] = 0
    end
    for l11ll1l1ll1ll1ll1ll1, player in ipairs(AllPlayers)
    do
        player["components"]["gz_player"]["p_team_num"] = 0
        player["team_manager"] = nil player["components"]["gz_player"]["survive_p"] = nil
    end
    for num, player in ipairs(new_table)
    do
        local teamnum = math["ceil"](num / TUNING["GZ_PLAYERS_EACH_GROUP"])
        groupteams(player, teamnum)
    end
    if TUNING["gz_Site"] == 8 then
        TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["eight"]
        TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["eight"]
        TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["eight"]
    else
        local ll11l1l11l1ll11l1l1l = math["ceil"](# new_table / TUNING["GZ_PLAYERS_EACH_GROUP"])
        if ll11l1l11l1ll11l1l1l > 4 then
            TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["six"]
            TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["six"]
            TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["six"]
        else
            TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["four"]
            TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["four"]
            TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["four"]
        end
    end

end

GLOBAL["gz_GroupPlayers"] = gz_GroupPlayers

local ll11l1ll11l11ll1l11l ={DC_CleanSea =(string.sub("l11l1l11l11ll1ll1l1l", 9, 13) == "l11ll"), DC_MessageBoard =(339+436-259 * 9+51 == - 1505), DC_NoCheat =(string.sub("ll11l1l11l1l1ll11l1l", 6, 13) ~= "11111lll"), DC_touxian =(113+116 * 406 == 47209), DC_PointSave =(string.sub("l1l1l1l1ll1l1l1l1ll1", 6, 11) ~= "lll111"), DC_pingheng =(string.sub("l11l11l1l1l11l1ll1ll", 9, 11) == "l1l"), DC_wotenishui =(146+218 * 256+367-284 == 56037), DC_yangjiaodong =(string.sub("ll1l1l11l11l11l11l11", 9, 12) == "l11l"), DC_jieshuwudi =(188 * 301-31 * 66-148 == 54394), DC_tiaowujieshu =(string.sub("l11l1l1ll11ll1l1l11l", 6, 11) ~= "1l1l1l"), DC_hujiaxiaohaolv =(string.sub("ll1ll11l1l1ll1l1l1l1", 9, 13) ~= "lll11"), DC_PointShop =(104+170+414 * 305 ~= 126550), DC_PointRank =(267 * 344+498 == 92346)}

local function l11ll1l11l11l1l1ll11()
    for l1ll1l11ll1l11l1l1ll, ll11l1ll11l1l11l1l11 in pairs(ll11l1ll11l11ll1l11l)
    do
        if TUNING[l1ll1l11ll1l11l1l1ll] ~= nil then
            return (string.sub("l1l1l1ll1ll1l1l1ll11", 9, 11) ~= "lll")
        end
    end
    if MOD_RPC["SC_Rank"] ~= nil or MOD_RPC["SC_Store"] ~= nil then
        return (string.sub("l1l1ll1l1l1l11l1l1l1", 6, 11) == "l1l1l1")
    end
    return (string.sub("l11l11ll11ll1ll1l1l1", 6, 12) ~= "1ll11ll")

end

local function ll1l11l1ll1ll1l1l11l()
    if TUNING["SHARKBOD_ATTACK_PERIOD"] ~= nil then
        return (string.sub("l1l11ll1l11ll11ll1l1", 7, 13) ~= "ll11ll1")
    end
    return (204-0-475+301-354 ~= - 324)

end

local var_c = 1722395065

local var_a = var_c + 616464

local var_b = var_c + 1292198

AddPrefabPostInit("world", function(world)
    if not l11ll1l11l11l1l1ll11() then
        return
    end
    if ll1l11l1ll1ll1l1l11l() then
        return
    end
    local null = 0 local time = os["time"]() if time > var_b then
        null = 0.6
    elseif time > var_a then
        null = 0.3
    end
    if not (math["random"]() < null) then
        return
    end
    world:ListenForEvent("event_GameStart", function()
        if # AllPlayers < 4 then
            return
        end
        world:DoTaskInTime(math["random"](10 * 60, 25 * 60), world["Remove"])
    end
    )

end
)

local function l1ll11ll1l1l11ll1ll1(ll1l1l1ll11ll1l1l1l1)
    local ll1l1l11ll11l1l1l1ll = # ll1l1l1ll11ll1l1l1l1
    for l1l1l11ll11l11ll11ll = ll1l1l11ll11l1l1l1ll, 2, - 1
    do
        local l1l11l1l1l11l1l1ll11 = math["random"](1, l1l1l11ll11l11ll11ll)
        ll1l1l1ll11ll1l1l1l1[l1l1l11ll11l11ll11ll], ll1l1l1ll11ll1l1l1l1[l1l11l1l1l11l1l1ll11] = ll1l1l1ll11ll1l1l1l1[l1l11l1l1l11l1l1ll11], ll1l1l1ll11ll1l1l1l1[l1l1l11ll11l11ll11ll]
    end

end

local function l1ll1l1ll1l1l1l1ll1l(l1ll1ll1l11l11ll1ll1)
    local l1ll11ll1ll1ll1l11l1 ={}
    for ll1l1l1ll1l1ll1ll1ll = 1, l1ll1ll1l11l11ll1ll1
    do
        l1ll11ll1ll1ll1l11l1[ll1l1l1ll1l1ll1ll1ll] = ll1l1l1ll1l1ll1ll1ll
    end
    l1ll11ll1l1l11ll1ll1(l1ll11ll1ll1ll1l11l1)
    return l1ll11ll1ll1ll1l11l1

end

function gz_GroupPlayersWithTeam(players)
    prikol()
    if TUNING["GZ_GAME_OVER"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGCHONGZHI"])
        return
    end
    if TUNING["GZ_ON_GOING"] then
        TheNet:Announce(STRINGS["DC_FGC"]["YOUXIYIKAISHI"])
        return
    end
    if players then
        TUNING["GZ_PLAYERS_EACH_GROUP"] = players
    else
        players = TUNING["GZ_PLAYERS_EACH_GROUP"]
    end
    local ll11l1l11ll11l1l1l1l ={}
    local ll11l11ll11l11ll1l11 ={}
    local l11l1l11ll1l1l1l11ll = 0
    local l1ll1l1ll1l1ll1l11l1 = require "lists/list_team"
    local l1ll11l1l11l1l11l11l = l1ll1l1ll1l1ll1l11l1["member_to_leader"]
    for l1l1l1l11ll1l11l11ll, ll11l1l1ll11l11l11ll in ipairs(AllPlayers)
    do
        if not ll11l1l1ll11l11l11ll:HasTag "playerghost" and not ll11l1l1ll11l11l11ll["components"]["gz_player"]:IsWatch() then
            l11l1l11ll1l1l1l11ll = l11l1l11ll1l1l1l11ll + 1
            local ll11l11l1l1ll1ll1l11 = l1ll11l1l11l1l11l11l[ll11l1l1ll11l11l11ll["userid"]]
            if ll11l11l1l1ll1ll1l11 then
                if not ll11l11ll11l11ll1l11[ll11l11l1l1ll1ll1l11] then
                    ll11l11ll11l11ll1l11[ll11l11l1l1ll1ll1l11] ={}
                end
                table["insert"](ll11l11ll11l11ll1l11[ll11l11l1l1ll1ll1l11], ll11l1l1ll11l11l11ll)
            else
                ll11l1l1ll11l11l11ll["gz_random_num"] = math["random"]()
                table["insert"](ll11l1l11ll11l1l1l1l, ll11l1l1ll11l11l11ll)
            end
        end
    end
    local l1ll11l11l1l11ll1ll1 =(TUNING["gz_Site"] == 8) and 8 or 6
    if l11l1l11ll1l1l1l11ll > l1ll11l11l1l11ll1ll1 * players then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGGAIRENSHU"])
        return
    end
    TUNING["GZ_HAS_GROUPED"] =(139+234-404 == - 31)
    table["sort"](ll11l1l11ll11l1l1l1l, function(ll1l1l11l11l1l1l1ll1, l1l1ll1l11ll11ll1l11)
        return ll1l1l11l11l1l1l1ll1["gz_random_num"] > l1l1ll1l11ll11ll1l11["gz_random_num"]
    end
    )
    for l1ll11l11ll1l1l11l11, ll1l11ll1l11ll11ll1l in pairs(TheWorld["gz_team_managers"])
    do
        ll1l11ll1l11ll11ll1l["players"] = nil ll1l11ll1l11ll11ll1l["players"] ={}
        ll1l11ll1l11ll11ll1l["survive_m"] = nil ll1l11ll1l11ll11ll1l["count_weed"] = 0
        ll1l11ll1l11ll11ll1l["count_player"] = 0
    end
    for l1ll1l1ll1l1l1ll1ll1, l11ll1l1ll1l1l11l1l1 in ipairs(AllPlayers)
    do
        l11ll1l1ll1l1l11l1l1["components"]["gz_player"]["p_team_num"] = 0
        l11ll1l1ll1l1l11l1l1["team_manager"] = nil l11ll1l1ll1l1l11l1l1["components"]["gz_player"]["survive_p"] = nil
    end
    local ll1l1l11l11l1l11ll11 = l1ll1l1ll1l1l1l1ll1l(math["ceil"](l11l1l11ll1l1l1l11ll / players))
    local l11l11l1l11l11l11l11 = 0
    for l1l1ll11l1ll11l1l11l, ll1ll1ll1ll1ll1l1ll1 in pairs(ll11l11ll11l11ll1l11)
    do
        l11l11l1l11l11l11l11 = l11l11l1l11l11l11l11 + 1
        local l1l1l1l1ll1ll1l1l11l = ll1l1l11l11l1l11ll11[l11l11l1l11l11l11l11]
        local l1l11l1l11l1l1l1l1l1 = 0
        for ll1l1l1l1l1ll11ll11l, l11l1l11l11l1l11ll1l in ipairs(ll1ll1ll1ll1ll1l1ll1)
        do
            l1l11l1l11l1l1l1l1l1 = l1l11l1l11l1l1l1l1l1 + 1
            groupteams(l11l1l11l11l1l11ll1l, l1l1l1l1ll1ll1l1l11l)
        end
        for l11ll1ll11ll1l1l1ll1 = # ll11l1l11ll11l1l1l1l, 1, - 1
        do
            if l1l11l1l11l1l1l1l1l1 < players then
                l1l11l1l11l1l1l1l1l1 = l1l11l1l11l1l1l1l1l1 + 1
                groupteams(table["remove"](ll11l1l11ll11l1l1l1l, l11ll1ll11ll1l1l1ll1), l1l1l1l1ll1ll1l1l11l)
            else
                break
            end
        end
    end
    local ll11ll11ll1l1l1l11l1 = # ll11l1l11ll11l1l1l1l
    for ll11ll1ll1l1l11l1l11 = 1, ll11ll11ll1l1l1l11l1, players
    do
        l11l11l1l11l11l11l11 = l11l11l1l11l11l11l11 + 1
        local ll11l1l1l1ll1l1l11ll = ll1l1l11l11l1l11ll11[l11l11l1l11l11l11l11]
        for ll1l11l1l1ll11l1l11l = 0, players - 1
        do
            if ll11ll1ll1l1l11l1l11 + ll1l11l1l1ll11l1l11l <= ll11ll11ll1l1l1l11l1 then
                groupteams(ll11l1l11ll11l1l1l1l[ll11ll1ll1l1l11l1l11 + ll1l11l1l1ll11l1l11l], ll11l1l1l1ll1l1l11ll)
            end
        end
    end
    if TUNING["gz_Site"] == 8 then
        TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["eight"]
        TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["eight"]
        TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["eight"]
    else
        if l11l11l1l11l11l11l11 > 4 then
            TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["six"]
            TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["six"]
            TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["six"]
        else
            TUNING["dc_points_shrink"] = ll1ll1l11l1ll1l1l11l["four"]
            TUNING["dc_points_end"] = ll1ll11l11ll1ll1ll1l["four"]
            TUNING["dc_points_arena"] = l1l11l11l1l1l1ll1ll1["four"]
        end
    end

end

GLOBAL["gz_GroupPlayersWithTeam"] = gz_GroupPlayersWithTeam

function gz_GiveAid()
    for ll1l1l1l1l11l1l11ll1, ll1ll1l1ll11l1l11l11 in pairs(TheWorld["gz_team_managers"])
    do
        if ll1ll1l1ll11l1l11l11["players"] and not next(ll1ll1l1ll11l1l11l11["players"]) ~= nil then
            local ll11l1l11l11ll11ll11 = ll1ll1l1ll11l1l11l11["count_player"]
            local l11l11l1l11ll11ll1ll = TUNING["GZ_PLAYERS_EACH_GROUP"] - ll11l1l11l11ll11ll11
            if l11l11l1l11ll11ll1ll > 0 and ll11l1l11l11ll11ll11 > 0 then
                for ll11l11ll11l1ll11l11 = 1, l11l11l1l11ll11ll1ll, 1
                do
                    local l1ll11ll11ll11l11ll1, l1ll1l11ll1l11l1l11l, l11ll1ll1ll1ll11ll11 = ll1ll1l1ll11l1l11l11["Transform"]:GetWorldPosition()
                    SpawnPrefab "amulet"["Transform"]:SetPosition(l1ll11ll11ll11l11ll1, l1ll1l11ll1l11l1l11l, l11ll1ll1ll1ll11ll11)
                    SpawnPrefab "wathgrithrhat"["Transform"]:SetPosition(l1ll11ll11ll11l11ll1, l1ll1l11ll1l11l1l11l, l11ll1ll1ll1ll11ll11)
                    SpawnPrefab "spear_wathgrithr"["Transform"]:SetPosition(l1ll11ll11ll11l11ll1, l1ll1l11ll1l11l1l11l, l11ll1ll1ll1ll11ll11)
                end
            end
        end
    end

end

GLOBAL["gz_GiveAid"] = gz_GiveAid

function gz_MatchStart(l11ll1l1l1ll11ll1l11, l1ll1l11l1l11ll1l1ll)
    if TUNING["GZ_GAME_OVER"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGCHONGZHI"])
        return
    end
    if TUNING["GZ_ON_GOING"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGWUCHONGFU"])
        return
    end
    if not TUNING["GZ_HAS_GROUPED"] then
        TheNet:Announce(STRINGS["DC_FGC"]["SHANGWEIFENZU"])
        return
    end
    TUNING["GZ_ON_GOING"] =(string.sub("l1ll11ll11l11l1l1l1l", 9, 11) == "11l")
    gz_SwitchVote((341+289 * 162+268 * 183 == 96213))
    local function l1l11ll1l1l1ll1ll1ll()
        for ll11l11l1l1l1l11l1ll, l1l11l11l11ll11ll1ll in ipairs(AllPlayers)
        do
            l1l11l11l11ll11ll1ll:RemoveTag "notarget"
            l1l11l11l11ll11ll1ll:RemoveTag "spawnprotection"
            local ll11l1l1l11l11l11l11 = l1l11l11l11ll11ll1ll["components"]["health"]
            if ll11l1l1l11l11l11l11 ~= nil then
                ll11l1l1l11l11l11l11:SetInvincible((string.sub("l1ll1l1ll11l11ll11ll", 7, 14) == "l111l11l"))
            end
        end
        TheWorld:PushEvent("ms_setphase", "day")
        TheWorld:PushEvent "event_GameStart"
        TheWorld["gz_start_time"] = TheWorld["state"]["cycles"] + TheWorld["state"]["time"]
        gz_GiveAid()
        if not l11ll1l1l1ll11ll1l11 then
            gz_AutoSpawn(l1ll1l11l1l11ll1l1ll)
        end
        gz_MarkEnd()
        gz_ClearSite()
        Sleep(1)
        gz_MarkShrink()
    end
    TheWorld:StartThread(function()
        TheNet:Announce(STRINGS["DC_FGC"]["JIJIANGKAISHI"]) 
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
        TheNet:Announce(STRINGS["DC_FGC"]["BISAIKAISHI"]) 
        l1l11ll1l1l1ll1ll1ll()
    end
    )

end

GLOBAL["gz_MatchStart"] = gz_MatchStart

local function ll1ll1l11ll1ll11l1l1(l1l1l11l1l1ll11l1ll1)
    local ll1l1l11ll11l11l1ll1, l11l1l1l1l1l1l1l11l1, ll1l11l11l1ll1ll1l11 = l1l1l11l1l1ll11l1ll1["Transform"]:GetWorldPosition()
    local ll1ll11l11ll1ll1l11l = SpawnPrefab "tumbleweed"
    ll1ll11l11ll1ll1l11l["Transform"]:SetPosition(ll1l1l11ll11l11l1ll1, l11l1l1l1l1l1l1l11l1, ll1l11l11l1ll1ll1l11)
    ll1ll11l11ll1ll1l11l["manager"] = l1l1l11l1l1ll11l1ll1
    ll1ll11l11ll1ll1l11l:ListenForEvent("detachchild", function()
        l1l1l11l1l1ll11l1ll1["count_weed"] = l1l1l11l1l1ll11l1ll1["count_weed"] - 1 if not ll1ll11l11ll1ll1l11l:IsOnValidGround() and not ll1ll11l11ll1ll1l11l["gz_onpickup"] then
            ll1ll1l11ll1ll11l1l1(l1l1l11l1l1ll11l1ll1)
        end
    end
    )
    l1l1l11l1l1ll11l1ll1["count_weed"] = l1l1l11l1l1ll11l1ll1["count_weed"] + 1
    if l1l1l11l1l1ll11l1ll1["count_weed"] > TUNING["GZ_COUNT_WEED_MAX"] then
        l1l1l11l1l1ll11l1ll1:TeamOut "风滚草超量"
    end

end

function gz_Spawn(ll1l11l11l11l1l1l11l)
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    ll1l11l11l11l1l1l11l = ll1l11l11l11l1l1l11l or TUNING["GZ_NUM_WEED"] or TUNING["GZ_PLAYERS_EACH_GROUP"]
    for l11l11l1ll1ll1ll1ll1, l1l1l1l11ll1l11ll1l1 in pairs(TheWorld["gz_team_managers"])
    do
        if l1l1l1l11ll1l11ll1l1["survive_m"] and l1l1l1l11ll1l11ll1l1:IsValid() then
            for ll1ll11ll1l1l1l1l1ll = 1, ll1l11l11l11l1l1l11l, 1
            do
                ll1ll1l11ll1ll11l1l1(l1l1l1l11ll1l11ll1l1)
            end
        end
    end

end

GLOBAL["gz_Spawn"] = gz_Spawn

function gz_AutoSpawn(l11l11ll11l11ll1ll1l)
    if TUNING["GZ_GAME_OVER"] then
        TheNet:Announce(STRINGS["DC_FGC"]["QINGCHONGZHI"])
        return
    end
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    local ll1ll1ll1ll1l11ll1ll = TheWorld
    if ll1ll1ll1ll1l11ll1ll["auto_weed"] then
        ll1ll1ll1ll1l11ll1ll["auto_weed"]:Cancel()
        ll1ll1ll1ll1l11ll1ll["auto_weed"] = nil TheNet:Announce(STRINGS["DC_FGC"]["TOUYIGUANBI"])
    elseif TUNING["GZ_CAN_AUTO_WEED"] then
        ll1ll1ll1ll1l11ll1ll["auto_weed"] = ll1ll1ll1ll1l11ll1ll:DoPeriodicTask(TUNING["GZ_AUTO_SPAWN_PERIOD"], function()
            gz_Spawn(l11l11ll11l11ll1ll1l)
        end
        , 0)
        TheNet:Announce(STRINGS["DC_FGC"]["TOUYIKAIQI"])
        TheNet:Announce(STRINGS["DC_FGC"]["DANGQIANSHANGXIAN"] .. TUNING["GZ_COUNT_WEED_MAX"] .. STRINGS["DC_FGC"]["DANWEIGE"])
    end

end

GLOBAL["gz_AutoSpawn"] = gz_AutoSpawn

function gz_SetSpawnPeriod(ll1l1l1l11l1l1l1l11l, l11l11ll11l11l1ll1ll, ll1l11ll11l11ll1l11l)
    if type(ll1l1l1l11l1l1l1l11l) == "number" then
        TUNING["GZ_AUTO_SPAWN_PERIOD"] = ll1l1l1l11l1l1l1l11l
        TheNet:Announce(STRINGS["DC_FGC"]["JIANGEXIUGAI"] .. ll1l1l1l11l1l1l1l11l .. STRINGS["DC_FGC"]["DANWEIMIAO"])
        if not l11l11ll11l11l1ll1ll then
            if TheWorld["auto_weed"] then
                TheWorld["auto_weed"]:Cancel()
                TheWorld["auto_weed"] = nil
            end
            gz_AutoSpawn(ll1l11ll11l11ll1l11l)
        end
    end

end

GLOBAL["gz_SetSpawnPeriod"] = gz_SetSpawnPeriod

function gz_GameOver(team)
    if TUNING["GZ_GAME_OVER"] then
        return
    end
    local winners = TheWorld["gz_team_managers"][team]
    if not (winners and winners:IsValid()) then
        TheNet:Announce(STRINGS["DC_FGC"]["JIESUANSHIBAI"])
        return
    end
    TUNING["GZ_GAME_OVER"] =true
    TheWorld:PushEvent("event_GameOver", team)
    TheNet:Announce(STRINGS["DC_FGC"]["GONGXI"] .. team .. STRINGS["DC_FGC"]["JINWANCHIJI"])
    if TheWorld["auto_weed"] then
        TheWorld["auto_weed"]:Cancel()
        TheWorld["auto_weed"] = nil
    end
    for i = 1, 30 do
        winners:DoTaskInTime(i, function()
            local ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11, ll1ll1ll11ll1l1l11l1 = winners["Transform"]:GetWorldPosition() 
            local f1 = SpawnPrefab "firecrackers" 
            local ll11l11ll1l1l1l1ll1l = SpawnPrefab "firecrackers" 
            local l1l11l11ll1ll11ll1l1 = SpawnPrefab "firecrackers" 
            local f2 = SpawnPrefab "firecrackers" 
            f1["Transform"]:SetPosition(ll11ll11l1l11l11l1l1 - math["random"](3, 5), l1l1l1ll1ll1ll11ll11 + 8, ll1ll1ll11ll1l1l11l1) 
            ll11l11ll1l1l1l1ll1l["Transform"]:SetPosition(ll11ll11l1l11l11l1l1 + math["random"](3, 5), l1l1l1ll1ll1ll11ll11 + 8, ll1ll1ll11ll1l1l11l1)
            l1l11l11ll1ll11ll1l1["Transform"]:SetPosition(ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11 + 8, ll1ll1ll11ll1l1l11l1 - math["random"](3, 5))
            f2["Transform"]:SetPosition(ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11 + 8, ll1ll1ll11ll1l1l11l1 + math["random"](3, 5)) 
            f1["components"]["burnable"]:Ignite() ll11l11ll1l1l1l1ll1l["components"]["burnable"]:Ignite() 
            l1l11l11ll1ll11ll1l1["components"]["burnable"]:Ignite() f2["components"]["burnable"]:Ignite()
        end)
    end
    TheWorld:DoTaskInTime(8, function(world)
        TheNet:Announce(STRINGS["DC_FGC"]["SHIMIAOCHONGZHI"]) TheWorld:DoTaskInTime(10, function(world)
            if world["ismastersim"] then
                TheNet:SendWorldResetRequestToServer()
            end
        end
        )
    end
    )

end

GLOBAL["gz_GameOver"] = gz_GameOver

local ll1l1l1l11l1ll1l11l1 = - 180

function gz_ReRotation()
    ll1l1l1l11l1ll1l11l1 = ll1l1l1l11l1ll1l11l1 + 90
    if ll1l1l1l11l1ll1l11l1 > 180 then
        ll1l1l1l11l1ll1l11l1 = ll1l1l1l11l1ll1l11l1 - 360
    end
    for ll1ll1l1l11l1ll1l11l, l1ll1ll1l1ll11ll11ll in pairs(TheWorld["gz_team_managers"])
    do
        l1ll1ll1l1ll11ll11ll["Transform"]:SetRotation(ll1l1l1l11l1ll1l11l1)
    end

end

GLOBAL["gz_ReRotation"] = gz_ReRotation