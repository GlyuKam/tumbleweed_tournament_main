local UserCommands = require "usercommands"

AddClassPostConstruct("screens/chatinputscreen", function(self)
    function self:IsChatInTeam()
        if not self["whisper"] then
            return false
        end
        if ThePlayer and ThePlayer["_p_team_num"] and ThePlayer["_p_team_num"]:value() ~= 0 then
            return true
        end
    end
    local ChatRunnning = self["Run"] 
    function self:Run()
        local chat_edit = self["chat_edit"]:GetString() 
        chat_edit = chat_edit ~= nil and chat_edit:match "^%s*(.-%S)%s*$" or "" 
        if chat_edit == "" then
            return
        elseif string["sub"](chat_edit, 1, 1) == "/" then
            UserCommands["RunTextUserCommand"](string["sub"](chat_edit, 2), ThePlayer,false)
        elseif chat_edit:utf8len() <= MAX_CHAT_INPUT_LENGTH then
            if self:IsChatInTeam() then
                SendModRPCToServer(GetModRPC("DC_ChatInTeam", "ChatInTeam"), chat_edit)
            else
                TheNet:Say(chat_edit, self["whisper"])
            end
        end
    end

end
)

AddModRPCHandler("DC_ChatInTeam", "ChatInTeam", function(player, message)
    if not (type(player) == "table" and player:HasTag "player") then
        return
    end
    if type(message) ~= "string" and message == "" then
        return
    end
    local team_manager = player["team_manager"] if not (team_manager and team_manager:IsValid()) then
        return
    end
    local team ={} 
    for num, player in pairs(team_manager["players"]) do
        if player and player:IsValid() then
            table["insert"](team, player["userid"])
        end
    end
    if # team > 0 then
        SendModRPCToClient(GetClientModRPC("DC_ChatInTeamClient", "ChatInTeamClient"), team, message, player["name"])
    end

end
)

AddClientModRPCHandler("DC_ChatInTeamClient", "ChatInTeamClient", function(inst, message)
    local player = ThePlayer 
    if player then
        GLOBAL["ChatHistory"]:AddToHistory(GLOBAL["ChatTypes"]["Message"], nil, nil, message, inst,{0.196, 0.804, 0.196, 1})
    end

end
)