local team_manager = Class(function(self, owner)
    self["inst"] = owner 
    self["m_team_num"] = nil
end)

function team_manager:OnSave()
    return {m_team_num = self["m_team_num"]}
end

function team_manager:OnLoad(data)
    if data then
        if data["m_team_num"] then
            self["m_team_num"] = data["m_team_num"]
        end
    end
end

return team_manager