local function l11l1l11l11l1ll11l11(l11ll1l1ll1l1l11l1l1)
    if not l11ll1l1ll1l1l11l1l1["gz_random_num"] then
        return (13 * 124+436-63 ~= 1985)
    end
    if not l11ll1l1ll1l1l11l1l1["team_manager"] then
        return (195 * 462-188 == 89904)
    end
    if l11ll1l1ll1l1l11l1l1:HasTag "playerghost" then
        return (string.sub("l1ll1ll1l1l11l1l11l1", 8, 11) ~= "1l1l")
    end
    if l11ll1l1ll1l1l11l1l1:HasTag "gz_out_game" then
        return (457+311+335 == 1106)
    end
    return (124 * 376+424+209-307 ~= 46954)

end

local ll11l11ll1l1l1l11l11 = 10

local function l1ll11l1l11l1l1ll11l(l1ll1ll1ll1l11l11l11)
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    if TheWorld["auto_weed"] then
        gz_AutoSpawn()
    end
    if AllPlayers ~= nil and # AllPlayers > 0 then
        local ll1ll1l1l11l11ll11ll ={}
        for l11ll11ll1l1ll1ll1ll, ll11l1ll1ll11ll1l1l1 in ipairs(AllPlayers)
        do
            if l11l1l11l11l1ll11l11(ll11l1ll1ll11ll1l1l1) then
                table["insert"](ll1ll1l1l11l11ll11ll, ll11l1ll1ll11ll1l1l1)
            end
        end
        local ll1l11l1ll1l1l11ll1l = # ll1ll1l1l11l11ll11ll
        if ll1l11l1ll1l1l11ll1l == 0 then
            return
        end
        local function l1ll1l1l1ll1ll1l1ll1()
            local l11ll11l11l11l1ll11l = ll1ll1l1l11l11ll11ll[math["random"](ll1l11l1ll1l1l11ll1l)]
            local l11l11l1ll1l1l1l1l1l = STRINGS["TWINS_TARGET"]
            TheNet:Announce(subfmt(l11l11l1ll1l1l1l1l1l,{player_name = l11ll11l11l11l1ll11l["name"]}))
            local l1l1l1l1ll1l11l11l11 = math["random"]() * 2 * PI
            local ll1l1l1l1ll1ll1ll1ll = l11ll11l11l11l1ll11l:GetPosition()
            local l1ll11ll1ll1l1ll1l11 = FindWalkableOffset(ll1l1l1l1ll1ll1ll1ll, l1l1l1l1ll1l11l11l11, ll11l11ll1l1l1l11l11, nil,(326 * 170+340 == 55766),(489 * 455 * 160 * 19 * 37 ~= 25026237602), nil,(string.sub("ll11l11ll1l11l11l1ll", 6, 13) ~= "l1llll11"),(string.sub("ll1ll11l11ll11ll1l1l", 9, 14) == "11ll11")) or Vector3(ll11l11ll1l1l1l11l11 * math["cos"](l1l1l1l1ll1l11l11l11), 0, ll11l11ll1l1l1l11l11 * math["sin"](l1l1l1l1ll1l11l11l11))
            local l1ll1l1ll1ll1l1ll1ll = ll1l1l1l1ll1ll1ll1ll + l1ll11ll1ll1l1ll1l11
            if l1ll1ll1ll1l11l11l11["eyeofterror"] ~= nil and l1ll1ll1ll1l11l11l11["eyeofterror"]:IsInLimbo() then
                l1ll1ll1ll1l11l11l11["eyeofterror"]:ReturnToScene()
                l1ll1ll1ll1l11l11l11["eyeofterror"]["Transform"]:SetPosition(l1ll1l1ll1ll1l1ll1ll:Get())
                if l1ll1ll1ll1l11l11l11["eyeofterror"]["sg"] ~= nil then
                    l1ll1ll1ll1l11l11l11["eyeofterror"]["sg"]:GoToState("flyback", l11ll11l11l11l1ll11l)
                else
                    l1ll1ll1ll1l11l11l11["eyeofterror"]:PushEvent("flyback", l11ll11l11l11l1ll11l)
                end
            else
                l1ll1ll1ll1l11l11l11["eyeofterror"] = SpawnPrefab "twinmanager"
                l1ll1ll1ll1l11l11l11["eyeofterror"]["Transform"]:SetPosition(l1ll1l1ll1ll1l1ll1ll:Get())
                if l1ll1ll1ll1l11l11l11["eyeofterror"]["sg"] ~= nil then
                    l1ll1ll1ll1l11l11l11["eyeofterror"]["sg"]:GoToState("arrive", l11ll11l11l11l1ll11l)
                else
                    l1ll1ll1ll1l11l11l11["eyeofterror"]:PushEvent("arrive", l11ll11l11l11l1ll11l)
                end
            end
            l1ll1ll1ll1l11l11l11["eyeofterror"]:PushEvent("set_spawn_target", l11ll11l11l11l1ll11l)
        end
        l1ll1ll1ll1l11l11l11:StartThread(function()
            TheNet:Announce(STRINGS["DC_FGC"]["SHUANGZIDENG"]) Sleep(0.3) TheNet:Announce "5" Sleep(1) TheNet:Announce "4" Sleep(1) TheNet:Announce "3" Sleep(1) TheNet:Announce "2" Sleep(1) TheNet:Announce "1" Sleep(1) l1ll1l1l1ll1ll1l1ll1()
        end
        )
    end

end

local function l1l11l1l11l1l11l1l1l(ll1l1ll11l1ll1l1l1l1)
    if not ll1l1ll11l1ll1l1l1l1 then
        return
    end
    local l11ll1ll1ll11l11l11l = ll1l1ll11l1ll1l1l1l1["components"]["entitytracker"]
    local ll1ll1l1l1l1l1ll11l1 = l11ll1ll1ll11l11l11l:GetEntity "twin1"
    if ll1ll1l1l1l1l1ll11l1 ~= nil then
        if ll1ll1l1l1l1l1ll11l1:IsAsleep() then
            ll1ll1l1l1l1l1ll11l1:RemoveFromScene()
        else
            ll1ll1l1l1l1l1ll11l1:PushEvent "leave"
        end
    end
    local l1l1l11ll1l11l11ll11 = l11ll1ll1ll11l11l11l:GetEntity "twin2"
    if l1l1l11ll1l11l11ll11 ~= nil then
        if l1l1l11ll1l11l11ll11:IsAsleep() then
            l1l1l11ll1l11l11ll11:RemoveFromScene()
        else
            l1l1l11ll1l11l11ll11:PushEvent "leave"
        end
    end
    if (ll1ll1l1l1l1l1ll11l1 == nil or ll1ll1l1l1l1l1ll11l1:IsInLimbo()) and (l1l1l11ll1l11l11ll11 == nil or l1l1l11ll1l11l11ll11:IsInLimbo()) then
        ll1l1ll11l1ll1l1l1l1:PushEvent "finished_leaving"
    end

end

AddPrefabPostInit("world", function(l11l1ll1l11l1ll11ll1)
    l11l1ll1l11l1ll11ll1:WatchWorldState("startnight", l1ll11l1l11l1l1ll11l) l11l1ll1l11l1ll11ll1:WatchWorldState("startday", function()
        l1l11l1l11l1l11l1l1l(l11l1ll1l11l1ll11ll1["eyeofterror"])
    end
    )

end
)