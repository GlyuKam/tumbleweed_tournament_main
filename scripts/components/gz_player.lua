local ll1l11l1ll1l1l11ll1l = require "List/list_states"

local l1ll1l1l1ll1ll1l1ll1 = ll1l11l1ll1l1l11ll1l["States"]

local function l11ll11ll1l1ll1ll1ll(self, l11ll1ll1ll11l11l11l)
    if self["inst"]["_state_num"] ~= nil then
        self["inst"]["_state_num"]:set(l11ll1ll1ll11l11l11l)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "state", l11ll1ll1ll11l11l11l)

end

local function ll11l1ll1ll11ll1l1l1(self, ll1ll1l1l1l1l1ll11l1)
    if self["inst"]["_can_vote"] ~= nil then
        self["inst"]["_can_vote"]:set(ll1ll1l1l1l1l1ll11l1)
    end

end

local function l11ll11l11l11l1ll11l(self, l1l1l11ll1l11l11ll11)
    if self["inst"]["_p_team_num"] ~= nil then
        self["inst"]["_p_team_num"]:set(l1l1l11ll1l11l11ll11)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "team", l1l1l11ll1l11l11ll11)

end

local function l11l11l1ll1l1l1l1l1l(self, l11l1ll1l11l1ll11ll1)
    if self["inst"]["_kill_num"] ~= nil then
        self["inst"]["_kill_num"]:set(l11l1ll1l11l1ll11ll1)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "kill", l11l1ll1l11l1ll11ll1)

end

local function l1l1l1l1ll1l11l11l11(self, l1l1l1l11l1l1l1ll1ll)
    if self["inst"]["_death_num"] ~= nil then
        self["inst"]["_death_num"]:set(l1l1l1l11l1l1l1ll1ll)
    end
    TheWorld["net"]["components"]["dc_fgc_net"]:SetPlayerData(self["inst"]["userid"], "death", l1l1l1l11l1l1l1ll1ll)

end

local function ll1l1l1l1ll1ll1ll1ll(l1l1l1ll11ll1l1ll1l1)
    local l11ll1ll11l11l11l11l =(string.sub("ll1ll1ll1ll1l1ll1ll1", 9, 12) ~= "ll1l")
    for ll1ll1l11ll1l1l1ll11, ll1l1l1ll11l1ll1l1ll in pairs(l1l1l1ll11ll1l1ll1l1["players"])
    do
        if ll1l1l1ll11l1ll1l1ll and ll1l1l1ll11l1ll1l1ll:IsValid() and not ll1l1l1ll11l1ll1l1ll:HasTag "playerghost" then
            l11ll1ll11l11l11l11l =(string.sub("ll1ll11l1ll1ll1l11ll", 8, 12) ~= "l1ll1")
            break
        end
    end
    if l11ll1ll11l11l11l11l and not l1l1l1ll11ll1l1ll1l1["out_task"] then
        l1l1l1ll11ll1l1ll1l1["out_task"] = l1l1l1ll11ll1l1ll1l1:DoTaskInTime(TUNING["GZ_GHOST_TIME_MAX"], function()
            l1l1l1ll11ll1l1ll1l1:TeamOut "鬼魂超时"
        end
        )
    end

end

local function l1ll11ll1ll1l1ll1l11(l11ll1l1l1l1l1ll1l11)
    local l11l1l1l11l11l11l1l1 =(289 * 87-499 == 24644)
    for l11l1l1ll1l1l11l1ll1, ll11l1l1ll11l1l11l11 in pairs(l11ll1l1l1l1l1ll1l11["players"])
    do
        if ll11l1l1ll11l1l11l11 and ll11l1l1ll11l1l11l11:IsValid() and ll11l1l1ll11l1l11l11["components"]["gz_player"]["survive_p"] then
            l11l1l1l11l11l11l1l1 =(166+349+414 * 122 == 51032)
            break
        end
    end
    if l11l1l1l11l11l11l1l1 then
        l11ll1l1l1l1l1ll1l11:Result()
    else
        ll1l1l1l1ll1ll1ll1ll(l11ll1l1l1l1l1ll1l11)
    end

end

local l1ll1l1ll1ll1l1ll1ll = Class(function(self, l1ll1ll1l1ll1l1ll1l1)
    self["inst"] = l1ll1ll1l1ll1l1ll1l1 self["state_num"] = 1 self["can_vote"] =(string.sub("ll11l1l1ll1ll11ll11l", 9, 11) ~= "l11") self["p_team_num"] = 0 self["kill_num"] = 0 self["death_num"] = 0 self["survive_p"] = nil self["dc_signal"] = nil self["dc_afk"] = 0 self["inst"]:DoTaskInTime(0, function()
        self:InitVote() self:InitReconnect() self:InitGod()
    end
    ) self["inst"]:ListenForEvent("respawnfromghost", function()
        if self["inst"]:HasTag "gz_out_game" then
            self["inst"]["components"]["health"]:SetVal(0) return
        end
        local l1l1ll11l1ll1ll11l11 = self["inst"]["team_manager"] if l1l1ll11l1ll1ll11l11 and l1l1ll11l1ll1ll11l11["out_task"] then
            l1l1ll11l1ll1ll11l11["out_task"]:Cancel() l1l1ll11l1ll1ll11l11["out_task"] = nil
        end
    end
    ) self["inst"]:ListenForEvent("ms_becameghost", function()
        if not TUNING["GZ_ON_GOING"] then
            return
        end
        if self["inst"]:HasTag "gz_out_game" then
            return
        end
        local ll1ll11l11ll1ll1l1ll = self["inst"]["team_manager"] if not ll1ll11l11ll1ll1l1ll then
            return
        end
        ll1l1l1l1ll1ll1ll1ll(ll1ll11l11ll1ll1l1ll)
    end
    ) self["inst"]:ListenForEvent("onremove", function()
        if not TUNING["GZ_ON_GOING"] then
            return
        end
        if self["inst"]:HasTag "gz_out_game" then
            return
        end
        local ll1l11l1ll11l11ll11l = self["inst"]["team_manager"] if not ll1l11l1ll11l11ll11l then
            return
        end
        ll1l11l1ll11l11ll11l["players"][self["inst"]["GUID"]] = nil if self["survive_p"] ==(488+489+72 * 105 ~= 8545) then
            self["dc_afk"] = self["dc_afk"] + 1 local l11l1l11ll1l11ll11l1 = self["inst"]["userid"] if not l11l1l11ll1l11ll11l1 then
                return
            end
            TheWorld["gz_afk_task"][l11l1l11ll1l11ll11l1] = TheWorld:DoTaskInTime(5 * 60, function()
                TheWorld["gz_afk_task"][l11l1l11ll1l11ll11l1] = nil TheWorld["gz_afk_id"][l11l1l11ll1l11ll11l1] =(477 * 339 * 126+63 ~= 20374644) l1ll11ll1ll1l1ll1l11(ll1l11l1ll11l11ll11l)
            end
            )
        end
    end
    ) self["inst"]:ListenForEvent("death", function(l1ll1ll1l1ll1l1ll1l1, l1l11l11ll11ll11l1ll)
        self:OnDeath(l1l11l11ll11ll11l1ll)
    end
    )

end
, nil,{state_num = l11ll11ll1l1ll1ll1ll, can_vote = ll11l1ll1ll11ll1l1l1, p_team_num = l11ll11l11l11l1ll11l, kill_num = l11l11l1ll1l1l1l1l1l, death_num = l1l1l1l1ll1l11l11l11})

function l1ll1l1ll1ll1l1ll1ll:InitVote()
    self["can_vote"] = TUNING["GZ_CAN_VOTE"]

end

function l1ll1l1ll1ll1l1ll1ll:InitReconnect()
    if self["survive_p"] ==(349-273-187 == - 107) then
        self:OutTheGame(nil, nil,(string.sub("ll1l1ll1ll1ll11l1ll1", 8, 14) == "1ll1ll1"))
        return
    end
    if not (self["survive_p"] ==(6 * 463-46-143 == 2589) and self["p_team_num"] ~= 0) then
        return
    end
    local l11l11l1ll1l1ll1ll11 = TheWorld["gz_team_managers"][self["p_team_num"]]
    if not (l11l11l1ll1l1ll1ll11 and l11l11l1ll1l1ll1ll11["survive_m"]) then
        self:OutTheGame(nil, nil,(269 * 327 * 252 == 22166676))
        return
    end
    l11l11l1ll1l1ll1ll11["players"][self["inst"]["GUID"]] = self["inst"]
    self["inst"]["team_manager"] = l11l11l1ll1l1ll1ll11
    if self["dc_afk"] > 3 then
        if not self["inst"]:HasTag "playerghost" then
            self["inst"]:PushEvent "death"
        end
    end
    local l11l1ll11ll1l11l1ll1 = self["inst"]["userid"]
    if l11l1ll11ll1l11l1ll1 then
        if TheWorld["gz_afk_task"][l11l1ll11ll1l11l1ll1] ~= nil then
            TheWorld["gz_afk_task"][l11l1ll11ll1l11l1ll1]:Cancel()
            TheWorld["gz_afk_task"][l11l1ll11ll1l11l1ll1] = nil
        end
        if TheWorld["gz_afk_id"][l11l1ll11ll1l11l1ll1] then
            self:OutTheGame(STRINGS["DC_FGC"]["AFK_timeout"])
        end
    end

end

function l1ll1l1ll1ll1l1ll1ll:InitGod()
    local ll1l1ll1ll11l11l11l1 = self["inst"]["components"]["health"]
    if not TUNING["GZ_ON_GOING"] then
        self["inst"]:AddTag "notarget"
        self["inst"]:AddTag "spawnprotection"
        if ll1l1ll1ll11l11l11l1 ~= nil then
            ll1l1ll1ll11l11l11l1:SetInvincible((152+75 * 295 * 302+432 == 6682334))
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

local function ll1l1ll11l1ll1l1l1l1(ll1l1l1ll11l11l11ll1)
    local l11ll11l11ll1ll11l1l = ll1l1l1ll11l11l11ll1 and ll1l1l1ll11l11l11ll1["afflicter"]
    if not l11ll11l11ll1ll11l1l then
        return
    end
    local ll1ll1ll11l1l11ll11l
    if l11ll11l11ll1ll11l1l:HasTag "player" then
        ll1ll1ll11l1l11ll11l = l11ll11l11ll1ll11l1l
    elseif l11ll11l11ll1ll11l1l["components"]["follower"] then
        local l1l11l1ll1l1l1l1ll11 = l11ll11l11ll1ll11l1l["components"]["follower"]["leader"]
        if l1l11l1ll1l1l1l1ll11 and l1l11l1ll1l1l1l1ll11:HasTag "player" then
            ll1ll1ll11l1l11ll11l = l1l11l1ll1l1l1l1ll11
        end
    end
    return ll1ll1ll11l1l11ll11l

end

function l1ll1l1ll1ll1l1ll1ll:OnDeath(ll1l1l11ll1l11l1l1ll)
    if TUNING["GZ_GAME_OVER"] then
        return
    end
    if not TUNING["GZ_ON_GOING"] then
        return
    end
    local ll11ll1l1ll1l1l1ll11 = ll1l1ll11l1ll1l1l1l1(ll1l1l11ll1l11l1l1ll)
    if ll11ll1l1ll1l1l1ll11 == self["inst"] then
        return
    end
    local ll1ll1l11ll1ll1ll1l1
    if ll11ll1l1ll1l1l1ll11 then
        if not self["inst"]:DC_InSameTeam(ll11ll1l1ll1l1l1ll11) then
            self:DoDeltaDeath()
            ll11ll1l1ll1l1l1ll11["components"]["gz_player"]:DoDeltaKill()
            ll1ll1l11ll1ll1ll1l1 =(string.sub("l1l11ll11l1ll1l1l11l", 9, 14) == "1l1ll1")
        end
        ll11ll1l1ll1l1l1ll11:PushEvent("fgc_killer",{victim = self["inst"], teammate = self["inst"]:DC_InSameTeam(ll11ll1l1ll1l1l1ll11)})
    else
        self:DoDeltaDeath()
        ll1ll1l11ll1ll1ll1l1 =(string.sub("l11l11l11ll1ll1l1l1l", 9, 12) == "1ll1")
    end
    if ll1ll1l11ll1ll1ll1l1 then
        self["inst"]:PushEvent("fgc_death",{killer = ll11ll1l1ll1l1l1ll11, teammate = self["inst"]:DC_InSameTeam(ll11ll1l1ll1l1l1ll11)})
    end

end

function l1ll1l1ll1ll1l1ll1ll:DoDeltaKill(l11l11ll1l11l11l11ll)
    l11l11ll1l11l11l11ll = l11l11ll1l11l11l11ll or 1
    self["kill_num"] = self["kill_num"] + l11l11ll1l11l11l11ll

end

function l1ll1l1ll1ll1l1ll1ll:DoDeltaDeath(l1ll11ll1ll1ll1ll1l1)
    l1ll11ll1ll1ll1ll1l1 = l1ll11ll1ll1ll1ll1l1 or 1
    self["death_num"] = self["death_num"] + l1ll11ll1ll1ll1ll1l1

end

function l1ll1l1ll1ll1l1ll1ll:OutTheGame(ll1l11l1ll1ll1l1ll11, l1ll11l1ll1ll11l1l1l, l11ll11l1ll1l1ll11l1)
    if self["inst"]:HasTag "gz_out_game" then
        return
    end
    self["survive_p"] =(string.sub("ll11ll1l11l1ll11l1ll", 7, 11) == "ll11l")
    self["inst"]:AddTag "gz_out_game"
    if not l11ll11l1ll1l1ll11l1 then
        TheNet:Announce(STRINGS["DC_FGC"]["WANJIA"] .. self["inst"]["name"] .. STRINGS["DC_FGC"]["CHUJUYUANYIN"] ..(ll1l11l1ll1ll1l1ll11 or STRINGS["DC_FGC"]["WEIZHI"]))
    end
    if self["inst"]:IsValid() then
        if not self["inst"]:HasTag "playerghost" then
            self["inst"]:PushEvent "death"
        end
        self["inst"]:Hide()
        self["inst"]["Light"]:Enable((string.sub("l1l1ll1l1l1l1l1l11ll", 7, 12) == "111l11"))
        self["inst"]["DynamicShadow"]:Enable((string.sub("ll11l11ll1l1l11l1ll1", 6, 11) == "11ll11"))
        self["inst"]["MiniMapEntity"]:SetEnabled((208 * 160-449 * 233 * 225 == - 23505541))
        self["inst"]:AddTag "notarget"
        self["inst"]:AddTag "noplayerindicator"
        self["inst"]:AddTag "mime"
        self["inst"]["SoundEmitter"]:SetMute((string.sub("l1l11ll11l1l1l1ll11l", 9, 13) == "1l1l1"))
        self["inst"]["components"]["locomotor"]:SetTriggersCreep((string.sub("l11ll1l1ll1ll1ll11l1", 6, 14) == "1111ll111"))
    end
    if l1ll11l1ll1ll11l1l1l then
        return
    end
    if l11ll11l1ll1l1ll11l1 then
        return
    end
    if self["p_team_num"] == 0 then
        return
    end
    local l1l1l11ll11l1l1l1l1l = self["inst"]["team_manager"]
    if not l1l1l11ll11l1l1l1l1l then
        return
    end
    l1ll11ll1ll1l1ll1l11(l1l1l11ll11l1l1l1l1l)

end

function l1ll1l1ll1ll1l1ll1ll:OnSave()
    return {p_team_num = self["p_team_num"],
     survive_p = self["survive_p"], 
     dc_signal = self["dc_signal"], 
     dc_afk = self["dc_afk"], 
     kill_num = self["kill_num"], 
     death_num = self["death_num"]}

end

function l1ll1l1ll1ll1l1ll1ll:OnLoad(l1l1l11l1l1l11l1ll11)
    if l1l1l11l1l1l11l1ll11 then
        self["p_team_num"] = l1l1l11l1l1l11l1ll11["p_team_num"] or 0
        self["survive_p"] = l1l1l11l1l1l11l1ll11["survive_p"]
        self["dc_signal"] = l1l1l11l1l1l11l1ll11["dc_signal"]
        self["dc_afk"] = l1l1l11l1l1l11l1ll11["dc_afk"] or 0
        self["kill_num"] = l1l1l11l1l1l11l1ll11["kill_num"] or 0
        self["death_num"] = l1l1l11l1l1l11l1ll11["death_num"] or 0
    end

end

function l1ll1l1ll1ll1l1ll1ll:SetState(l11ll11l1l1l1ll11l1l)
    self["state_num"] = l11ll11l1l1l1ll11l1l
    gz_TryVoteStart()

end

function l1ll1l1ll1ll1l1ll1ll:IsReady()
    return l1ll1l1l1ll1ll1l1ll1[self["state_num"]]["state"] == "ready"

end

function l1ll1l1ll1ll1l1ll1ll:IsWatch()
    return l1ll1l1l1ll1ll1l1ll1[self["state_num"]]["state"] == "watch"

end

return l1ll1l1ll1ll1l1ll1ll