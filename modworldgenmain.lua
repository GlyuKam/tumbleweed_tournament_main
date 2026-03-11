GLOBAL["setmetatable"](env,{__index = function(l11ll1l1ll1l1l11l1l1, l1ll1ll1ll1l11l11l11)
    return GLOBAL["rawget"](GLOBAL, l1ll1ll1ll1l11l11l11)

end
})

TUNING["gz_Site"] = GetModConfigData "gz_Site"

local l11l1l11l11l1ll11l11

if TUNING["gz_Site"] == 8 then
    l11l1l11l11l1ll11l11 = "map/static_layouts/gz_start_master8"
    GLOBAL["SEED"] = 1311015122

else
    l11l1l11l11l1ll11l11 = "map/static_layouts/gz_start_master6"
    GLOBAL["SEED"] = 43283946

end

local ll11l11ll1l1l1l11l11 = require "map/layouts"["Layouts"]

local l1ll11l1l11l1l1ll11l = require "map/static_layout"

require "constants"
require "map/tasks"
require "map/level"

ll11l11ll1l1l1l11l11["GZ_Layout_Master"] = l1ll11l1l11l1l1ll11l["Get"](l11l1l11l11l1ll11l11,{start_mask = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"], fill_mask = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"], layout_position = LAYOUT_POSITION["CENTER"], disable_transform =(122+474+244 * 343 == 84288)})

ll11l11ll1l1l1l11l11["GZ_Layout_Master"]["ground_types"] ={WORLD_TILES["CARPET"], WORLD_TILES["ROAD"], WORLD_TILES["CHECKER"]}

AddStartLocation("GZ_Start_Master",{name = STRINGS["UI"]["SANDBOXMENU"]["DEFAULTSTART"], location = "forest", start_setpeice = "GZ_Layout_Master", start_node = "Blank"})
AddTask("GZ_MakePick_Master",{locks ={}, keys_given ={}, room_choices ={["Blank"] = 1}, room_bg = GROUND["GRASS"], background_room = "Blank", colour ={r = 0, g = 1, b = 0, a = 1}})

AddLevelPreInitAny(function(ll1ll1l1l11l11ll11ll)
    if ll1ll1l1l11l11ll11ll["location"] ~= "forest" then
        return
    end
    ll1ll1l1l11l11ll11ll["ocean_population"] = nil ll1ll1l1l11l11ll11ll["ocean_prefill_setpieces"] = nil ll1ll1l1l11l11ll11ll["tasks"] ={"GZ_MakePick_Master"} ll1ll1l1l11l11ll11ll["numoptionaltasks"] = 0 ll1ll1l1l11l11ll11ll["optionaltasks"] ={} ll1ll1l1l11l11ll11ll["valid_start_tasks"] = nil ll1ll1l1l11l11ll11ll["set_pieces"] ={} ll1ll1l1l11l11ll11ll["random_set_pieces"] ={} ll1ll1l1l11l11ll11ll["ordered_story_setpieces"] ={} ll1ll1l1l11l11ll11ll["numrandom_set_pieces"] = 0 ll1ll1l1l11l11ll11ll["overrides"]["start_location"] = "GZ_Start_Master" ll1ll1l1l11l11ll11ll["overrides"]["keep_disconnected_tiles"] =(239 * 320+267 == 76747) ll1ll1l1l11l11ll11ll["overrides"]["world_size"] = "small" ll1ll1l1l11l11ll11ll["overrides"]["roads"] = "never" ll1ll1l1l11l11ll11ll["overrides"]["birds"] = "never" ll1ll1l1l11l11ll11ll["overrides"]["has_ocean"] =(string.sub("l11ll11ll1l1l1l1l1l1", 9, 13) == "l1l1l") ll1ll1l1l11l11ll11ll["required_prefabs"] ={}

end
)

local l1l11l1l11l1l11l1l1l = rawget(GLOBAL, "TheFrontEnd")

if l1l11l1l11l1l11l1l1l then
    local ll1l11l1ll1l1l11ll1l = TheFrontEnd:GetActiveScreen()
    if ll1l11l1ll1l1l11ll1l and ll1l11l1ll1l1l11ll1l["name"] == "ServerCreationScreen" then
        local l1ll1l1l1ll1ll1l1ll1 = ll1l11l1ll1l1l11ll1l["server_settings_tab"]
        if l1ll1l1l1ll1ll1l1ll1 then
            if l1ll1l1l1ll1ll1l1ll1["game_mode"] and l1ll1l1l1ll1ll1l1ll1["game_mode"]["spinner"] then
                l1ll1l1l1ll1ll1l1ll1["game_mode"]["spinner"]:SetOptions(GetGameModesSpinnerData(ModManager:GetEnabledServerModNames()))
                l1ll1l1l1ll1ll1l1ll1["game_mode"]["spinner"]:SetSelected "DC_FGC_PVP"
                l1ll1l1l1ll1ll1l1ll1["game_mode"]["spinner"]:Changed()
                l1ll1l1l1ll1ll1l1ll1["game_mode"]["spinner"]:Disable()
            end
            if l1ll1l1l1ll1ll1l1ll1["pvp"] and l1ll1l1l1ll1ll1l1ll1["pvp"]["spinner"] then
                local l11ll11ll1l1ll1ll1ll ={{text = STRINGS["UI"]["SERVERCREATIONSCREEN"]["ON"], data =(string.sub("l11ll1ll1ll11l11l11l", 6, 13) ~= "lll1llll")}}
                l1ll1l1l1ll1ll1l1ll1["pvp"]["spinner"]:SetOptions(l11ll11ll1l1ll1ll1ll)
                l1ll1l1l1ll1ll1l1ll1["pvp"]["spinner"]:SetSelected((string.sub("ll1l1l1l1ll1ll11ll11", 8, 11) == "l1ll"))
                l1ll1l1l1ll1ll1l1ll1["pvp"]["spinner"]:Changed()
                l1ll1l1l1ll1ll1l1ll1["pvp"]["spinner"]:Disable()
            end
            if l1ll1l1l1ll1ll1l1ll1["max_players"] and l1ll1l1l1ll1ll1l1ll1["max_players"]["spinner"] then
                local ll11l1ll1ll11ll1l1l1 ={}
                for l11ll11l11l11l1ll11l = 1, 255
                do
                    table["insert"](ll11l1ll1ll11ll1l1l1,{text = l11ll11l11l11l1ll11l, data = l11ll11l11l11l1ll11l})
                end
                l1ll1l1l1ll1ll1l1ll1["max_players"]["spinner"]:SetOptions(ll11l1ll1ll11ll1l1l1)
                l1ll1l1l1ll1ll1l1ll1["max_players"]["spinner"]:SetSelected(12)
            end
        end
    end

end
