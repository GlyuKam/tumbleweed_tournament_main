local stateslist = require "List/list_states"

local states = stateslist["States"]

local team_colors = require "List/list_team_colors"

local upvaluehacker = require "util/fgc_upvaluehelper"

local btn_select = require "widgets/btn_select"

AddClassPostConstruct("widgets/controls", function(self)
    self["btn_select"] = self["bottom_root"]:AddChild(btn_select(self["owner"])) self["btn_select"]:SetPosition(0, 100, 0)

end
)

local function IsInSameTeam(player1, player)
    if not (player and player:HasTag "player") then
        return false
    end
    if player1["components"]["gz_player"] and player["components"]["gz_player"] then
        local team_num = player1["components"]["gz_player"]["p_team_num"]
        if team_num ~= 0 and team_num == player["components"]["gz_player"]["p_team_num"] then
            return true
        end
    end
    if player1["_p_team_num"] and player["_p_team_num"] then
        local team_number = player1["_p_team_num"]:value()
        if team_number ~= 0 and team_number == player["_p_team_num"]:value() then
            return true
        end
    end
    return false

end

local function SetLabel(player)
    local team_name = player["_p_team_num"]:value()
    local text = string["format"]("[%d]%s", team_name, player["name"])
    player["Label"]:SetText(text)
    local colors = team_colors[team_name + 1]
    player["Label"]:SetColour(colors[1], colors[2], colors[3])

end

AddPlayerPostInit(function(player)
    player["DC_InSameTeam"] = IsInSameTeam 
    player["_state_num"] = net_tinybyte(player["GUID"], "dc._state_num", "dirty_state_num") 
    player["_can_vote"] = net_bool(player["GUID"], "dc._can_vote", "dirty_can_vote") 
    player["_p_team_num"] = net_smallbyte(player["GUID"], "dc._p_team_num", "dirty_p_team_num") 
    player["_kill_num"] = net_byte(player["GUID"], "dc._kill_num", "dirty_kill_num") 
    player["_death_num"] = net_byte(player["GUID"], "dc._death_num", "dirty_death_num") 
    player["entity"]:AddLabel() 
    player["Label"]:SetFontSize(18) 
    player["Label"]:SetFont(BODYTEXTFONT) 
    player["Label"]:SetWorldOffset(0, 2.61, 0) 
    player["Label"]:SetColour(255 / 255, 255 / 255, 255 / 255) 
    player["Label"]:Enable(TUNING["GZ_ShowName"]) 
    if not TheNet:IsDedicated() then
        player["DC_SetLabel"] = SetLabel 
        player:DoTaskInTime(0, function()
            player:DC_SetLabel() player:ListenForEvent("dirty_p_team_num", player["DC_SetLabel"]) 
            player:ListenForEvent("gz_screen_heights", function(_, idk)
                local screen_heights = 30 / idk["screen_heights"] 
                player["Label"]:SetFontSize(8 * screen_heights) 
                if player:HasTag "corpse" then
                    player["Label"]:SetWorldOffset(0, 1.61, 0)
                elseif player:HasTag "playerghost" then
                    player["Label"]:SetWorldOffset(0, 3.61, 0)
                elseif player["replica"]["rider"] and player["replica"]["rider"]:IsRiding() then
                    player["Label"]:SetWorldOffset(0, 4.61, 0)
                else
                    player["Label"]:SetWorldOffset(0, 2.61, 0)
                end
            end
            , ThePlayer)
        end
        )
    end

end
)

AddClassPostConstruct("cameras/followcamera", function(self)
    local ll1ll1l11ll1ll11l1l1 = self["Apply"] function self:Apply(...)
        local ll1l1l1l11l1ll1l11l1 = ll1ll1l11ll1ll11l1l1(self, ...) if ThePlayer then
            ThePlayer:PushEvent("gz_screen_heights",{screen_heights = math["tan"](self["fov"] * .5 * DEGREES) * self["distance"] * 1.03})
        end
        return ll1l1l1l11l1ll1l11l1
    end

end
)

AddStategraphPostInit("wilsonghost", function(stategraph)
    local haunt_pre = stategraph["states"]["haunt_pre"] 
    local old_onenter = haunt_pre["onenter"] 
    haunt_pre["onenter"] = function(player, ...)
        if player:HasTag "gz_out_game" then
            player["sg"]:GoToState "idle"
        else
            return old_onenter(player, ...)
        end
    end

end
)

AddStategraphPostInit("wilsonghost_client", function(stategraph)
    local haunt_pre = stategraph["states"]["haunt_pre"] 
    local old_onenter = haunt_pre["onenter"]
    haunt_pre["onenter"] = function(player, ...)
        if player:HasTag "gz_out_game" then
            player["sg"]:GoToState "idle"
        else
            return old_onenter(player, ...)
        end
    end

end
)

local component_actions = upvaluehacker["Get"](EntityScript["CollectActions"], "COMPONENT_ACTIONS")

if component_actions and component_actions["SCENE"] then
    local l11ll1ll1l1l11l11l1l = component_actions["SCENE"]["hauntable"]
    component_actions["SCENE"]["hauntable"] = function(l1ll1l11ll1l1ll1ll1l, l11ll1ll11l11ll11ll1, component_actions, ...)
        if l11ll1ll11l11ll11ll1 and l11ll1ll11l11ll11ll1:HasTag "gz_out_game" then
            return
        end
        return l11ll1ll1l1l11l11l1l(l1ll1l11ll1l1ll1ll1l, l11ll1ll11l11ll11ll1, component_actions, ...)
    end

end

local ll1ll1l11l1ll1l1l11l = require "worldsettings_overrides"

if ll1ll1l11l1ll1l1l11l and ll1ll1l11l1ll1l1l11l["Post"] then
    local l1l11l1ll1l11l11ll1l ={spawnmode = function(l1l1ll1l11l11ll1l1l1)
        l1l1ll1l11l11ll1l1l1 = "fixed" TheWorld:PushEvent("ms_setworldsetting",{setting = "spawn_mode", value = l1l1ll1l11l11ll1l1l1}) TheWorld:PushEvent("ms_setspawnmode", l1l1ll1l11l11ll1l1l1)
    end
    , ghostenabled = function(ll11l1l11ll1ll1ll1l1)
        ll11l1l11ll1ll1ll1l1 = "always" ll11l1l11ll1ll1ll1l1 = ll11l1l11ll1ll1ll1l1 == "always" TheWorld:PushEvent("ms_setworldsetting",{setting = "ghost_enabled", value = ll11l1l11ll1ll1ll1l1})
    end
    , portalresurection = function(l11l1l11ll1l1ll11l11)
        l11l1l11ll1l1ll11l11 = "none" l11l1l11ll1l1ll11l11 = l11l1l11ll1l1ll11l11 == "always" TheWorld:PushEvent("ms_setworldsetting",{setting = "portal_rez", value = l11l1l11ll1l1ll11l11}) TheWorld:PushEvent("ms_onportalrez", l11l1l11ll1l1ll11l11)
    end
    , ghostsanitydrain = function(l1ll1l1ll11l11ll1ll1)
        l1ll1l1ll11l11ll1ll1 = "none" l1ll1l1ll11l11ll1ll1 = l1ll1l1ll11l11ll1ll1 == "always" TheWorld:PushEvent("ms_setworldsetting",{setting = "ghost_sanity_drain", value = l1ll1l1ll11l11ll1ll1})
    end
    , resettime = function(l1l1ll1ll1l1ll1ll1ll)
        l1l1ll1ll1l1ll1ll1ll = "none" local l1l1ll1l11l11ll1l11l = nil TheWorld:PushEvent("ms_setworldsetting",{setting = "reset_time", value = l1l1ll1l11l11ll1l11l}) TheWorld:PushEvent("ms_setworldresettime", l1l1ll1l11l11ll1l11l)
    end
    }
    for l1ll11l1ll1ll1ll11l1, ll1ll1ll11ll11ll11l1 in pairs(l1l11l1ll1l11l11ll1l)
    do
        ll1ll1l11l1ll1l1l11l["Post"][l1ll11l1ll1ll1ll11l1] = ll1ll1ll11ll11ll11l1
    end

end

AddModRPCHandler("DC_SetState", "SetState", function(l11ll11l11ll11l1ll1l, l1l1l1l1ll11l11l1l1l)
    if not (type(l11ll11l11ll11l1ll1l) == "table" and l11ll11l11ll11l1ll1l:HasTag "player") then
        return
    end
    if not (type(l1l1l1l1ll11l11l1l1l) == "number" and states[l1l1l1l1ll11l11l1l1l]) then
        return
    end
    if TUNING["GZ_ON_GOING"] then
        return
    end
    if not TUNING["GZ_CAN_VOTE"] then
        return
    end
    local l1l1l1l11ll1ll11l1ll = l11ll11l11ll11l1ll1l["components"]["gz_player"] if not l1l1l1l11ll1ll11l1ll then
        return
    end
    l1l1l1l11ll1ll11l1ll:SetState(l1l1l1l1ll11l11l1l1l)

end
)