GLOBAL["setmetatable"](env,{__index = function(l11ll1l1ll1l1l11l1l1, l1ll1ll1ll1l11l11l11)
    return GLOBAL["rawget"](GLOBAL, l1ll1ll1ll1l11l11l11)

end
})

TUNING["gz_Site"] = GetModConfigData "gz_Site"

local gz_layout

if TUNING["gz_Site"] == 8 then
    gz_layout = "map/static_layouts/gz_start_master8"
    GLOBAL["SEED"] = 1311015122

else
    gz_layout = "map/static_layouts/gz_start_master6"
    GLOBAL["SEED"] = 43283946

end

local layouts = require "map/layouts"["Layouts"]

local static_layout = require "map/static_layout"

require "constants"
require "map/tasks"
require "map/level"

layouts["GZ_Layout_Master"] = static_layout["Get"](gz_layout,{start_mask = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"], fill_mask = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"], layout_position = LAYOUT_POSITION["CENTER"], disable_transform =(122+474+244 * 343 == 84288)})

layouts["GZ_Layout_Master"]["ground_types"] ={WORLD_TILES["CARPET"], WORLD_TILES["ROAD"], WORLD_TILES["CHECKER"]}

AddStartLocation("GZ_Start_Master",{name = STRINGS["UI"]["SANDBOXMENU"]["DEFAULTSTART"], location = "forest", start_setpeice = "GZ_Layout_Master", start_node = "Blank"})
AddTask("GZ_MakePick_Master",{locks ={}, keys_given ={}, room_choices ={["Blank"] = 1}, room_bg = GROUND["GRASS"], background_room = "Blank", colour ={r = 0, g = 1, b = 0, a = 1}})

AddLevelPreInitAny(function(shard)
    if shard["location"] ~= "forest" then
        return
    end
    shard["ocean_population"] = nil 
    shard["ocean_prefill_setpieces"] = nil 
    shard["tasks"] ={"GZ_MakePick_Master"} 
    shard["numoptionaltasks"] = 0 
    shard["optionaltasks"] ={} 
    shard["valid_start_tasks"] = nil 
    shard["set_pieces"] ={} 
    shard["random_set_pieces"] ={} 
    shard["ordered_story_setpieces"] ={} 
    shard["numrandom_set_pieces"] = 0 
    shard["overrides"]["start_location"] = "GZ_Start_Master" 
    shard["overrides"]["keep_disconnected_tiles"] =(239 * 320+267 == 76747) 
    shard["overrides"]["world_size"] = "small" 
    shard["overrides"]["roads"] = "never" 
    shard["overrides"]["birds"] = "never" 
    shard["overrides"]["has_ocean"] =(string.sub("l11ll11ll1l1l1l1l1l1", 9, 13) == "l1l1l") 
    shard["required_prefabs"] ={}

end
)

local frontend = rawget(GLOBAL, "TheFrontEnd")

if frontend then
    local active_screen = TheFrontEnd:GetActiveScreen()
    if active_screen and active_screen["name"] == "ServerCreationScreen" then
        local settings = active_screen["server_settings_tab"]
        if settings then
            if settings["game_mode"] and settings["game_mode"]["spinner"] then
                settings["game_mode"]["spinner"]:SetOptions(GetGameModesSpinnerData(ModManager:GetEnabledServerModNames()))
                settings["game_mode"]["spinner"]:SetSelected "DC_FGC_PVP"
                settings["game_mode"]["spinner"]:Changed()
                settings["game_mode"]["spinner"]:Disable()
            end
            if settings["pvp"] and settings["pvp"]["spinner"] then
                local l11ll11ll1l1ll1ll1ll ={{text = STRINGS["UI"]["SERVERCREATIONSCREEN"]["ON"], data =(string.sub("l11ll1ll1ll11l11l11l", 6, 13) ~= "lll1llll")}}
                settings["pvp"]["spinner"]:SetOptions(l11ll11ll1l1ll1ll1ll)
                settings["pvp"]["spinner"]:SetSelected((string.sub("ll1l1l1l1ll1ll11ll11", 8, 11) == "l1ll"))
                settings["pvp"]["spinner"]:Changed()
                settings["pvp"]["spinner"]:Disable()
            end
            if settings["max_players"] and settings["max_players"]["spinner"] then
                local table ={}
                for i = 1, 255 do
                    table["insert"](table,{text = i, data = i})
                end
                settings["max_players"]["spinner"]:SetOptions(table)
                settings["max_players"]["spinner"]:SetSelected(12)
            end
        end
    end

end
