local list_states = require "List/list_states"

local states = list_states["States"]

local function set_state_num(self, _state_num)
    if self["inst"]["_state_num"] ~= nil then
        self["inst"]["_state_num"]:set(_state_num)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "state", _state_num)

end

local function set_can_vote(self, _can_vote)
    if self["inst"]["_can_vote"] ~= nil then
        self["inst"]["_can_vote"]:set(_can_vote)
    end

end

local function set_p_teamnum(self, _p_team_num)
    if self["inst"]["_p_team_num"] ~= nil then
        self["inst"]["_p_team_num"]:set(_p_team_num)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "team", _p_team_num)

end

local function set_killnum(self, _kill_num)
    if self["inst"]["_kill_num"] ~= nil then
        self["inst"]["_kill_num"]:set(_kill_num)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "kill", _kill_num)

end

local function set_deathnum(self, _death_num)
    if self["inst"]["_death_num"] ~= nil then
        self["inst"]["_death_num"]:set(_death_num)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "death", _death_num)

end

local function DestroyTeamInTime(team_manager)
    local should_kill =true
    for _, player in pairs(team_manager["players"]) do
        if player and player:IsValid() and not player:HasTag "playerghost" then
            should_kill = false
            break
        end
    end
    if should_kill and not team_manager["out_task"] then
        team_manager["out_task"] = team_manager:DoTaskInTime(TUNING["GZ_GHOST_TIME_MAX"], function()
            team_manager:TeamOut "шкебоб"
        end
        )
    end

end

local function kill_team(team_manager)
    local should_kill =true
    for _, player in pairs(team_manager["players"])
    do
        if player and player:IsValid() and player["components"]["gz_player"]["survive_p"] then
            should_kill =false
            break
        end
    end
    if should_kill then
        team_manager:Result()
    else
        DestroyTeamInTime(team_manager)
    end

end

local gz_player = Class(function(self, inst)
    self["inst"] = inst 
    self["state_num"] = 1 
    self["can_vote"] =true
    self["p_team_num"] = 0 
    self["kill_num"] = 0 
    self["death_num"] = 0 
    self["survive_p"] = nil 
    self["dc_signal"] = nil 
    self["dc_afk"] = 0 
    self["inst"]:DoTaskInTime(0, function()
        self:InitVote() self:InitReconnect() self:InitGod()
    end
    ) self["inst"]:ListenForEvent("respawnfromghost", function()
        if self["inst"]:HasTag "gz_out_game" then
            self["inst"]["components"]["health"]:SetVal(0) return
        end
        local team_manager = self["inst"]["team_manager"] 
        if team_manager and team_manager["out_task"] then
            team_manager["out_task"]:Cancel() 
            team_manager["out_task"] = nil
        end
    end
    ) self["inst"]:ListenForEvent("ms_becameghost", function()
        if not TUNING["GZ_ON_GOING"] then
            return
        end
        if self["inst"]:HasTag "gz_out_game" then
            return
        end
        local team_manager = self["inst"]["team_manager"] 
        if not team_manager then
            return
        end
        DestroyTeamInTime(team_manager)
    end
    ) self["inst"]:ListenForEvent("onremove", function()
        if not TUNING["GZ_ON_GOING"] then
            return
        end
        if self["inst"]:HasTag "gz_out_game" then
            return
        end
        local team_manager = self["inst"]["team_manager"] 
        if not team_manager then
            return
        end
        team_manager["players"][self["inst"]["GUID"]] = nil 
        if self["survive_p"] ==true then
            self["dc_afk"] = self["dc_afk"] + 1 
            local userid = self["inst"]["userid"] 
            if not userid then
                return
            end
            TheWorld["gz_afk_task"][userid] = TheWorld:DoTaskInTime(5 * 60, function()
                TheWorld["gz_afk_task"][userid] = nil 
                TheWorld["gz_afk_id"][userid] =true
                kill_team(team_manager)
            end
            )
        end
    end
    ) self["inst"]:ListenForEvent("death", function(inst, afflicter)
        self:OnDeath(afflicter)
    end
    )

end
, nil,{state_num = set_state_num, can_vote = set_can_vote, p_team_num = set_p_teamnum, kill_num = set_killnum, death_num = set_deathnum})

function gz_player:InitVote()
    self["can_vote"] = TUNING["GZ_CAN_VOTE"]

end

function gz_player:InitReconnect()
    if self["survive_p"] ==false then
        self:OutTheGame(nil, nil,true)
        return
    end
    if not (self["survive_p"] ==false and self["p_team_num"] ~= 0) then
        return
    end
    local team = TheWorld["gz_team_managers"][self["p_team_num"]]
    if not (team and team["survive_m"]) then
        self:OutTheGame(nil, nil,true)
        return
    end
    if team then
        team["players"][self["inst"]["GUID"]] = self["inst"]
        self["inst"]["team_manager"] = team
    end
    if self["dc_afk"] > 3 then
        if not self["inst"]:HasTag "playerghost" then
            self["inst"]:PushEvent "death"
        end
    end
    local userid = self["inst"]["userid"]
    if userid then
        if TheWorld["gz_afk_task"][userid] ~= nil then
            TheWorld["gz_afk_task"][userid]:Cancel()
            TheWorld["gz_afk_task"][userid] = nil
        end
        if TheWorld["gz_afk_id"][userid] then
            self:OutTheGame(STRINGS["DC_FGC"]["AFK_timeout"])
        end
    end

end

function gz_player:InitGod()
    local health = self["inst"]["components"]["health"]
    if not TUNING["GZ_ON_GOING"] then
        self["inst"]:AddTag "notarget"
        self["inst"]:AddTag "spawnprotection"
        if health ~= nil then
            health:SetInvincible((152+75 * 295 * 302+432 == 6682334))
        end
    else
        if self["p_team_num"] == 0 then
            self["inst"]:gz_RemoveAllItem()
            if not self["inst"]:HasTag "playerghost" then
                self["inst"]:PushEvent "death"
            end
            self["inst"]:DoTaskInTime(1, function()
                self:OutTheGame(STRINGS["DC_FGC"]["ZHONGTUJIARU"])
            end
            )
        end
    end

end

local function IsKiller(player)
    local killer = player and player["afflicter"]
    if not killer then
        return
    end
    local _killer
    if killer:HasTag "player" then
        _killer = killer
    elseif killer["components"]["follower"] then
        local follower_killer = killer["components"]["follower"]["leader"]
        if follower_killer and follower_killer:HasTag "player" then
            _killer = follower_killer
        end
    end
    return _killer

end

function gz_player:OnDeath(player)
    if TUNING["GZ_GAME_OVER"] then
        return
    end
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    local _killer = IsKiller(player)
    if _killer == self["inst"] then
        return
    end
    local prikol
    if _killer then
        if not self["inst"]:DC_InSameTeam(_killer) then
            self:DoDeltaDeath()
            _killer["components"]["gz_player"]:DoDeltaKill()
            prikol =true
        end
        _killer:PushEvent("fgc_killer",{victim = self["inst"], teammate = self["inst"]:DC_InSameTeam(_killer)})
    else
        self:DoDeltaDeath()
        prikol =true
    end
    if prikol then
        self["inst"]:PushEvent("fgc_death",{killer = _killer, teammate = self["inst"]:DC_InSameTeam(_killer)})
    end

end

function gz_player:DoDeltaKill(player)
    player = player or 1
    self["kill_num"] = self["kill_num"] + player

end

function gz_player:DoDeltaDeath(player)
    player = player or 1
    self["death_num"] = self["death_num"] + player

end

function gz_player:OutTheGame(msg, idk, tr_fal)
    if self["inst"]:HasTag "gz_out_game" then
        return
    end
    self["survive_p"] =false
    self["inst"]:AddTag "gz_out_game"
    if not tr_fal then
        TheNet:Announce(STRINGS["DC_FGC"]["WANJIA"] .. self["inst"]["name"] .. STRINGS["DC_FGC"]["CHUJUYUANYIN"] ..(msg or STRINGS["DC_FGC"]["WEIZHI"]))
    end
    if self["inst"]:IsValid() then
        if not self["inst"]:HasTag "playerghost" then
            self["inst"]:PushEvent "death"
        end
        self["inst"]:Hide()
        self["inst"]["Light"]:Enable(false)
        self["inst"]["DynamicShadow"]:Enable(false)
        self["inst"]["MiniMapEntity"]:SetEnabled(false)
        self["inst"]:AddTag "notarget"
        self["inst"]:AddTag "noplayerindicator"
        self["inst"]:AddTag "mime"
        self["inst"]["SoundEmitter"]:SetMute(true)
        self["inst"]["components"]["locomotor"]:SetTriggersCreep(false)
    end
    if idk then
        return
    end
    if tr_fal then
        return
    end
    if self["p_team_num"] == 0 then
        return
    end
    local team_manager = self["inst"]["team_manager"]
    if not team_manager then
        return
    end
    kill_team(team_manager)

end

function gz_player:OnSave()
    return {p_team_num = self["p_team_num"],
     survive_p = self["survive_p"], 
     dc_signal = self["dc_signal"], 
     dc_afk = self["dc_afk"], 
     kill_num = self["kill_num"], 
     death_num = self["death_num"]}

end

function gz_player:OnLoad(data)
    if data then
        self["p_team_num"] = data["p_team_num"] or 0
        self["survive_p"] = data["survive_p"]
        self["dc_signal"] = data["dc_signal"]
        self["dc_afk"] = data["dc_afk"] or 0
        self["kill_num"] = data["kill_num"] or 0
        self["death_num"] = data["death_num"] or 0
    end

end

function gz_player:SetState(state_num)
    self["state_num"] = state_num
    gz_TryVoteStart()

end

function gz_player:IsReady()
    return states[self["state_num"]]["state"] == "ready"

end

function gz_player:IsWatch()
    return states[self["state_num"]]["state"] == "watch"

end

return gz_player