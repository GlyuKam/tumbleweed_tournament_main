TUNING["LUCKY_MODE"] = GetModConfigData "lucky_mode"
TUNING["BASIC_RESOURCES_MULTIPLE"] = GetModConfigData "basic_resources_multiple"
TUNING["ADVANCED_RESOURCES_MULTIPLE"] = GetModConfigData "advanced_resources_multiple"
TUNING["SCARCE_RESOURCES_MULTIPLE"] = GetModConfigData "scarce_resources_multiple"
TUNING["BASIC_FOODS_MULTIPLE"] = GetModConfigData "basic_foods_multiple"
TUNING["ADVANCED_FOODS_MULTIPLE"] = GetModConfigData "advanced_foods_multiple"
TUNING["PREPAREDFOODS_MULTIPLE"] = GetModConfigData "preparedfoods_multiple"
TUNING["PREPAREDFOODS_WARLY_MULTIPLE"] = GetModConfigData "preparedfoods_warly_multiple"
TUNING["PREPAREDFOODS_SPICE_MULTIPLE"] = GetModConfigData "preparedfoods_spice_multiple"
TUNING["BLUEPRINTS_MULTIPLE"] = GetModConfigData "blueprints_multiple"
TUNING["BASIC_TOOLS_MULTIPLE"] = GetModConfigData "basic_tools_multiple"
TUNING["ADVANCED_TOOLS_MULTIPLE"] = GetModConfigData "advanced_tools_multiple"
TUNING["SCARCE_TOOLS_MULTIPLE"] = GetModConfigData "scarce_tools_multiple"
TUNING["BASIC_EQUIPMENTS_MULTIPLE"] = GetModConfigData "basic_equipments_multiple"
TUNING["ADVANCED_EQUIPMENTS_MULTIPLE"] = GetModConfigData "advanced_equipments_multiple"
TUNING["SCARCE_EQUIPMENTS_MULTIPLE"] = GetModConfigData "scarce_equipments_multiple"
TUNING["BASIC_MONSTERS_MULTIPLE"] = GetModConfigData "basic_monsters_multiple"
TUNING["ADVANCED_MONSTERS_MULTIPLE"] = GetModConfigData "advanced_monsters_multiple"
TUNING["SCARCE_MONSTERS_MULTIPLE"] = GetModConfigData "scarce_monsters_multiple"
TUNING["SEEK_DEATH_MULTIPLE"] = GetModConfigData "seek_death_multiple"
TUNING["SPECIAL_WELFARE_MULTIPLE"] = GetModConfigData "special_welfare_multiple"

local function l1ll1l1ll1ll1l1l1l1l(l1l11l11l1l1ll1ll1ll, ll11l1l1ll11ll1l1l1l)
    local l1l1l1l1l1l1l1ll1l11 ={}
    if l1l11l11l1l1ll1ll1ll:IsValid() and PREFAB_SKINS[l1l11l11l1l1ll1ll1ll["prefab"]] ~= nil then
        if ll11l1l1ll11ll1l1l1l ~= nil and ll11l1l1ll11ll1l1l1l:HasTag "player" then
            for ll11l1l1l1l1ll1l1l11, ll1l1l1l11ll1ll11ll1 in pairs(PREFAB_SKINS[l1l11l11l1l1ll1ll1ll["prefab"]])
            do
                if TheInventory:CheckClientOwnership(ll11l1l1ll11ll1l1l1l["userid"], ll1l1l1l11ll1ll11ll1) then
                    table["insert"](l1l1l1l1l1l1l1ll1l11, ll1l1l1l11ll1ll11ll1)
                end
            end
            if # l1l1l1l1l1l1l1ll1l11 > 0 then
                TheSim:ReskinEntity(l1l11l11l1l1ll1ll1ll["GUID"], l1l11l11l1l1ll1ll1ll["skinname"], l1l1l1l1l1l1l1ll1l11[math["random"](# l1l1l1l1l1l1l1ll1l11)], nil, ll11l1l1ll11ll1l1l1l["userid"])
            end
        end
    end

end

GLOBAL["setRandomSkinFgc"] = l1ll1l1ll1ll1l1l1l1l

local tumbleweed_loots = require "List/list_tumbleweed_loots"

local species_buffs ={"spice_garlic", "spice_sugar", "spice_chili", "spice_salt"}

local function CreateTumbleweedLoot(tumbleweed)
    local counter = 0
    for _, loot in ipairs(tumbleweed_loots) do
        counter = counter + loot["chance"]
    end
    tumbleweed["loot"] ={}
    local loot1 = nil 
    local loot2 = nil 
    local loot3 = nil 
    local loot4 = nil 
    local loot5 = nil 
    local loot6 = nil 
    local loot7 = 3
    while loot7 > 0
    do
        loot6 = math["random"]() * counter
        loot1 = nil
        loot2 = nil
        loot3 = nil
        for k, loot in ipairs(tumbleweed_loots) do
            loot6 = loot6 - loot["chance"]
            if loot6 <= 0 then
                if loot["item"] then
                    loot1 = loot["item"]
                else
                    loot1 = nil
                end
                if loot["aggro"] then
                    loot2 =true
                else
                    loot2 =false
                end
                if loot["pickfn"] then
                    loot3 = loot["pickfn"]
                else
                    loot3 = nil
                end
                if loot["announce"] then
                    loot4 = loot["announce"]
                else
                    loot4 = nil
                end
                if loot["compensation"] then
                    loot5 = loot["compensation"]
                else
                    loot5 = nil
                end
                break
            end
        end
        if loot1 ~= nil then
            table["insert"](tumbleweed["loot"],{item = loot1, aggro = loot2, announce = loot4, compensation = loot5})
            loot7 = loot7 - 1
        end
        if loot3 ~= nil then
            table["insert"](tumbleweed["loot"],{pickfn = loot3, compensation = loot5})
            loot7 = loot7 - 1
        end
    end

end

local function ll1ll1l11ll11ll11ll1(gz_fns, player)
    gz_fns["gz_onpickup"] =true
    local x, y, z = gz_fns["Transform"]:GetWorldPosition()
    CreateTumbleweedLoot(gz_fns)
    gz_fns:PushEvent "detachchild"
    for _, loot in ipairs(gz_fns["loot"])
    do
        if loot["pickfn"] ~= nil then
            loot["pickfn"](gz_fns, player)
            break
        else
            local prefab = SpawnPrefab(loot["item"])
            local prefab_name = loot["item"]
            if prefab ~= nil then
                if prefab:HasTag "preparedfood" then
                    if math["random"]() < TUNING["PREPAREDFOODS_SPICE_MULTIPLE"] then
                        local buffed_food = species_buffs[math["random"](1, # species_buffs)]
                        if buffed_food ~= nil then
                            prefab:Remove()
                            prefab = SpawnPrefab(loot["item"] .. "_" .. buffed_food)
                            prefab_name = prefab_name .. "_" .. buffed_food
                        end
                    end
                end
                prefab["Transform"]:SetPosition(x, y, z)
                if loot["item"] == "klaus" then
                    prefab:SpawnDeer()
                end
                l1ll1l1ll1ll1l1l1l1l(prefab, player)
                if prefab["components"]["inventoryitem"] ~= nil and prefab["components"]["inventoryitem"]["ondropfn"] ~= nil then
                    prefab["components"]["inventoryitem"]["ondropfn"](prefab)
                end
                if loot["aggro"] and prefab["components"]["combat"] ~= nil and player ~= nil then
                    if not (prefab:HasTag "spider" and (player:HasTag "spiderwhisperer" or player:HasTag "spiderdisguise" or (player:HasTag "monster" and not player:HasTag "player"))) then
                        prefab["components"]["combat"]:SuggestTarget(player)
                    end
                end
            end
        end
    end
    SpawnPrefab "tumbleweedbreakfx"["Transform"]:SetPosition(x, y, z)
    return (450-475 * 211+466-154 ~= - 99456)

end

local function ll1l11l1ll1l1ll1l1ll(l1ll1l11ll1l1ll1ll1l, l11ll1ll11l11ll11ll1)
    if math["random"]() <= TUNING["HAUNT_CHANCE_OCCASIONAL"] then
        ll1ll1l11ll11ll11ll1(l1ll1l11ll1l1ll1ll1l, nil)
        l1ll1l11ll1l1ll1ll1l:Remove()
    end
    return (string.sub("l1l11ll1l11l1l1ll1ll", 6, 13) == "ll1l11l1")

end

AddPrefabPostInit("tumbleweed", function(l1l11l1ll1l11l11ll1l)
    l1l11l1ll1l11l11ll1l:RemoveComponent "burnable" l1l11l1ll1l11l11ll1l:RemoveComponent "propagator" if l1l11l1ll1l11l11ll1l["components"]["pickable"] then
        l1l11l1ll1l11l11ll1l["components"]["pickable"]["onpickedfn"] = ll1ll1l11ll11ll11ll1
    end
    if l1l11l1ll1l11l11ll1l["components"]["hauntable"] then
        l1l11l1ll1l11l11ll1l["components"]["hauntable"]:SetOnHauntFn(ll1l11l1ll1l1ll1l1ll)
    end

end
)