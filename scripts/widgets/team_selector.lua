local Widget = require "widgets/widget"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"

local BUTTON_SCALE = 0.75
local X_POS = 0
local Y_POS = 0

local Teams = Class(Widget, function(self, owner)
    Widget._ctor(self, "Roles")

    self.owner = owner

    self.root = self:AddChild(Widget("root"))

    self.header = self.root:AddChild(Widget("HEADER"))
	self.header:SetPosition(0, Y_POS+100)
	self.header.bg = self.header:AddChild(Image("images/global_redux.xml", "spinner_background_edited.tex"))
	self.header.text = self.header:AddChild(Text(HEADERFONT, 40, "Выбор команды"))
    self.header.icon = self.header:AddChild(Image())
	self.header.icon:SetPosition(-293.5, 0)
    self.header.icon:SetScale(1.2)

    self.b1 = self.root:AddChild(self:MakeButton(-250,1))
    self.b2 = self.root:AddChild(self:MakeButton(-150,2))
    self.b3 = self.root:AddChild(self:MakeButton(-50,3))
    self.b4 = self.root:AddChild(self:MakeButton(50,4))
    self.b5 = self.root:AddChild(self:MakeButton(150,5))
    self.b6 = self.root:AddChild(self:MakeButton(250,6))

    self.owner:ListenForEvent("dirty_can_vote",function()
        self:Check()
    end)
end)

function Teams:MakeButton(x, num)
    local b = ImageButton("images/global_redux.xml", "char_selection.tex", "char_selection_hover.tex", "char_selection.tex", nil, nil, {1,1}, {0,0})
    b:SetScale(BUTTON_SCALE, BUTTON_SCALE)
    b.focus_scale = nil
    b.num = num
    b.text = b:AddChild(Text(HEADERFONT, 85, tostring(num)))
    b:SetPosition(X_POS+x, Y_POS)
    b:SetOnClick(function()
        SendModRPCToServer(GetModRPC("TEAMS","SELECTTEAM"),num)
    end)

    return b
end

function Teams:Check()
    if self["owner"]["_can_vote"]:value() then
        self:Show()
    else
        self:Kill()
    end

end

return Teams