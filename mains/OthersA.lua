local l1l1ll11l1l1ll11ll11 = require "List/list_states"

local ll1ll1l11ll11ll11ll1 = l1l1ll11l1l1ll11ll11["States"]

local ll1l11l1ll1l1ll1l1ll = require "List/list_team_colors"

local l1l11l11l1l1ll1ll1ll = require "util/fgc_upvaluehelper"

local ll11l1l1ll11ll1l1l1l = require "widgets/btn_select"

AddClassPostConstruct("widgets/controls", function(self)
    self["btn_select"] = self["bottom_root"]:AddChild(ll11l1l1ll11ll1l1l1l(self["owner"])) self["btn_select"]:SetPosition(0, 100, 0)

end
)

local function l1l1l1l1l1l1l1ll1l11(ll1ll11l11ll1ll1ll1l, l1l11l11l1l1l1ll1ll1)
    if not (l1l11l11l1l1l1ll1ll1 and l1l11l11l1l1l1ll1ll1:HasTag "player") then
        return (308+347-429 * 323 ~= - 137912)
    end
    if ll1ll11l11ll1ll1ll1l["components"]["gz_player"] and l1l11l11l1l1l1ll1ll1["components"]["gz_player"] then
        local ll1ll11l1ll1ll1l11ll = ll1ll11l11ll1ll1ll1l["components"]["gz_player"]["p_team_num"]
        if ll1ll11l1ll1ll1l11ll ~= 0 and ll1ll11l1ll1ll1l11ll == l1l11l11l1l1l1ll1ll1["components"]["gz_player"]["p_team_num"] then
            return (222+396 * 442-11 * 10 == 175144)
        end
    end
    if ll1ll11l11ll1ll1ll1l["_p_team_num"] and l1l11l11l1l1l1ll1ll1["_p_team_num"] then
        local l1l1l11ll1l1l1ll1l11 = ll1ll11l11ll1ll1ll1l["_p_team_num"]:value()
        if l1l1l11ll1l1l1ll1l11 ~= 0 and l1l1l11ll1l1l1ll1l11 == l1l11l11l1l1l1ll1ll1["_p_team_num"]:value() then
            return (459+490 * 283+122 == 139251)
        end
    end
    return (string.sub("l1l11l1ll1ll1ll1ll1l", 7, 13) ~= "1ll1ll1")

end

local function ll11l1l1l1l1ll1l1l11(ll11l1ll11l11ll1l11l)
    local l11ll1l11l11l1l1ll11 = ll11l1ll11l11ll1l11l["_p_team_num"]:value()
    local ll1l11l1ll1ll1l1l11l = string["format"]("[%d]%s", l11ll1l11l11l1l1ll11, ll11l1ll11l11ll1l11l["name"])
    ll11l1ll11l11ll1l11l["Label"]:SetText(ll1l11l1ll1ll1l1l11l)
    local l1l1ll1ll11ll1ll1l1l = ll1l11l1ll1l1ll1l1ll[l11ll1l11l11l1l1ll11 + 1]
    ll11l1ll11l11ll1l11l["Label"]:SetColour(l1l1ll1ll11ll1ll1l1l[1], l1l1ll1ll11ll1ll1l1l[2], l1l1ll1ll11ll1ll1l1l[3])

end

AddPlayerPostInit(function(l11l11l1l11ll1l1l11l)
    l11l11l1l11ll1l1l11l["DC_InSameTeam"] = l1l1l1l1l1l1l1ll1l11 l11l11l1l11ll1l1l11l["_state_num"] = net_tinybyte(l11l11l1l11ll1l1l11l["GUID"], "dc._state_num", "dirty_state_num") l11l11l1l11ll1l1l11l["_can_vote"] = net_bool(l11l11l1l11ll1l1l11l["GUID"], "dc._can_vote", "dirty_can_vote") l11l11l1l11ll1l1l11l["_p_team_num"] = net_smallbyte(l11l11l1l11ll1l1l11l["GUID"], "dc._p_team_num", "dirty_p_team_num") l11l11l1l11ll1l1l11l["_kill_num"] = net_byte(l11l11l1l11ll1l1l11l["GUID"], "dc._kill_num", "dirty_kill_num") l11l11l1l11ll1l1l11l["_death_num"] = net_byte(l11l11l1l11ll1l1l11l["GUID"], "dc._death_num", "dirty_death_num") l11l11l1l11ll1l1l11l["entity"]:AddLabel() l11l11l1l11ll1l1l11l["Label"]:SetFontSize(18) l11l11l1l11ll1l1l11l["Label"]:SetFont(BODYTEXTFONT) l11l11l1l11ll1l1l11l["Label"]:SetWorldOffset(0, 2.61, 0) l11l11l1l11ll1l1l11l["Label"]:SetColour(255 / 255, 255 / 255, 255 / 255) l11l11l1l11ll1l1l11l["Label"]:Enable(TUNING["GZ_ShowName"]) if not TheNet:IsDedicated() then
        l11l11l1l11ll1l1l11l["DC_SetLabel"] = ll11l1l1l1l1ll1l1l11 l11l11l1l11ll1l1l11l:DoTaskInTime(0, function()
            l11l11l1l11ll1l1l11l:DC_SetLabel() l11l11l1l11ll1l1l11l:ListenForEvent("dirty_p_team_num", l11l11l1l11ll1l1l11l["DC_SetLabel"]) l11l11l1l11ll1l1l11l:ListenForEvent("gz_screen_heights", function(ll1l1ll1ll11ll11ll11, l1ll11ll1l1l11ll1ll1)
                local l1ll1l1ll1l1l1l1ll1l = 30 / l1ll11ll1l1l11ll1ll1["screen_heights"] l11l11l1l11ll1l1l11l["Label"]:SetFontSize(8 * l1ll1l1ll1l1l1l1ll1l) if l11l11l1l11ll1l1l11l:HasTag "corpse" then
                    l11l11l1l11ll1l1l11l["Label"]:SetWorldOffset(0, 1.61, 0)
                elseif l11l11l1l11ll1l1l11l:HasTag "playerghost" then
                    l11l11l1l11ll1l1l11l["Label"]:SetWorldOffset(0, 3.61, 0)
                elseif l11l11l1l11ll1l1l11l["replica"]["rider"] and l11l11l1l11ll1l1l11l["replica"]["rider"]:IsRiding() then
                    l11l11l1l11ll1l1l11l["Label"]:SetWorldOffset(0, 4.61, 0)
                else
                    l11l11l1l11ll1l1l11l["Label"]:SetWorldOffset(0, 2.61, 0)
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

AddStategraphPostInit("wilsonghost", function(l1ll11l1ll11ll1l1l11)
    local ll1l1ll11ll1ll1l1l1l = l1ll11l1ll11ll1l1l11["states"]["haunt_pre"] local l11ll1ll11ll1l1ll1ll = ll1l1ll11ll1ll1l1l1l["onenter"] ll1l1ll11ll1ll1l1l1l["onenter"] = function(l1ll1l1l1ll1l1l1ll1l, ...)
        if l1ll1l1l1ll1l1l1ll1l:HasTag "gz_out_game" then
            l1ll1l1l1ll1l1l1ll1l["sg"]:GoToState "idle"
        else
            return l11ll1ll11ll1l1ll1ll(l1ll1l1l1ll1l1l1ll1l, ...)
        end
    end

end
)

AddStategraphPostInit("wilsonghost_client", function(l1ll11l1l1l11l1ll1ll)
    local l1l1l11l1l11ll1ll11l = l1ll11l1l1l11l1ll1ll["states"]["haunt_pre"] local ll1ll11l1ll1ll11l11l = l1l1l11l1l11ll1ll11l["onenter"] l1l1l11l1l11ll1ll11l["onenter"] = function(l1l1l11l1ll1ll1l1ll1, ...)
        if l1l1l11l1ll1ll1l1ll1:HasTag "gz_out_game" then
            l1l1l11l1ll1ll1l1ll1["sg"]:GoToState "idle"
        else
            return ll1ll11l1ll1ll11l11l(l1l1l11l1ll1ll1l1ll1, ...)
        end
    end

end
)

local ll1l1l1l11ll1ll11ll1 = l1l11l11l1l1ll1ll1ll["Get"](EntityScript["CollectActions"], "COMPONENT_ACTIONS")

if ll1l1l1l11ll1ll11ll1 and ll1l1l1l11ll1ll11ll1["SCENE"] then
    local l11ll1ll1l1l11l11l1l = ll1l1l1l11ll1ll11ll1["SCENE"]["hauntable"]
    ll1l1l1l11ll1ll11ll1["SCENE"]["hauntable"] = function(l1ll1l11ll1l1ll1ll1l, l11ll1ll11l11ll11ll1, ll1l1l1l11ll1ll11ll1, ...)
        if l11ll1ll11l11ll11ll1 and l11ll1ll11l11ll11ll1:HasTag "gz_out_game" then
            return
        end
        return l11ll1ll1l1l11l11l1l(l1ll1l11ll1l1ll1ll1l, l11ll1ll11l11ll11ll1, ll1l1l1l11ll1ll11ll1, ...)
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
    if not (type(l1l1l1l1ll11l11l1l1l) == "number" and ll1ll1l11ll11ll11ll1[l1l1l1l1ll11l11l1l1l]) then
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