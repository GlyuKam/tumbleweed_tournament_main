local ll1ll1l11ll11ll11ll1 = require "screens/redux/popupdialog"

local ll1l11l1ll1l1ll1l1ll = GetModConfigData "key_GroupPlayers"

local l1l11l11l1l1ll1ll1ll = GetModConfigData "key_MatchStart"

local ll11l1l1ll11ll1l1l1l = GetModConfigData "key_SetTile_CHECKER"

local l1l1l1l1l1l1l1ll1l11 = GetModConfigData "key_SetTile_MONKEY_DOCK"

local ll11l1l1l1l1ll1l1l11 = GetModConfigData "key_SetTile_OCEAN_COASTAL"

local function ll1l1l1l11ll1ll11ll1(ll1ll11l1ll1ll1l11ll)
    local l1l1l11ll1l1l1ll1l11, ll11l1ll11l11ll1l11l, l11ll1l11l11l1l1ll11 = TheSim:ProjectScreenPos(TheSim:GetPosition())
    local ll1l11l1ll1ll1l1l11l = TheNet:GetIsClient() and TheNet:GetIsServerAdmin()
    if ll1l11l1ll1ll1l1l11l then
        TheNet:SendRemoteExecute(ll1ll11l1ll1ll1l11ll, l1l1l11ll1l1l1ll1l11, l11ll1l11l11l1l1ll11)
    else
        ExecuteConsoleCommand(ll1ll11l1ll1ll1l11ll)
    end

end

local function ll1ll1l11l1ll1l1l11l()
    return ThePlayer and ThePlayer["HUD"] and not ThePlayer["HUD"]:HasInputFocus()

end

local ll1ll11l11ll1ll1ll1l ={}

if ll11l1l1ll11ll1l1l1l then
    ll1ll11l11ll1ll1ll1l[GLOBAL[ll11l1l1ll11ll1l1l1l]] = "CHECKER"

end

if l1l1l1l1l1l1l1ll1l11 then
    ll1ll11l11ll1ll1ll1l[GLOBAL[l1l1l1l1l1l1l1ll1l11]] = "MONKEY_DOCK"

end

if ll11l1l1l1l1ll1l1l11 then
    ll1ll11l11ll1ll1ll1l[GLOBAL[ll11l1l1l1l1ll1l1l11]] = "OCEAN_COASTAL"

end

for l1l1ll1ll11ll1ll1l1l, l11l11l1l11ll1l1l11l in pairs(ll1ll11l11ll1ll1ll1l)

do
    TheInput:AddKeyDownHandler(l1l1ll1ll11ll1ll1l1l, function()
        if not ll1ll1l11l1ll1l1l11l() then
            return
        end
        if not TheNet:GetIsServerAdmin() then
            return
        end
        local ll1l1ll1ll11ll11ll11 = TheInput:GetWorldPosition() local l1ll11ll1l1l11ll1ll1, l1ll1l1ll1l1l1l1ll1l, ll1ll1l11ll1ll11l1l1 = ll1l1ll1ll11ll11ll11:Get() ll1l1l1l11ll1ll11ll1(string["format"]("gz_SetTile(%f, %f, %f, \"%s\")", l1ll11ll1l1l11ll1ll1, l1ll1l1ll1l1l1l1ll1l, ll1ll1l11ll1ll11l1l1, l11l11l1l11ll1l1l11l))
    end
    )

end

if ll1l11l1ll1l1ll1l1ll then
    TheInput:AddKeyDownHandler(GLOBAL[ll1l11l1ll1l1ll1l1ll], function()
        if not ll1ll1l11l1ll1l1l11l() then
            return
        end
        if not TheNet:GetIsServerAdmin() then
            return
        end
        TheFrontEnd:PushScreen(ll1ll1l11ll11ll11ll1(STRINGS["DC_FGC"]["MEIDUIRENSHU"], STRINGS["DC_FGC"]["XUANZERENSHU"],{{text = " 1 ", cb = function()
            ll1l1l1l11ll1ll11ll1 "gz_GroupPlayers(1)" TheFrontEnd:PopScreen()
        end
        },{text = " 2 ", cb = function()
            ll1l1l1l11ll1ll11ll1 "gz_GroupPlayers(2)" TheFrontEnd:PopScreen()
        end
        },{text = " 3 ", cb = function()
            ll1l1l1l11ll1ll11ll1 "gz_GroupPlayers(3)" TheFrontEnd:PopScreen()
        end
        },{text = STRINGS["DC_FGC"]["QUXIAO"], cb = function()
            TheFrontEnd:PopScreen()
        end
        }}))
    end
    )

end

if l1l11l11l1l1ll1ll1ll then
    TheInput:AddKeyDownHandler(GLOBAL[l1l11l11l1l1ll1ll1ll], function()
        if not ll1ll1l11l1ll1l1l11l() then
            return
        end
        if not TheNet:GetIsServerAdmin() then
            return
        end
        TheFrontEnd:PushScreen(ll1ll1l11ll11ll11ll1(STRINGS["DC_FGC"]["QUERENKAISHI"], STRINGS["DC_FGC"]["LIKEKAISHI"],{{text = STRINGS["DC_FGC"]["QUEREN"], cb = function()
            ll1l1l1l11ll1ll11ll1 "gz_MatchStart()" TheFrontEnd:PopScreen()
        end
        },{text = STRINGS["DC_FGC"]["QUXIAO"], cb = function()
            TheFrontEnd:PopScreen()
        end
        }}))
    end
    )

end

local l1l11l11l1l1l1ll1ll1 ={"SetGameMode(1)", "GroupPlayers(2)", "AdminOut()", "MatchStart()", "Spawn()", "AutoSpawn()", "GameOver()", "ReRotation()", "SetSpawnPeriod()", "SetMaxPlayers(12)", "SwitchVote()"}

AddClassPostConstruct("screens/consolescreen", function(self)
    if self["console_edit"] then
        self["console_edit"]:AddWordPredictionDictionary({words = l1l11l11l1l1l1ll1ll1, delim = "gz_", num_chars = 0})
    end

end
)