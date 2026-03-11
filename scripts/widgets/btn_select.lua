local l1l1l1l1ll1l1ll11l11 = require "widgets/widget"

local l1l1l11ll11l1l11l1l1 = require "widgets/redux/templates"

local ll11l1ll1ll1l1ll1l11 = require "widgets/imagebutton"

local ll1l11ll11l1l11l1l11 = require "List/list_states"

local ll1ll1l1l1l11l11ll11 = ll1l11ll11l1l11l1l11["States"]

local ll1l11l1ll1l11l11ll1 = Class(l1l1l1l1ll1l1ll11l11, function(self, ll1l1ll1l1l11l1l11ll)
    l1l1l1l1ll1l1ll11l11["_ctor"](self, "BtnReady") self:SetScale(1, 1) self["owner"] = ll1l1ll1l1l11l1l11ll for ll11l1l1l1l11l1l1ll1, l11l11l1ll11ll11l1ll in ipairs(ll1ll1l1l1l11l11ll11) do
        local l1ll1ll1ll1ll1l11ll1 = "btn_" .. l11l11l1ll11ll11l1ll["state"] self[l1ll1ll1ll1ll1l11ll1] = self:AddChild(ll11l1ll1ll1l1ll1l11("images/ui.xml", "button_small.tex", "button_small_over.tex", "button_small_disabled.tex", nil, nil,{1, 1},{0, 0})) self[l1ll1ll1ll1ll1l11ll1]["image"]:SetScale(1.07) self[l1ll1ll1ll1ll1l11ll1]["text"]:SetPosition(0, 0) self[l1ll1ll1ll1ll1l11ll1]:SetPosition(ll11l1l1l1l11l1l1ll1 * 150-300, 0, 0) self[l1ll1ll1ll1ll1l11ll1]:SetText(l11l11l1ll11ll11l1ll["text"]) self[l1ll1ll1ll1ll1l11ll1]:SetHoverText(l11l11l1ll11ll11l1ll["hover"]) self[l1ll1ll1ll1ll1l11ll1]:SetOnClick(function()
            if self["player_state"] ~= l11l11l1ll11ll11l1ll["state"] then
                SendModRPCToServer(GetModRPC("DC_SetState", "SetState"), ll11l1l1l1l11l1l1ll1)
            end
        end
        ) self[l1ll1ll1ll1ll1l11ll1]:SetFont(BUTTONFONT) self[l1ll1ll1ll1ll1l11ll1]:SetDisabledFont(BUTTONFONT) self[l1ll1ll1ll1ll1l11ll1]:SetTextSize(33) self[l1ll1ll1ll1ll1l11ll1]["text"]:SetVAlign(ANCHOR_MIDDLE) self[l1ll1ll1ll1ll1l11ll1]["text"]:SetColour(0, 0, 0, 1) if l11l11l1ll11ll11l1ll["default"] then
            self["player_state"] = l11l11l1ll11ll11l1ll["state"] self[l1ll1ll1ll1ll1l11ll1]:OnEnable()
        else
            self[l1ll1ll1ll1ll1l11ll1]:OnDisable()
        end
        self[l1ll1ll1ll1ll1l11ll1]["OnLoseFocus"] = function()
            if self["player_state"] ~= l11l11l1ll11ll11l1ll["state"] then
                self[l1ll1ll1ll1ll1l11ll1]:OnDisable()
            end
        end
    end
    self["inst"]:ListenForEvent("dirty_state_num", function()
        if not (self["owner"] and self["owner"]["_state_num"]) then
            return
        end
        local l11ll1l1ll1l1ll1ll11 = self["owner"]["_state_num"]:value() local ll1l1l11l1l1l11ll11l = ll1ll1l1l1l11l11ll11[l11ll1l1ll1l1ll1ll11]["state"] for ll1l11ll11ll1ll1ll11, ll1l11ll1l11l1ll11ll in ipairs(ll1ll1l1l1l11l11ll11) do
            local l11ll1ll1ll1ll11l1ll = "btn_" .. ll1l11ll1l11l1ll11ll["state"] if self[l11ll1ll1ll1ll11l1ll] then
                if ll1l11ll1l11l1ll11ll["state"] == ll1l1l11l1l1l11ll11l then
                    self[l11ll1ll1ll1ll11l1ll]:OnEnable()
                else
                    self[l11ll1ll1ll1ll11l1ll]:OnDisable()
                end
            end
        end
        self["player_state"] = ll1l1l11l1l1l11ll11l
    end
    , self["owner"]) self["inst"]:ListenForEvent("dirty_can_vote", function()
        self:Check()
    end
    , self["owner"]) self:Check()

end
)

function ll1l11l1ll1l11l11ll1:Check()
    if self["owner"]["_can_vote"]:value() then
        self:Show()
    else
        self:Hide()
    end

end

return ll1l11l1ll1l11l11ll1