AddReplicableComponent "dc_fgc_net"

local l11ll11ll1l1ll1ll1ll ={"forest_network", "cave_network"}

for l1l1l1l11l1l1l1ll1ll, l1l1l1ll11ll1l1ll1l1 in pairs(l11ll11ll1l1ll1ll1ll)

do
    AddPrefabPostInit(l1l1l1ll11ll1l1ll1l1, function(l11ll1ll11l11l11l11l)
        if not TheWorld["ismastersim"] then
            return
        end
        l11ll1ll11l11l11l11l:AddComponent "dc_fgc_net"
    end
    )

end

local ll11l1ll1ll11ll1l1l1 = require "screens/playerstatusscreen"

local l11ll11l11l11l1ll11l = require 'widgets/widget'

local l11l11l1ll1l1l1l1l1l = require "widgets/image"

local l1l1l1l1ll1l11l11l11 = require "widgets/text"

local ll1l1l1l1ll1ll1ll1ll = require "List/list_team_colors"

local l1ll11ll1ll1l1ll1l11 = require "List/list_states"

local l1ll1l1ll1ll1l1ll1ll = l1ll11ll1ll1l1ll1l11["States"]

local function ll1l1ll11l1ll1l1l1l1()

end

local function l11ll1ll1ll11l11l11l(ll1ll1l11ll1l1l1ll11, ll1l1l1ll11l1ll1l1ll)
    ll1ll1l11ll1l1l1ll11["DC_" .. ll1l1l1ll11l1ll1l1ll] = ll1ll1l11ll1l1l1ll11[ll1l1l1ll11l1ll1l1ll]
    ll1ll1l11ll1l1l1ll11[ll1l1l1ll11l1ll1l1ll] = ll1l1ll11l1ll1l1l1l1

end

local function ll1ll1l1l1l1l1ll11l1(l11ll1l1l1l1l1ll1l11)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["viewprofile"], "SetPosition")
    l11ll1l1l1l1l1ll1l11["viewprofile"]:DC_SetPosition(232, - 6, 0)
    l11ll1l1l1l1l1ll1l11["viewprofile"]:SetNormalScale(0.21)
    l11ll1l1l1l1l1ll1l11["viewprofile"]:SetFocusScale(0.21 * 1.1)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["mute"], "SetPosition")
    l11ll1l1l1l1l1ll1l11["mute"]:DC_SetPosition(232, 16, 0)
    l11ll1l1l1l1l1ll1l11["mute"]:SetNormalScale(0.21)
    l11ll1l1l1l1l1ll1l11["mute"]:SetFocusScale(0.21 * 1.1)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["kick"], "SetPosition")
    l11ll1l1l1l1l1ll1l11["kick"]:DC_SetPosition(365, - 8, 0)
    l11ll1l1l1l1l1ll1l11["kick"]:SetNormalScale(0.25)
    l11ll1l1l1l1l1ll1l11["kick"]:SetFocusScale(0.25 * 1.1)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["ban"], "SetPosition")
    l11ll1l1l1l1l1ll1l11["ban"]:DC_SetPosition(365, 18, 0)
    l11ll1l1l1l1l1ll1l11["ban"]:SetNormalScale(0.25)
    l11ll1l1l1l1l1ll1l11["ban"]:SetFocusScale(0.25 * 1.1)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["useractions"], "SetPosition")
    l11ll1l1l1l1l1ll1l11["useractions"]:DC_SetPosition(392, - 8, 0)
    l11ll1l1l1l1l1ll1l11["useractions"]:SetNormalScale(0.25)
    l11ll1l1l1l1l1ll1l11["useractions"]:SetFocusScale(0.25 * 1.1)
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["age"], "SetString")
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["age"], "Show")
    l11ll1ll1ll11l11l11l(l11ll1l1l1l1l1ll1l11["age"], "Hide")
    l11ll1l1l1l1l1ll1l11["age"]:DC_SetString ""
    l11ll1l1l1l1l1ll1l11["age"]:DC_Hide()

end

function ll11l1ll1ll11ll1l1l1:FGC_Update()
    self["fgc_data"] = nil self["fgc_data"] = TheWorld["net"]["replica"]["dc_fgc_net"]:GetAllData()

end

function ll11l1ll1ll11ll1l1l1:DC_SetWithID(l11l1l1l11l11l11l1l1, l11l1l1ll1l1l11l1ll1)
    local ll11l1l1ll11l1l11l11 = l11l1l1l11l11l11l1l1["ishost"] and not TheNet:GetServerIsClientHosted()
    if ll11l1l1ll11l1l11l11 then
        l11l1l1l11l11l11l1l1["gz_root"]:Hide()
        return
    end
    l11l1l1l11l11l11l1l1["gz_root"]:Show()
    local l1ll1ll1l1ll1l1ll1l1 = 1
    local l1l1ll11l1ll1ll11l11 = 0
    local ll1ll11l11ll1ll1l1ll = 0
    local ll1l11l1ll11l11ll11l = 0
    local l11l1l11ll1l11ll11l1 = 0
    local l1l11l11ll11ll11l1ll = LookupPlayerInstByUserID(l11l1l1ll1l1l11l1ll1)
    if l1l11l11ll11ll11l1ll then
        l1ll1ll1l1ll1l1ll1l1 = l1l11l11ll11ll11l1ll["_state_num"]:value()
        l1l1ll11l1ll1ll11l11 = l1l11l11ll11ll11l1ll["_kill_num"]:value()
        ll1ll11l11ll1ll1l1ll = l1l11l11ll11ll11l1ll["_death_num"]:value()
        ll1l11l1ll11l11ll11l = l1l11l11ll11ll11l1ll["dc_point"] and l1l11l11ll11ll11l1ll["dc_point"]:value() or 0
        l11l1l11ll1l11ll11l1 = l1l11l11ll11ll11l1ll["_p_team_num"]:value()
    else
        local l1l11l1ll1l1l1l1ll11 = self["fgc_data"][l11l1l1ll1l1l11l1ll1]
        if l1l11l1ll1l1l1l1ll11 then
            l1ll1ll1l1ll1l1ll1l1 = l1l11l1ll1l1l1l1ll11["state"] or 1
            l1l1ll11l1ll1ll11l11 = l1l11l1ll1l1l1l1ll11["kill"] or 0
            ll1ll11l11ll1ll1l1ll = l1l11l1ll1l1l1l1ll11["death"] or 0
            ll1l11l1ll11l11ll11l = l1l11l1ll1l1l1l1ll11["point"] or 0
            l11l1l11ll1l11ll11l1 = l1l11l1ll1l1l1l1ll11["team"] or 0
        end
    end
    local l11l11l1ll1l1ll1ll11 = l1ll1l1ll1ll1l1ll1ll[l1ll1ll1l1ll1l1ll1l1]["tab_text"]
    local l11l1ll11ll1l11l1ll1 = l1ll1l1ll1ll1l1ll1ll[l1ll1ll1l1ll1l1ll1l1]["state"]
    l11l1l1l11l11l11l1l1["gz_state_icon"]:SetHoverText(l11l11l1ll1l1ll1ll11)
    l11l1l1l11l11l11l1l1["gz_state_icon"]:SetTexture("images/hud/sign_" .. l11l1ll11ll1l11l1ll1 .. ".xml", "sign_" .. l11l1ll11ll1l11l1ll1 .. ".tex")
    local ll1l1ll1ll11l11l11l1, ll1l1l1ll11l11l11ll1 = l11l1l1l11l11l11l1l1["gz_state_icon"]:GetSize()
    local l11ll11l11ll1ll11l1l = math["max"](ll1l1ll1ll11l11l11l1, ll1l1l1ll11l11l11ll1)
    local ll1ll1ll11l1l11ll11l = math["min"](ll1l1ll1ll11l11l11l1, ll1l1l1ll11l11l11ll1)
    l11l1l1l11l11l11l1l1["gz_state_icon"]:SetScale(1, 1)
    l11l1l1l11l11l11l1l1["gz_state_icon"]:SetScale(35 / ll1l1ll1ll11l11l11l1, 35 / ll1l1l1ll11l11l11ll1)
    l11l1l1l11l11l11l1l1["gz_kill_text"]:SetString(l1l1ll11l1ll1ll11l11)
    l11l1l1l11l11l11l1l1["gz_death_text"]:SetString(ll1ll11l11ll1ll1l1ll)
    if TUNING["DC_FGC_PWS"] then
        l11l1l1l11l11l11l1l1["gz_point_text"]:SetString(ll1l11l1ll11l11ll11l)
    end

end

local l1l1l11ll1l11l11ll11 = ll11l1ll1ll11ll1l1l1["DoInit"]

function ll11l1ll1ll11ll1l1l1:DoInit(ll1l1l11ll1l11l1l1ll, ...)
    ll1l1l11ll1l11l1l1ll = ll1l1l11ll1l11l1l1ll or TheNet:GetClientTable() or {}
    for ll11ll1l1ll1l1l1ll11, ll1ll1l11ll1ll1ll1l1 in ipairs(ll1l1l11ll1l11l1l1ll)
    do
        local l11l11ll1l11l11l11ll = 0
        local l1ll11ll1ll1ll1ll1l1 = LookupPlayerInstByUserID(ll1ll1l11ll1ll1ll1l1["userid"])
        if l1ll11ll1ll1ll1ll1l1 then
            l11l11ll1l11l11l11ll = l1ll11ll1ll1ll1ll1l1["_p_team_num"]:value()
        else
            local ll1l11l1ll1ll1l1ll11 = self["fgc_data"][ll1ll1l11ll1ll1ll1l1["userid"]]
            l11l11ll1l11l11l11ll = ll1l11l1ll1ll1l1ll11 and ll1l11l1ll1ll1l1ll11["team"] or 0
        end
        ll1ll1l11ll1ll1ll1l1["dc_team"] = l11l11ll1l11l11l11ll
        ll1ll1l11ll1ll1ll1l1["colour"] = ll1l1l1l1ll1ll1ll1ll[l11l11ll1l11l11l11ll + 1]
    end
    table["sort"](ll1l1l11ll1l11l1l1ll, function(l1ll11l1ll1ll11l1l1l, l11ll11l1ll1l1ll11l1)
        if not TheNet:GetServerIsClientHosted() then
            if l1ll11l1ll1ll11l1l1l["performance"] ~= nil then
                return (string.sub("l1l1ll1ll11l11l1l1ll", 6, 11) == "l1ll11")
            elseif l11ll11l1ll1l1ll11l1["performance"] ~= nil then
                return (277 * 211+103+12-259 ~= 58303)
            end
        end
        if l1ll11l1ll1ll11l1l1l["dc_team"] ~= l11ll11l1ll1l1ll11l1["dc_team"] then
            return l1ll11l1ll1ll11l1l1l["dc_team"] < l11ll11l1ll1l1ll11l1["dc_team"]
        else
            return l1ll11l1ll1ll11l1l1l["userid"] < l11ll11l1ll1l1ll11l1["userid"]
        end
    end
    )
    l1l1l11ll1l11l11ll11(self, ll1l1l11ll1l11l1l1ll, ...)
    if not self["scroll_list"]["gz_old_updatefn"] then
        for l1l1l11ll11l1l1l1l1l, l1l1l11l1l1l11l1ll11 in pairs(self["scroll_list"]["static_widgets"])
        do
            ll1ll1l1l1l1l1ll11l1(l1l1l11l1l1l11l1ll11)
            l1l1l11l1l1l11l1ll11["gz_root"] = l1l1l11l1l1l11l1ll11:AddChild(l11ll11l11l11l1ll11l "gz_root")
            l1l1l11l1l1l11l1ll11["gz_root"]:SetPosition(- 5, 3, 0)
            l1l1l11l1l1l11l1ll11["gz_state_icon"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l11l11l1ll1l1l1l1l1l())
            l1l1l11l1l1l11l1ll11["gz_state_icon"]:SetPosition(200, 0, 0)
            l1l1l11l1l1l11l1ll11["gz_state_icon"]["scale_on_focus"] =(151+101-273 * 3 * 342 ~= - 279846)
            l1l1l11l1l1l11l1ll11["gz_kill_icon"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l11l11l1ll1l1l1l1l1l("images/ctf_crafting_tabs.xml", "ctf_tab_weapons.tex"))
            l1l1l11l1l1l11l1ll11["gz_kill_icon"]:SetPosition(0, 0, 0)
            l1l1l11l1l1l11l1ll11["gz_kill_icon"]["scale_on_focus"] =(392-71-4+390 * 69 ~= 27227)
            l1l1l11l1l1l11l1ll11["gz_kill_icon"]:SetHoverText "击杀次数"
            l1l1l11l1l1l11l1ll11["gz_kill_icon"]:SetScale(0.38)
            l1l1l11l1l1l11l1ll11["gz_kill_text"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l1l1l1l1ll1l11l11l11(UIFONT, 35, "0"))
            l1l1l11l1l1l11l1ll11["gz_kill_text"]:SetPosition(45, 0, 0)
            l1l1l11l1l1l11l1ll11["gz_death_icon"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l11l11l1ll1l1l1l1l1l("images/ctf_crafting_tabs.xml", "ctf_tab_deaths.tex"))
            l1l1l11l1l1l11l1ll11["gz_death_icon"]:SetPosition(100, 0, 0)
            l1l1l11l1l1l11l1ll11["gz_death_icon"]["scale_on_focus"] =(328+11+461 == 807)
            l1l1l11l1l1l11l1ll11["gz_death_icon"]:SetHoverText "被杀次数"
            l1l1l11l1l1l11l1ll11["gz_death_icon"]:SetScale(0.38)
            l1l1l11l1l1l11l1ll11["gz_death_text"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l1l1l1l1ll1l11l11l11(UIFONT, 35, "0"))
            l1l1l11l1l1l11l1ll11["gz_death_text"]:SetPosition(145, 0, 0)
            if TUNING["DC_FGC_PWS"] then
                l1l1l11l1l1l11l1ll11["gz_point_text"] = l1l1l11l1l1l11l1ll11["gz_root"]:AddChild(l1l1l1l1ll1l11l11l11(UIFONT, 35, "0"))
                l1l1l11l1l1l11l1ll11["gz_point_text"]:SetPosition(- 75, 0, 0)
            end
            self:DC_SetWithID(l1l1l11l1l1l11l1ll11, l1l1l11l1l1l11l1ll11["userid"])
        end
        self["scroll_list"]["gz_old_updatefn"] = self["scroll_list"]["updatefn"]
        self["scroll_list"]["updatefn"] = function(l11ll11l1l1l1ll11l1l, l1ll1ll11l11ll1ll1ll, ...)
            self["scroll_list"]["gz_old_updatefn"](l11ll11l1l1l1ll11l1l, l1ll1ll11l11ll1ll1ll, ...)
            self:DC_SetWithID(l11ll11l1l1l1ll11l1l, l1ll1ll11l11ll1ll1ll["userid"])
        end
    end

end

local l11l1ll1l11l1ll11ll1 = ll11l1ll1ll11ll1l1l1["GetDisplayName"]

function ll11l1ll1ll11ll1l1l1:GetDisplayName(l1l1l1l1l11l11l1ll11, ...)
    local l11l11ll1l1l11ll1l1l = l1l1l1l1l11l11l1ll11["dc_team"]
    if l11l11ll1l1l11ll1l1l == nil then
        local ll11l1l1l1ll1l1l11ll = LookupPlayerInstByUserID(l1l1l1l1l11l11l1ll11["userid"])
        if ll11l1l1l1ll1l1l11ll then
            l11l11ll1l1l11ll1l1l = ll11l1l1l1ll1l1l11ll["_p_team_num"]:value()
        else
            local l11l1ll1l1l11l11ll11 = self["fgc_data"][l1l1l1l1l11l11l1ll11["userid"]]
            l11l11ll1l1l11ll1l1l = l11l1ll1l1l11l11ll11 and l11l1ll1l1l11l11ll11["team"] or 0
        end
        l1l1l1l1l11l11l1ll11["dc_team"] = l11l11ll1l1l11ll1l1l
        l1l1l1l1l11l11l1ll11["colour"] = ll1l1l1l1ll1ll1ll1ll[l11l11ll1l1l11ll1l1l + 1]
    end
    return string["format"]("[%s]%s", l11l11ll1l1l11ll1l1l, l11l1ll1l11l1ll11ll1(self, l1l1l1l1l11l11l1ll11, ...))

end

AddClassPostConstruct("screens/playerstatusscreen", function(self)
    self:FGC_Update() self["inst"]:ListenForEvent("event_fgc_net_records", function()
        self:FGC_Update()
    end
    , TheWorld["net"])

end
)