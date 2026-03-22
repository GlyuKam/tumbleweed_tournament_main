GLOBAL["setmetatable"](env,{__index = function(l1l11l11ll1ll1ll1l11, l1ll1ll1l11l1l11ll11)
    return GLOBAL["rawget"](GLOBAL, l1ll1ll1l11l1l11ll11)

end
})

TUNING["DC_Language"] = GetModConfigData "DC_Language"

if TUNING["DC_Language"] == "Auto" or TUNING["DC_Language"] == nil then
    local lang = require 'languages/loc'
    local laungage = lang and lang["GetLanguage"] and lang["GetLanguage"]()
    if laungage == LANGUAGE["CHINESE_S"] or laungage == LANGUAGE["CHINESE_S_RAIL"] then
        TUNING["DC_Language"] = "zh"
    elseif laungage == LANGUAGE["CHINESE_T"] or laungage == LANGUAGE["KOREAN"] or laungage == LANGUAGE["JAPANESE"] then
        TUNING["DC_Language"] = "zht"
    elseif laungage == LANGUAGE["RUSSIAN"] then
        TUNING["DC_Language"] = "ru"
    elseif laungage == LANGUAGE["FRENCH"] then
        TUNING["DC_Language"] = "fr"
    elseif laungage == LANGUAGE["SPANISH"] or laungage == LANGUAGE["SPANISH_LA"] then
        TUNING["DC_Language"] = "es"
    else
        TUNING["DC_Language"] = "en"
    end

end

modimport("lans/string_" .. TUNING["DC_Language"] .. ".lua")
modimport "mains/tuning.lua"
modimport "mains/load.lua"
modimport "mains/OthersA.lua"
modimport "mains/SHB.lua"
modimport "mains/ChatInTeam.lua"
modimport "mains/Status.lua"

-- local function SelectTeam(player,team)
--     c_nextteam(player,team)
-- end

-- AddModRPCHandler("TEAMS","SELECTTEAM",SelectTeam)

if TUNING["GZ_RandomChar"] then
    modimport "mains/RandomChar.lua"

end

if TheNet:GetIsServer() or TheNet:IsDedicated() then
    modimport "mains/Fns_API.lua"
    modimport "mains/Fns_SuoQuan.lua"
    modimport "mains/Fns_GameMode.lua"
    modimport "mains/Fns_GameRun.lua"
    modimport "mains/FengGunCao.lua"
    modimport "mains/OutGame.lua"
    modimport "mains/SpawnEyeOfTerror.lua"
    modimport "mains/NoDeathGoTo.lua"
    modimport "mains/OthersS.lua"

end

if TheNet:IsDedicated() then
    return

end

modimport "mains/Client.lua"

-- local TeamButtons = require "widgets/team_selector"

-- AddClassPostConstruct("widgets/controls", function(self)
--     if TUNING["GZ_ON_GOING"] == true then return end
--     self.TeamButtons = self.inv:AddChild(TeamButtons(self.owner))
--     self.TeamButtons:SetPosition(0, 300)
--     self.TeamButtons:MoveToBack()
-- end)

if not TheNet:GetIsServerAdmin() then
    return

end

modimport "mains/ClientAdmin.lua"