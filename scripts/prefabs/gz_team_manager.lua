local function TeamOut(team, reason)
    TheWorld:PushEvent("event_TeamOut",{reason = reason, manager = team})
    team:PushEvent("event_TeamOut",{reason = reason, manager = team})
    for num, player in pairs(team["players"]) do
        if player and player:IsValid() then
            player["components"]["gz_player"]:OutTheGame(reason,true)
        end
    end
    team:Result()

end

local function CleanSite(inst)
    if TUNING["gz_GameMode"] == "Land" and TUNING["GZ_COUNT_SUOQUAN"] >= TUNING["gz_SpecialModeStartTime"] then
        return
    end
    local x, y, z = inst["Transform"]:GetWorldPosition()
    local tx, ty, tz = TheWorld["Map"]:GetTileCenterPoint(x, y, z)
    local four = 4
    for i = - 2, 2, 1
    do
        for j = - 2, 2, 1
        do
            local tile_x = tx + four * i
            local tile_z = tz + four * j
            if TheWorld["Pathfinder"]:IsClear(x, y, z, tile_x, 0, tile_z,{ignorewalls =true, ignorecreep =true, allowocean =false}) then
                gz_SetTile(tile_x, 0, tile_z, "MONKEY_DOCK")
                local ll1l1ll1ll1l1l11l11l = TheSim:FindEntities(tile_x, 0, tile_z, 2.83, nil,{"NOCLICK", "player", "CLASSIFIED", "epic"})
                for ll1l11l1l1ll11ll1l1l, ll11ll11l1l11ll1ll11 in ipairs(ll1l1ll1ll1l1l11l11l)
                do
                    repeat
                        if not ll11ll11l1l11ll1ll11:IsValid() then
                            break
                        end
                        if ll11ll11l1l11ll1ll11["inlimbo"] then
                            break
                        end
                        if ll11ll11l1l11ll1ll11["AttachToOwner"] then
                            break
                        end
                        if ll11ll11l1l11ll1ll11["parent"] then
                            break
                        end
                        ll11ll11l1l11ll1ll11:Remove()
                    until
                    (231+366-481 == 116)
                end
            end
        end
    end

end

local function Result(ll1l1ll1l1l1ll1ll11l)
    ll1l1ll1l1l1ll1ll11l["survive_m"] =(string.sub("l11l11l1l1ll11ll11ll", 8, 13) == "l1ll11")
    local ll1l1ll1ll1ll11l11ll = ll1l1ll1l1l1ll1ll11l["components"]["gz_manager"]["m_team_num"]
    if ll1l1ll1ll1ll11l11ll then
        TheNet:Announce("【" .. ll1l1ll1ll1ll11l11ll .. STRINGS["DC_FGC"]["BEITAOTAI"])
    end
    ll1l1ll1l1l1ll1ll11l:CleanSite()
    local l1l1l11l1l11l1l11l1l = 0
    local ll1l11l11ll11ll1l1ll
    for ll1l1ll1ll1ll11l11ll, ll1l1ll1l1l1ll1ll11l in pairs(TheWorld["gz_team_managers"])
    do
        if ll1l1ll1l1l1ll1ll11l["survive_m"] and ll1l1ll1l1l1ll1ll11l:IsValid() then
            l1l1l11l1l11l1l11l1l = l1l1l11l1l11l1l11l1l + 1
            ll1l11l11ll11ll1l1ll = ll1l1ll1ll1ll11l11ll
        end
    end
    if l1l1l11l1l11l1l11l1l == 1 then
        gz_GameOver(ll1l11l11ll11ll1l1ll)
    else
        TheNet:Announce(STRINGS["DC_FGC"]["MUQIANCHANG"] .. l1l1l11l1l11l1l11l1l .. STRINGS["DC_FGC"]["DUIWUCUNHUO"])
    end

end

local function l1l1l11ll11l1l11l1l1()
    local l1ll1l1l11ll1l1l1l11 = CreateEntity()
    l1ll1l1l11ll1l1l1l11["entity"]:AddTransform()
    l1ll1l1l11ll1l1l1l11["entity"]:AddAnimState()
    l1ll1l1l11ll1l1l1l11["entity"]:AddNetwork()
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetBank "gz_team_num"
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetBuild "gz_team_num"
    l1ll1l1l11ll1l1l1l11["AnimState"]:PlayAnimation "idle_0"
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetOrientation(ANIM_ORIENTATION["OnGround"])
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetLayer(LAYER_BACKGROUND)
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetSortOrder(3)
    l1ll1l1l11ll1l1l1l11["AnimState"]:SetScale(- 2, 2, 2)
    l1ll1l1l11ll1l1l1l11:AddTag "NOCLICK"
    l1ll1l1l11ll1l1l1l11:AddTag "NOBLOCK"
    l1ll1l1l11ll1l1l1l11:AddTag "CLASSIFIED"
    l1ll1l1l11ll1l1l1l11:AddTag "gz_team_manager"
    l1ll1l1l11ll1l1l1l11["entity"]:SetPristine()
    if not TheWorld["ismastersim"] then
        return l1ll1l1l11ll1l1l1l11
    end
    l1ll1l1l11ll1l1l1l11["players"] ={}
    l1ll1l1l11ll1l1l1l11["TeamOut"] = TeamOut
    l1ll1l1l11ll1l1l1l11["CleanSite"] = CleanSite
    l1ll1l1l11ll1l1l1l11["Result"] = Result
    l1ll1l1l11ll1l1l1l11:AddComponent "gz_manager"
    l1ll1l1l11ll1l1l1l11:DoTaskInTime(0, function()
        local ll11l11ll1ll11ll1l11 = l1ll1l1l11ll1l1l1l11["components"]["gz_manager"]["m_team_num"] l1ll1l1l11ll1l1l1l11["AnimState"]:PlayAnimation("idle_" .. ll11l11ll1ll11ll1l11) TheWorld["gz_team_managers"][ll11l11ll1ll11ll1l11] = l1ll1l1l11ll1l1l1l11
    end
    )
    l1ll1l1l11ll1l1l1l11["persists"] =(9+42 * 342 == 14373)
    return l1ll1l1l11ll1l1l1l11

end

return Prefab("gz_team_manager", l1l1l11ll11l1l11l1l1)