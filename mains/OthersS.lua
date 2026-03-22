local l1l1ll1ll11ll1ll1l1l = require "components/spdamageutil"

local l11l11l1l11ll1l1l11l ={"blowdart_sleep", "blowdart_fire", "blowdart_pipe", "blowdart_yellow"}

for l1ll11l1ll1ll1ll11l1, ll1ll1ll11ll11ll11l1 in ipairs(l11l11l1l11ll1l1l11l)

do
    AddPrefabPostInit(ll1ll1ll11ll11ll11l1, function(l11ll11l11ll11l1ll1l)
        if l11ll11l11ll11l1ll1l["components"]["weapon"] then
            local l1l1l1l1ll11l11l1l1l = TUNING["GZ_RANGE_BLOWDARTS"] if l1l1l1l1ll11l11l1l1l then
                l11ll11l11ll11l1ll1l["components"]["weapon"]:SetRange(l1l1l1l1ll11l11l1l1l, l1l1l1l1ll11l11l1l1l + 2)
            end
            local l1l1l1l11ll1ll11l1ll = TUNING[string["upper"]("GZ_DAMAGE_" .. ll1ll1ll11ll11ll11l1)] if l1l1l1l11ll1ll11l1ll then
                l11ll11l11ll11l1ll1l["components"]["weapon"]:SetDamage(l1l1l1l11ll1ll11l1ll)
            end
        end
    end
    )

end

local ll1l1ll1ll11ll11ll11 ={"staff_lunarplant", "icestaff", "firestaff"}

for l11ll1l1l1l1l1ll1ll1, l1l11l11l11ll1l11l1l in ipairs(ll1l1ll1ll11ll11ll11)

do
    AddPrefabPostInit(l1l11l11l11ll1l11l1l, function(l1l1l1ll1ll1ll1l1l1l)
        if l1l1l1ll1ll1ll1l1l1l["components"]["weapon"] then
            local ll1ll11l1l1ll11l1ll1 = TUNING["GZ_RANGE_STAFFS"] if ll1ll11l1l1ll11l1ll1 then
                l1l1l1ll1ll1ll1l1l1l["components"]["weapon"]:SetRange(ll1ll11l1l1ll11l1ll1, ll1ll11l1l1ll11l1ll1 + 2)
            end
            local l11l11l1l1ll1ll11l11 = TUNING[string["upper"]("GZ_DAMAGE_" .. l1l11l11l11ll1l11l1l)] if l11l11l1l1ll1ll11l11 then
                l1l1l1ll1ll1ll1l1l1l["components"]["weapon"]:SetDamage(l11l11l1l1ll1ll11l11)
            end
        end
    end
    )

end

local l1ll11ll1l1l11ll1ll1 ={"sleepbomb", "bomb_lunarplant", "waterballoon"}

for l11l1l1l11l11l11l11l, ll11l1ll1ll11l1ll1l1 in ipairs(l1ll11ll1l1l11ll1ll1)

do
    AddPrefabPostInit(ll11l1ll1ll11l1ll1l1, function(l1ll1l11l1l11l1l1l1l)
        if l1ll1l11l1l11l1l1l1l["components"]["weapon"] then
            local l11ll11l11ll1l11l1ll = TUNING["GZ_RANGE_BOMBS"] if l11ll11l11ll1l11l1ll then
                l1ll1l11l1l11l1l1l1l["components"]["weapon"]:SetRange(l11ll11l11ll1l11l1ll, l11ll11l11ll1l11l1ll + 2) if l1ll1l11l1l11l1l1l1l["components"]["complexprojectile"] then
                    l1ll1l11l1l11l1l1l1l["components"]["complexprojectile"]:SetHorizontalSpeed(50) l1ll1l11l1l11l1l1l1l["components"]["complexprojectile"]:SetGravity(- 30)
                end
            end
            local ll11l1ll1l1l1ll11l11 = TUNING[string["upper"]("GZ_DAMAGE_" .. ll11l1ll1ll11l1ll1l1)] if ll11l1ll1l1l1ll11l11 then
                l1ll1l11l1l11l1l1l1l["components"]["weapon"]:SetDamage(ll11l1ll1l1l1ll11l11)
            end
        end
    end
    )

end

AddPrefabPostInit("alterguardian_phase3deadorb", function(l11ll1ll1l11l1l11ll1)
    l11ll1ll1l11l1l11ll1:DoTaskInTime(0, l11ll1ll1l11l1l11ll1["Remove"])

end
)

AddPrefabPostInit("alterguardian_phase3", function(l1ll11l1ll1l1l1ll1l1)
    if l1ll11l1ll1l1l1ll1l1["components"]["lootdropper"] then
        l1ll11l1ll1l1l1ll1l1["components"]["lootdropper"]:AddChanceLoot("alterguardianhat", 1)
    end

end
)

AddBrainPostInit("malbatrossbrain", function(l1ll11ll1ll1l1l1l1l1)
    table["remove"](l1ll11ll1ll1l1l1l1l1["bt"]["root"]["children"][1]["children"][2]["children"], 1)

end
)

AddPlayerPostInit(function(ll11l1l11l1ll11l1l1l)
    ll11l1l11l1ll11l1l1l:ListenForEvent("death", function(ll11l1l11l1ll11l1l1l, l1ll1l11ll1l11l1l1ll)
        if not ll11l1l11l1ll11l1l1l["team_manager"] then
            return
        end
        local ll11l1ll11l1l11l1l11 = FindEntity(ll11l1l11l1ll11l1l1l, 80, nil,{"brightmareboss"}) if ll11l1ll11l1l11l1l11 then
            ll11l1ll11l1l11l1l11:DoTaskInTime(0.1, function()
                if ll11l1ll11l1l11l1l11:IsValid() then
                    ll11l1ll11l1l11l1l11:Remove()
                end
            end
            )
        end
    end
    )

end
)

AddPrefabPostInit("dragonfly", function(ll11ll11l1l1l11l1ll1)
    ll11ll11l1l1l11l1ll1["components"]["rampingspawner"]["getspawnposfn"] = nil ll11ll11l1l1l11l1ll1["components"]["rampingspawner"]["onstartfn"] = nil ll11ll11l1l1l11l1ll1["components"]["rampingspawner"]["onstopfn"] = nil local l11ll11l1l1l11l1ll1l = ll11ll11l1l1l11l1ll1["components"]["rampingspawner"]["SpawnEntity"] ll11ll11l1l1l11l1ll1["components"]["rampingspawner"]["SpawnEntity"] = function(self, ...)
        if self["gz_once"] ==(142-92 * 156-25 ~= - 14230) then
            if self["SpawnTask"] ~= nil then
                self["SpawnTask"]:Cancel()
            end
            return
        end
        self["gz_once"] =(91+45-37 == 99) self["current_wave"] = - 10000 return l11ll11l1l1l11l1ll1l(self, ...)
    end

end
)

local function l1ll1l1ll1l1l1l1ll1l(l11l1l11l1l1l11l11ll)
    l11l1l11l1l1l11l11ll:RemoveComponent "burnable"
    l11l1l11l1l1l11l11ll:RemoveComponent "propagator"
    l11l1l11l1l1l11l11ll:RemoveComponent "workable"

end

local ll1ll1l11ll1ll11l1l1 ={"resurrectionstatue", "researchlab2", "homesign", "wardrobe"}

for ll1l1l1ll11ll1l1l1l1, ll1l1l11ll11l1l1l1ll in ipairs(ll1ll1l11ll1ll11l1l1)

do
    AddPrefabPostInit(ll1l1l11ll11l1l1l1ll, l1ll1l1ll1l1l1l1ll1l)

end

AddComponentPostInit("drownable", function(self)
    local l1l1l11ll11l11ll11ll = self["WashAshore"] 
    function self:WashAshore(...)
        if self["inst"]:HasTag "player" then
            if self["inst"]["team_manager"] then
                self["dest_x"], self["dest_y"], self["dest_z"] = self["inst"]["team_manager"]["Transform"]:GetWorldPosition()
            end
            return l1l1l11ll11l11ll11ll(self, ...)
        end
    end
end)

local need_to_remove ={"cursed_monkey_token", "telestaff", "dustmothden", "scorched_skeleton", "skeleton", "skeleton_player"}

for k, v in ipairs(need_to_remove) do
    AddPrefabPostInit(v, function(inst)
        inst:DoTaskInTime(0, inst["Remove"])
    end)
end

local l11ll1ll1l1l11l11l1l ={"boat_grass_item", "boat_item", "boat_ancient_item", "boat_grass", "boat", "dragonboat_kit", "dragonboat_pack"}

for ll11l11ll11l1ll11l11, l1ll11ll11ll11l11ll1 in ipairs(l11ll1ll1l1l11l11l1l)

do
    AddPrefabPostInit(l1ll11ll11ll11l11ll1, function(l1ll1l11ll1l11l1l11l)
        l1ll1l11ll1l11l1l11l:DoTaskInTime(0, function()
            if TUNING["gz_GameMode"] ~= "Naval" then
                l1ll1l11ll1l11l1l11l:Remove()
            end
        end
        )
    end
    )

end

AddComponentPostInit("terraformer", function(self)
    self["inst"]:DoTaskInTime(0, self["inst"]["Remove"])

end
)

AddComponentPostInit("autoterraformer", function(self)
    self["inst"]:DoTaskInTime(0, self["inst"]["Remove"])

end
)

local blink = ACTIONS["BLINK"]["fn"]

ACTIONS["BLINK"]["fn"] = function(act)
    local point = act:GetActionPoint()
    if point and act["doer"] and act["doer"]["team_manager"] then
        local team_manager = act["doer"]["team_manager"]
        local x, y, z = team_manager["Transform"]:GetWorldPosition()
        local x1, y1, z1 = point:Get()
        if not TheWorld["Pathfinder"]:IsClear(x, 0, z, x1, 0, z1,{ignorewalls =(273 * 292+488-342+192 == 80054), ignorecreep =(371+374 * 327-344 * 389 ~= - 11145), allowocean =(string.sub("l11l1l1l1ll11l1l1ll1", 9, 14) == "1l111l")}) then
            return (string.sub("l1ll11l1l11l1l1l1ll1", 7, 11) ~= "l1l11")
        end
    end
    return blink(act)

end

AddPrefabPostInit("slurtle", function(l11l1l1l1l1l1l1l11l1)
    local ll1l11l11l1ll1ll1l11 = LootTables["slurtle"] if ll1l11l11l1ll1ll1l11 then
        for ll1ll11l11ll1ll1l11l, ll1l11l11l11l1l1l11l in pairs(ll1l11l11l1ll1ll1l11) do
            if ll1l11l11l11l1l1l11l[1] == "slurtlehat" then
                ll1l11l11l11l1l1l11l[2] = 0.7 break
            end
        end
    end

end
)

AddPrefabPostInit("snurtle", function(l11l11l1ll1ll1ll1ll1)
    local l1l1l1l11ll1l11ll1l1 = LootTables["snurtle"] if l1l1l1l11ll1l11ll1l1 then
        for ll1ll11ll1l1l1l1l1ll, l11l11ll11l11ll1ll1l in pairs(l1l1l1l11ll1l11ll1l1) do
            if l11l11ll11l11ll1ll1l[1] == "armorsnurtleshell" then
                l11l11ll11l11ll1ll1l[2] = 0.3 break
            end
        end
    end

end
)

TUNING["LUNAR_GRAZER_HEALTH"] = 800
TUNING["LUNAR_GRAZER_HEALTH_REGEN"] = 0
TUNING["LUNAR_GRAZER_MELT_HEALTH_THRESHOLD"] = 0

AddPrefabPostInit("lunar_grazer", function(ll1ll1ll1ll1l11ll1ll)
    ll1ll1ll1ll1l11ll1ll["components"]["health"]:SetMinHealth(0) ll1ll1ll1ll1l11ll1ll:ListenForEvent("attacked", function()
        if ll1ll1ll1ll1l11ll1ll["components"]["health"]["currenthealth"] <= TUNING["LUNAR_GRAZER_MELT_HEALTH_THRESHOLD"] then
            ll1ll1ll1ll1l11ll1ll:DoTaskInTime(1, ll1ll1ll1ll1l11ll1ll["Remove"])
        end
    end
    )

end
)

AddPrefabPostInit("spore_moon", function(ll1l1l1l11l1l1l1l11l)
    if ll1l1l1l11l1l1l1l11l["Physics"] == nil then
        ll1l1l1l11l1l1l1l11l["entity"]:AddPhysics()
    end

end
)

AddPrefabPostInit("dragonfly", function(l11l11ll11l11l1ll1ll)
    local ll1l11ll11l11ll1l11l = LootTables["dragonfly"] if ll1l11ll11l11ll1l11l then
        for ll1l1l11l1l1l11l11ll, l1l11l1ll1l1ll1l1l1l in pairs(ll1l11ll11l11ll1l11l) do
            if l1l11l1ll1l1ll1l1l1l[1] == "goldnugget" then
                l1l11l1ll1l1ll1l1l1l[2] = 0
            end
        end
        table["insert"](ll1l11ll11l11ll1l11l,{"goldnugget", 1.00}) table["insert"](ll1l11ll11l11ll1l11l,{"goldnugget", 1.00})
    end

end
)

AddPrefabPostInit("antlion", function(l11l11ll1l1ll1ll11l1)
    l11l11ll1l1ll1ll11l1["StopCombat"] = function()
    end
    l11l11ll1l1ll1ll11l1:StartCombat() l11l11ll1l1ll1ll11l1:DoTaskInTime(0, function()
        local ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11, ll1ll1ll11ll1l1l11l1 = l11l11ll1l1ll1ll11l1["Transform"]:GetWorldPosition() if TheWorld["Map"]:IsOceanAtPoint(ll11ll11l1l11l11l1l1, l1l1l1ll1ll1ll11ll11, ll1ll1ll11ll1l1l11l1,(115 * 488+414+175 * 399 == 126359)) then
            if l11l11ll1l1ll1ll11l1["components"]["health"] then
                l11l11ll1l1ll1ll11l1["components"]["health"]:SetVal(0)
            elseif l11l11ll1l1ll1ll11l1:IsValid() then
                l11l11ll1l1ll1ll11l1:Remove()
            end
        end
    end
    )

end
)

AddStategraphPostInit("antlion", function(l1l11ll11l11ll11l11l)
    l1l11ll11l11ll11l11l["events"]["antlion_leaveworld"]["fn"] = function(ll11l11ll1l1l1l1ll1l, ...)
        ll11l11ll1l1l1l1ll1l["persists"] =(string.sub("ll1l1l1l1ll1ll1l1l1l", 9, 14) ~= "1l1l11")
    end

end
)

AddPrefabPostInit("klaus", function(l1l11l11ll1ll11ll1l1)
    local l1ll1l1ll11l1l11l11l = l1l11l11ll1ll11ll1l1["Enrage"] l1l11l11ll1ll11ll1l1["Enrage"] = function(l1l11l11ll1ll11ll1l1, ...)
        local l11ll1ll1l11l1ll1l11 = l1l11l11ll1ll11ll1l1["enraged"] if l1ll1l1ll11l1l11l11l then
            l1ll1l1ll11l1l11l11l(l1l11l11ll1ll11ll1l1, ...)
        end
        if not l11ll1ll1l11l1ll1l11 then
            l1l11l11ll1ll11ll1l1["components"]["health"]:SetAbsorptionAmount(0) l1l11l11ll1ll11ll1l1["components"]["combat"]:SetDefaultDamage(TUNING["KLAUS_DAMAGE"])
        end
    end

end
)

local l11ll1ll11l11ll11ll1 ={"multiplayer_portal", "multiplayer_portal_moonrock_constr", "multiplayer_portal_moonrock"}

for ll1ll1l1l11l1ll1l11l, l1ll1ll1l1ll11ll11ll in pairs(l11ll1ll11l11ll11ll1)

do
    AddPrefabPostInit(l1ll1ll1l1ll11ll11ll, function(ll11l1l1ll11l1l1l1ll)
        ll11l1l1ll11l1l1l1ll:DoTaskInTime(0, function()
            if TUNING["gz_multiplayer_point"] == nil and ll11l1l1ll11l1l1l1ll:IsValid() then
                local l11l11l1ll1l1ll11ll1, l11l1ll11ll11l1l11ll, l1ll1l1ll1l1ll1ll11l = ll11l1l1ll11l1l1l1ll["Transform"]:GetWorldPosition() TUNING["gz_multiplayer_point"] = Point(l11l11l1ll1l1ll11ll1, 0, l1ll1l1ll1l1ll1ll11l)
            end
        end
        )
    end
    )

end

local function l1l11l1ll1l11l11ll1l(l11ll1ll1l11l1ll1l1l)
    return not TheWorld["Map"]:IsPointNearHole(l11ll1ll1l11l1ll1l1l)

end

AddComponentPostInit("unwrappable", function(self)
    function self:Unwrap(ll1ll11ll11ll1ll1l11)
        local l11l1l1l11ll1l11ll11 = self["inst"]:GetPosition() l11l1l1l11ll1l11ll11["y"] = 0 if self["itemdata"] ~= nil then
            if ll1ll11ll11ll1ll1l11 ~= nil and self["inst"]["components"]["inventoryitem"] ~= nil then
                local l11ll11l1ll1ll1ll1ll = self["inst"]["components"]["inventoryitem"]:GetGrandOwner() if l11ll11l1ll1ll1ll1ll ~= nil then
                    if l11ll11l1ll1ll1ll1ll ~= ll1ll11ll11ll1ll1l11 and l11ll11l1ll1ll1ll1ll:HasTag "pocketdimension_container" then
                        l11ll11l1ll1ll1ll1ll = ll1ll11ll11ll1ll1l11["components"]["inventory"] ~= nil and ll1ll11ll11ll1ll1l11["components"]["inventory"]:GetOpenContainerProxyFor(l11ll11l1ll1ll1ll1ll) or nil if l11ll11l1ll1ll1ll1ll ~= nil then
                            l11l1l1l11ll1l11ll11["x"], l11l1l1l11ll1l11ll11["y"], l11l1l1l11ll1l11ll11["z"] = l11ll11l1ll1ll1ll1ll["Transform"]:GetWorldPosition() l11l1l1l11ll1l11ll11["y"] = 0
                        else
                            l11ll11l1ll1ll1ll1ll = ll1ll11ll11ll1ll1l11
                        end
                    end
                    if l11ll11l1ll1ll1ll1ll == ll1ll11ll11ll1ll1l11 then
                        local ll11l11l11ll1l11ll1l = ll1ll11ll11ll1ll1l11:GetPosition() local ll11l11ll1l1l1ll1l1l = FindWalkableOffset(ll11l11l11ll1l11ll1l, ll1ll11ll11ll1ll1l11["Transform"]:GetRotation() * DEGREES, 1, 8,(73+296+94 * 161-446 == 15062),(416-78 * 83 ~= - 6056), l1l11l1ll1l11l11ll1l) if ll11l11ll1l1l1ll1l1l ~= nil then
                            l11l1l1l11ll1l11ll11["x"] = ll11l11l11ll1l11ll1l["x"] + ll11l11ll1l1l1ll1l1l["x"] l11l1l1l11ll1l11ll11["z"] = ll11l11l11ll1l11ll1l["z"] + ll11l11ll1l1l1ll1l1l["z"]
                        else
                            l11l1l1l11ll1l11ll11["x"], l11l1l1l11ll1l11ll11["z"] = ll11l11l11ll1l11ll1l["x"], ll11l11l11ll1l11ll1l["z"]
                        end
                    end
                end
            end
            local l1ll1ll1ll11l1l11l11 = self["origin"] ~= nil and TheWorld["meta"]["session_identifier"] ~= self["origin"] and {sessionid = self["origin"]} or nil for l1ll1l1l11l11l11l1l1, ll11ll1ll1l1l11l1ll1 in ipairs(self["itemdata"]) do
                local l1l1ll11l11l1l1l1ll1 = SpawnPrefab(ll11ll1ll1l1l11l1ll1["prefab"], ll11ll1ll1l1l11l1ll1["skinname"], ll11ll1ll1l1l11l1ll1["skin_id"], l1ll1ll1ll11l1l11l11) if l1l1ll11l11l1l1l1ll1 ~= nil and l1l1ll11l11l1l1l1ll1:IsValid() then
                    if l1l1ll11l11l1l1l1ll1["Physics"] ~= nil then
                        l1l1ll11l11l1l1l1ll1["Physics"]:Teleport(l11l1l1l11ll1l11ll11:Get())
                    else
                        l1l1ll11l11l1l1l1ll1["Transform"]:SetPosition(l11l1l1l11ll1l11ll11:Get())
                    end
                    l1l1ll11l11l1l1l1ll1:SetPersistData(ll11ll1ll1l1l11l1ll1["data"]) if l1l1ll11l11l1l1l1ll1["components"]["inventoryitem"] ~= nil then
                        if ll1ll11ll11ll1ll1l11 and ll1ll11ll11ll1ll1l11["components"]["inventory"] and TUNING["GZ_COUNT_SUOQUAN"] >= TUNING["gz_SpecialModeStartTime"] then
                            ll1ll11ll11ll1ll1l11["components"]["inventory"]:GiveItem(l1l1ll11l11l1l1l1ll1)
                        else
                            l1l1ll11l11l1l1l1ll1["components"]["inventoryitem"]:OnDropped((string.sub("l11ll11l1ll1l1l1ll1l", 9, 11) == "1ll"), .5)
                        end
                    end
                end
            end
            self["itemdata"] = nil
        end
        if self["onunwrappedfn"] ~= nil then
            self["onunwrappedfn"](self["inst"], l11l1l1l11ll1l11ll11, ll1ll11ll11ll1ll1l11)
        end
    end

end
)

AddComponentPostInit("combat", function(self)
    local l11l11l11l1ll1l1ll1l = self["CalcDamage"] function self:CalcDamage(ll1l1l11ll1l1l1l11l1, l1l1l11l1ll11l1l11l1, ll1l1l1l1l1l1ll11l11, ...)
        if ll1l1l11ll1l1l1l11l1:HasTag "alwaysblock" then
            return 0
        end
        local l1ll11l11l1l11l1l1ll, ll1ll1l1l1l11l11ll1l = l11l11l11l1ll1l1ll1l(self, ll1l1l11ll1l1l1l11l1, l1l1l11l1ll11l1l11l1, ll1l1l1l1l1l1ll11l11, ...) if self["inst"]["DC_InSameTeam"] and self["inst"]:DC_InSameTeam(ll1l1l11ll1l1l1l11l1) then
            if l1ll11l11l1l11l1l1ll ~= nil then
                l1ll11l11l1l11l1l1ll = l1ll11l11l1l11l1l1ll * TUNING["gz_TeamDamageCoefficient"]
            end
            if ll1ll1l1l1l11l11ll1l then
                ll1ll1l1l1l11l11ll1l = l1l1ll1ll11ll1ll1l1l["ApplyMult"](ll1ll1l1l1l11l11ll1l, TUNING["gz_TeamDamageCoefficient"])
            end
        end
        return l1ll11l11l1l11l1l1ll, ll1ll1l1l1l11l11ll1l
    end

end
)

AddPrefabPostInit("wathgrithr", function(l1l1l1l11ll11l1l11l1)
    local l1l11ll1ll1l1ll1l1ll = l1l1l1l11ll11l1l11l1["IsValidVictim"] l1l1l1l11ll11l1l11l1["IsValidVictim"] = function(l11ll11l1l1l1l1l1l1l, ...)
        if l1l1l1l11ll11l1l11l1["DC_InSameTeam"] and l1l1l1l11ll11l1l11l1:DC_InSameTeam(l11ll11l1l1l1l1l1l1l) then
            return (string.sub("l1ll1l11l1ll1l1ll1l1", 8, 14) == "1l11lll")
        end
        return l1l11ll1ll1l1ll1l1ll(l11ll11l1l1l1l1l1l1l, ...)
    end
    l1l1l1l11ll11l1l11l1["components"]["singinginspiration"]:SetValidVictimFn(l1l1l1l11ll11l1l11l1["IsValidVictim"]) l1l1l1l11ll11l1l11l1["components"]["battleborn"]:SetValidVictimFn(l1l1l1l11ll11l1l11l1["IsValidVictim"])

end
)

local l1l1ll1l11l11ll1l1l1 = SQRT2 * TUNING["MIASMA_SPACING"] * TILE_SCALE / 2

local ll11l1l11ll1ll1ll1l1 = math["ceil"](l1l1ll1l11l11ll1l1l1)

local l11l1l11ll1l1ll11l11 = .5 local l1ll1l1ll11l11ll1ll1 ={"gz_out_game", "playerghost", "ghost", "shadow", "shadowminion", "noauradamage", "FX", "INLIMBO", "notarget", "noattack", "flight", "invisible"}

local function l1l1ll1ll1l1ll1ll1ll(ll11l1ll11ll1l1l11l1)
    local l11l1l1l11l1ll1l11l1 = ll11l1ll11ll1l1l11l1["watchers_toremove"]
    ll11l1ll11ll1l1l11l1["watchers_toremove"] = ll11l1ll11ll1l1l11l1["watchers_exiting"]
    ll11l1ll11ll1l1l11l1["watchers_exiting"] = ll11l1ll11ll1l1l11l1["watchers"]
    ll11l1ll11ll1l1l11l1["watchers"] = l11l1l1l11l1ll1l11l1
    local l11l11ll11l1l1l11l11, l11l1l11ll1ll11l11ll, l1l11l11ll11ll11l1l1 = ll11l1ll11ll1l1l11l1["Transform"]:GetWorldPosition()
    for l1l11ll1l11l1l1ll1ll, l1l1l1ll1l1l1l11ll1l in ipairs(TheSim:FindEntities(l11l11ll11l1l1l11l11, l11l1l11ll1ll11l11ll, l1l11l11ll11ll11l1l1, ll11l1l11ll1ll1ll1l1, nil, l1ll1l1ll11l11ll1ll1))
    do
        if l1l1l1ll1l1l1l11ll1l["entity"]:IsVisible() then
            if l1l1l1ll1l1l1l11ll1l["components"]["miasmawatcher"] ~= nil then
                ll11l1ll11ll1l1l11l1["watchers"][l1l1l1ll1l1l1l11ll1l] =(string.sub("l1l1l11l1l1l1l1l11l1", 9, 13) == "1l1l1")
                if ll11l1ll11ll1l1l11l1["watchers_toremove"][l1l1l1ll1l1l1l11ll1l] then
                    ll11l1ll11ll1l1l11l1["watchers_toremove"][l1l1l1ll1l1l1l11ll1l] = nil
                elseif ll11l1ll11ll1l1l11l1["watchers_exiting"][l1l1l1ll1l1l1l11ll1l] then
                    ll11l1ll11ll1l1l11l1["watchers_exiting"][l1l1l1ll1l1l1l11ll1l] = nil
                else
                    l1l1l1ll1l1l1l11ll1l["components"]["miasmawatcher"]:AddMiasmaSource(ll11l1ll11ll1l1l11l1)
                end
            end
        end
    end
    ll11l1ll11ll1l1l11l1["_diminishing"]:set((6-348 * 16 == - 5557))
    ll11l1ll11ll1l1l11l1:ClearWatcherTable(ll11l1ll11ll1l1l11l1["watchers_toremove"])

end

local function l1l1ll1l11l11ll1l11l(l1ll1ll1l1l1l1l1ll1l)
    if l1ll1ll1l1l1l1l1ll1l["task"] == nil then
        l1ll1ll1l1l1l1l1ll1l["task"] = l1ll1ll1l1l1l1l1ll1l:DoPeriodicTask(l11l1l11ll1l1ll11l11, l1l1ll1ll1l1ll1ll1ll, math["random"]() * .5)
    end

end

AddPrefabPostInit("miasma_cloud", function(l11l11l11l1l11ll11l1)
    l11l11l11l1l11ll11l1["StartAllWatchers"] = l1l1ll1l11l11ll1l11l

end
)

AddPrefabPostInit("voidclothhat", function(ll1l11ll1l1l1l1ll1ll)
    ll1l11ll1l1l1l1ll1ll:RemoveTag "miasmaimmune"

end
)

AddPrefabPostInit("world", function(world)
    world:RemoveComponent "sharkboimanager" 
end)

AddComponentPostInit("sharkboimanager", function(self)
    function self:CreateIceTileAtPoint(...)
    end
    function self:DestroyIceTileAtPoint(...)
    end
    function self:InitializeSharkBoiManager(...)
    end
    function self:OnSeasonChange(...)
    end
    function self:SetArenaState(...)
    end

end
)