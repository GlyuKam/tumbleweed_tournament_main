local l11ll1l1ll11l1ll1l11 = "fx/miasma.tex"

local l11l1l11l1l1l11ll1ll = "shaders/vfx_particle.ksh"

local l1l1l1ll1ll11ll1l1l1 = "miasma_cloud_colourenvelope_smoke"

local l11l1l1l1ll1l1l11ll1 = "miasma_cloud_scaleenvelope_smoke"

local ll1l1ll1ll11ll11ll11 = "fx/snow.tex"

local l11ll1l1ll1ll11l1l1l = "shaders/vfx_particle_add.ksh"

local ll11l11l1ll1l1l11l1l = "miasma_cloud_colourenvelope_ember"

local l11l1ll1l11ll1l1l1l1 = "miasma_cloud_scaleenvelope_ember"

local l1l1ll1l1ll1ll1ll1ll ={"miasmadebuff", "miasma_cloud_fx"}

local l1l11l1l11l1l1l11ll1 ={Asset("IMAGE", l11ll1l1ll11l1ll1l11), Asset("IMAGE", ll1l1ll1ll11ll11ll11), Asset("SHADER", l11l1l11l1l1l11ll1ll), Asset("SHADER", l11ll1l1ll1ll11l1l1l)}

local l1l1l1l1ll11ll1l11ll = 0.8

local l11ll11l11ll1l1ll1ll = 5.0

local ll11l1l1l1l11ll11l11 = 0.25

local l1l1l1l1l1l1ll1l1ll1 = 1.5

local ll1l1l11l11l1l11ll1l = SQRT2 * TUNING["MIASMA_SPACING"] * TILE_SCALE / 2

local l11l1l1ll1l1ll11ll11 = ll1l1l11l11l1l11ll1l / 2

local l11l11l11ll11l1l11l1 = math["ceil"](ll1l1l11l11l1l11ll1l)

local ll1l1ll1l1l11ll1l1ll = l11l11l11ll11l1l11l1 - l1l1l1l1ll11ll1l11ll * 1.3

local l1l1ll1l11l11l11l1l1 = 0

local function ll11l1l1ll11l11ll1l1(l1ll1l11l11l1l1ll1ll)
    return l1l1ll1l11l11l11l1l1

end

local l1l1l11l11ll1l1l1l1l = nil local function ll1l1l11l11ll1ll1l1l(l11l1ll1l1l11ll1ll11)
    l1l1l11l11ll1l1l1l1l[l11l1ll1l1l11ll1ll11] = nil

end

local ll11ll11l1l1l11ll1l1 = nil local l1l11l11ll1l1ll1l11l = nil local l1ll1l11l11l11ll11l1 = nil local function l11l11l1ll11l1l11l1l(l1l11ll11l11ll11l1l1)
    local ll1ll1ll1ll11ll1l1l1 = TheCamera:GetHeading()
    if ll1ll1ll1ll11ll1l1l1 ~= ll11ll11l1l1l11ll1l1 then
        ll11ll11l1l1l11ll1l1 = ll1ll1ll1ll11ll1l1l1
        l1l11l11ll1l1ll1l11l = math["cos"](ll11ll11l1l1l11ll1l1 * DEGREES)
        l1ll1l11l11l11ll11l1 = math["sin"](ll11ll11l1l1l11ll1l1 * DEGREES)
        local l1ll1l1l11l11l11l1l1, l1ll1l11l11l11l11ll1 = l1l11l11ll1l1ll1l11l * l11l1l1ll1l1ll11ll11, l1ll1l11l11l11ll11l1 * l11l1l1ll1l1ll11ll11
        for l1l11l1l11l1ll1l11ll, l1l1ll1l1ll1l1ll1l11 in pairs(l1l1l11l11ll1l1l1l1l)
        do
            l1l11l1l11l1ll1l11ll["_front_cloud_fx"]["Transform"]:SetPosition(l1ll1l1l11l11l11l1l1, 0, l1ll1l11l11l11l11ll1)
            l1l11l1l11l1ll1l11ll["_back_cloud_fx"]["Transform"]:SetPosition(- l1ll1l1l11l11l11l1l1, 0, - l1ll1l11l11l11l11ll1)
        end
    end

end

local function l11ll11l11ll11l11ll1(l11l11l1l11l1l1ll1ll)
    local l1l1ll1l1l11l1ll1l11 = TheCamera:GetHeading()
    if l1l1ll1l1l11l1ll1l11 ~= ll11ll11l1l1l11ll1l1 then
        ll11ll11l1l1l11ll1l1 = l1l1ll1l1l11l1ll1l11
        l1l11l11ll1l1ll1l11l = math["cos"](ll11ll11l1l1l11ll1l1 * DEGREES)
        l1ll1l11l11l11ll11l1 = math["sin"](ll11ll11l1l1l11ll1l1 * DEGREES)
    end
    local ll11ll1l11l1l11l1l11, ll1ll11l1l11l1ll1l11 = l1l11l11ll1l1ll1l11l * l11l1l1ll1l1ll11ll11, l1ll1l11l11l11ll11l1 * l11l1l1ll1l1ll11ll11
    l11l11l1l11l1l1ll1ll["_front_cloud_fx"]["Transform"]:SetPosition(ll11ll1l11l1l11l1l11, 0, ll1ll11l1l11l1ll1l11)
    l11l11l1l11l1l1ll1ll["_back_cloud_fx"]["Transform"]:SetPosition(- ll11ll1l11l1l11l1l11, 0, - ll1ll11l1l11l1ll1l11)

end

local function ll11ll11l1l1ll11ll11(l11ll1l11ll11l1l11l1, l1l1ll1l1l1l1l11l1l1, l1l1l1l11ll1l1ll1l1l, l1l1l1l1l11l1ll11l11)
    return {l11ll1l11ll11l1l11l1 / 255, l1l1ll1l1l1l1l11l1l1 / 255, l1l1l1l11ll1l1ll1l1l / 255, l1l1l1l1l11l1ll11l11 / 255}

end

local function l1l1l11l1ll1ll1ll1l1()
    EnvelopeManager:AddColourEnvelope(l1l1l1ll1ll11ll1l1l1,{{0, ll11ll11l1l1ll11ll11(255, 255, 255, 0)},{.1, ll11ll11l1l1ll11ll11(255, 255, 255, 255)},{.9, ll11ll11l1l1ll11ll11(255, 255, 255, 255)},{1, ll11ll11l1l1ll11ll11(255, 255, 255, 0)}})
    local ll1l1l11l1l1ll11l1ll = l1l1l1l1ll11ll1l11ll
    EnvelopeManager:AddVector2Envelope(l11l1l1l1ll1l1l11ll1,{{0,{ll1l1l11l1l1ll11l1ll, ll1l1l11l1l1ll11l1ll}},{1,{ll1l1l11l1l1ll11l1ll * 0.8, ll1l1l11l1l1ll11l1ll * 0.8}}})
    EnvelopeManager:AddColourEnvelope(ll11l11l1ll1l1l11l1l,{{0, ll11ll11l1l1ll11ll11(200, 85, 60, 25)},{.2, ll11ll11l1l1ll11ll11(230, 140, 90, 200)},{.3, ll11ll11l1l1ll11ll11(255, 90, 70, 255)},{.6, ll11ll11l1l1ll11ll11(255, 90, 70, 255)},{.9, ll11ll11l1l1ll11ll11(255, 90, 70, 230)},{1, ll11ll11l1l1ll11ll11(255, 70, 70, 0)}})
    local l11ll1ll1ll1ll1ll11l = 0.7
    EnvelopeManager:AddVector2Envelope(l11l1ll1l11ll1l1l1l1,{{0,{l11ll1ll1ll1ll1ll11l, l11ll1ll1ll1ll1ll11l}},{0.5,{l11ll1ll1ll1ll1ll11l * 0.8, l11ll1ll1ll1ll1ll11l * 0.8}},{1,{l11ll1ll1ll1ll1ll11l * 0.1, l11ll1ll1ll1ll1ll11l * 0.1}}})
    l1l1l11l1ll1ll1ll1l1 = nil ll11ll11l1l1ll11ll11 = nil

end

local l1l1ll11ll1l11l1l1ll = 4 * 4

local ll1l11ll1ll11ll11l1l = 40 * 40

local function l1ll1l1ll11l1l1l11ll(ll11l1l1l1l1ll1l1ll1, l11l11l11ll1ll1l11ll, ll11ll11l1l11l1l1ll1, ll1ll11l1l1l11l1ll1l, l1ll11l11l1l1l11l1ll, l11ll1l1ll1ll11ll1l1, l1ll1l1ll1ll11ll11ll, l11l1l11l1ll1ll1l11l)
    local l1l1l1l11ll1l1l1ll1l, l11l1l11ll11l11l1l11, l11l11ll11l11l1ll11l = l11l11l11ll1ll1l11ll()
    local ll1l11ll1ll11ll1l1l1, l1l1l1ll1l1l1l1ll1l1, l11ll1ll11l11l11ll11 = .06 * UnitRand(), 0.2+0.3 * math["random"](), .06 * UnitRand()
    ll11l1l1l1l1ll1l1ll1:AddParticle(1, l1l1l1l1l1l1ll1l1ll1 *(math["random"]() * 0.5+0.5), ll11ll11l1l11l1l1ll1 + l1l1l1l11ll1l1l1ll1l, 0-l11l1l11ll11l11l1l11, l1ll11l11l1l1l11l1ll + l11l11ll11l11l1ll11l, l11ll1l1ll1ll11ll1l1 + ll1l11ll1ll11ll1l1l1, l1ll1l1ll1ll11ll11ll + l1l1l1ll1l1l1l1ll1l1, l11l1l11l1ll1ll1l11l + l11ll1ll11l11l11ll11)

end

local function l1ll1l11l1l1l1ll1l11(l1l11l1ll11l1l11ll11, l1ll1ll1l1l11l1l1l11, ll11l1l1l1l1l11l1ll1, ll1ll11ll1l1ll1l1ll1, l1l11l1l1l1ll1l1ll1l, l1ll1ll1l11ll11ll11l, l11l11ll1l1ll1l1ll11, ll1l1l1l1l1ll1l11ll1, l11l1ll11l1l11l1l11l, l1l1l1l11ll11l1l11l1, ll1ll1ll1ll1l11l1l1l)
    local ll1l1ll1l1l1l11l11l1, l1l11l1l1l1ll1l1ll11 = l1ll1ll1l1l11l1l1l11()
    if l11l1ll11l1l11l1l11l then
        if ll1l1ll1l1l1l11l11l1 < 0 then
            ll1l1ll1l1l1l11l11l1 = - ll1l1ll1l1l1l11l11l1
        end
        ll1l1ll1l1l1l11l11l1 = ll1l1ll1l1l1l11l11l1 - l11l1l1ll1l1ll11ll11
    else
        if ll1l1ll1l1l1l11l11l1 > 0 then
            ll1l1ll1l1l1l11l11l1 = - ll1l1ll1l1l1l11l11l1
        end
        ll1l1ll1l1l1l11l11l1 = ll1l1ll1l1l1l11l11l1 + l11l1l1ll1l1ll11ll11
    end
    if ll11ll11l1l1l11ll1l1 then
        ll1l1ll1l1l1l11l11l1, l1l11l1l1l1ll1l1ll11 = ll1l1ll1l1l1l11l11l1 * l1l11l11ll1l1ll1l11l - l1l11l1l1l1ll1l1ll11 * l1ll1l11l11l11ll11l1, ll1l1ll1l1l1l11l11l1 * l1ll1l11l11l11ll11l1 + l1l11l1l1l1ll1l1ll11 * l1l11l11ll1l1ll1l11l
    end
    l1ll1ll1l11ll11ll11l, l11l11ll1l1ll1l1ll11 = l1ll1ll1l11ll11ll11l + l1l11l1l1l1ll1l1ll11, l11l11ll1l1ll1l1ll11 + l1l11l1l1l1ll1l1ll11
    local l11l1l11l11l11ll1l11, l11ll1ll11ll11l1l1ll = ll1ll11ll1l1ll1l1ll1 - l1ll1ll1l11ll11ll11l, l1l11l1l1l1ll1l1ll1l - l11l11ll1l1ll1l1ll11
    local l11ll11ll11l1ll11l11 = l11l1l11l11l11ll1l11 * l11l1l11l11l11ll1l11 + l11ll1ll11ll11l1l1ll * l11ll1ll11ll11l1l1ll
    if l11ll11ll11l1ll11l11 > ll1l11ll1ll11ll11l1l then
        return
    end
    if not l1l1l1l11ll11l1l11l1["Map"]:IsVisualGroundAtPoint(l1ll1ll1l11ll11ll11l, 0, l11l11ll1l1ll1l1ll11) then
        return
    end
    local l1ll1l1l1ll11ll11l11, l1l1l11ll1ll11l1l1l1, l1l11l1ll1l11l11ll11 = .01 * UnitRand(), 0.005 * UnitRand(), .01 * UnitRand()
    local l1l11ll11ll1l1l1ll11 = l11ll11l11ll1l1ll1ll
    local l1l1l1l11l11l11l1ll1 = 0.5 *(1+math["random"]())
    if ll1l1l1l1l1ll1l11ll1 then
        for ll1ll1l1ll11ll1ll1ll = 1, 8
        do
            l1ll1l1ll11l1l1l11ll(l1l11l1ll11l1l11ll11, ll11l1l1l1l1l11l1ll1, ll1l1ll1l1l1l11l11l1, l1l1l1l11l11l11l1ll1, l1l11l1l1l1ll1l1ll11, l1ll1l1l1ll11ll11l11, l1l1l11ll1ll11l1l1l1, l1l11l1ll1l11l11ll11)
        end
        if math["random"]() < 0.75 then
            return
        end
        l1l11ll11ll1l1l1ll11 = l1l11ll11ll1l1l1ll11 * ll11l1l1l1l11ll11l11
        l1l1l11ll1ll11l1l1l1 = l1l1l11ll1ll11l1l1l1 + 0.3
    end
    local ll1l1l11l1l11l1l1l1l = math["random"](0, 1) * 0.5
    l1l11l1ll11l1l11ll11:AddRotatingParticleUV(0, l1l11ll11ll1l1l1ll11, ll1l1ll1l1l1l11l11l1, l1l1l1l11l11l11l1ll1, l1l11l1l1l1ll1l1ll11, l1ll1l1l1ll11ll11l11, l1l1l11ll1ll11l1l1l1, l1l11l1ll1l11l11ll11, math["random"]() * 360, UnitRand() * 0.1, ll1l1l11l1l11l1l1l1l, 0)

end

local function l1ll1l1ll1l11l1ll1ll(ll1l1l11l11ll11l11l1)
    if l1l1l11l1ll1ll1ll1l1 ~= nil then
        l1l1l11l1ll1ll1ll1l1()
    end
    local ll1ll11l1l1ll11ll11l = ll1l1l11l11ll11l11l1["entity"]:AddVFXEffect()
    ll1ll11l1l1ll11ll11l:InitEmitters(2)
    ll1ll11l1l1ll11ll11l:SetRenderResources(0, l11ll1l1ll11l1ll1l11, l11l1l11l1l1l11ll1ll)
    ll1ll11l1l1ll11ll11l:SetMaxNumParticles(0, 50)
    ll1ll11l1l1ll11ll11l:SetRotationStatus(0,(469+389+167-230 == 795))
    ll1ll11l1l1ll11ll11l:SetMaxLifetime(0, l11ll11l11ll1l1ll1ll)
    ll1ll11l1l1ll11ll11l:SetColourEnvelope(0, l1l1l1ll1ll11ll1l1l1)
    ll1ll11l1l1ll11ll11l:SetScaleEnvelope(0, l11l1l1l1ll1l1l11ll1)
    ll1ll11l1l1ll11ll11l:SetUVFrameSize(0, 0.5, 1)
    ll1ll11l1l1ll11ll11l:SetBlendMode(0, BLENDMODE["AlphaBlended"])
    ll1ll11l1l1ll11ll11l:SetSortOrder(0, 0)
    ll1ll11l1l1ll11ll11l:SetSortOffset(0, 0)
    ll1ll11l1l1ll11ll11l:SetRadius(0, ll1l1ll1l1l11ll1l1ll)
    ll1ll11l1l1ll11ll11l:SetDragCoefficient(0, .1)
    ll1ll11l1l1ll11ll11l:SetRenderResources(1, ll1l1ll1ll11ll11ll11, l11ll1l1ll1ll11l1l1l)
    ll1ll11l1l1ll11ll11l:SetMaxNumParticles(1, 128)
    ll1ll11l1l1ll11ll11l:SetMaxLifetime(1, l1l1l1l1l1l1ll1l1ll1)
    ll1ll11l1l1ll11ll11l:SetColourEnvelope(1, ll11l11l1ll1l1l11l1l)
    ll1ll11l1l1ll11ll11l:SetScaleEnvelope(1, l11l1ll1l11ll1l1l1l1)
    ll1ll11l1l1ll11ll11l:SetBlendMode(1, BLENDMODE["Additive"])
    ll1ll11l1l1ll11ll11l:EnableBloomPass(1,(string.sub("l1l1l1l1l1l1ll1l11l1", 8, 14) == "1l1l1ll"))
    ll1ll11l1l1ll11ll11l:SetSortOrder(1, 0)
    ll1ll11l1l1ll11ll11l:SetSortOffset(1, 0)
    ll1ll11l1l1ll11ll11l:SetDragCoefficient(1, 0.07)
    local l1ll1l1l1ll11ll11l1l = TheWorld
    local ll11l1l1l11l1ll1l1ll = TheSim
    local l1l11l11ll1l1l11l11l = CreateCircleEmitter(ll1l1ll1l1l11ll1l1ll)
    local l1ll1l11ll1ll1l11l1l = CreateSphereEmitter(l1l1l1l1ll11ll1l11ll)
    local ll1ll11l1ll11l1l11ll = 2 * TheSim:GetTickTime()
    local l1l11l1l1ll11l1l1l1l = 0
    EmitterManager:AddEmitter(ll1l1l11l11ll11l11l1, nil, function()
        local l1l11l1ll1ll11ll11l1 = ThePlayer if l1l11l1ll1ll11ll11l1 then
            local l11ll11l11l1l11ll1ll = ll1l1l11l11ll11l11l1["entity"]:GetParent() if l11ll11l11l1l11ll1ll and (l11ll11l11l1l11ll1ll["IsCloudEnabled"] == nil or l11ll11l11l1l11ll1ll:IsCloudEnabled()) then
                local l1l1l1l1ll11l11l1l11, l11ll11l1l1l11ll11ll, l11l1l11ll1l11l11l1l = l1l11l1ll1ll11ll11l1["Transform"]:GetWorldPosition() local l11l1l1l1ll1l11ll11l, l11ll11l1l1l11ll11ll, l11l11l1l11ll1l1l1ll = l11ll11l11l1l11ll1ll["Transform"]:GetWorldPosition() local ll1ll1ll11ll1l1ll1ll = l11ll11l11l1l11ll1ll["_diminishing"]:value() local ll11l11l1ll11l11ll11 = ll1l1l11l11ll11l11l1["_frontsemicircle"] l1l11l1l1ll11l1l1l1l = l1l11l1l1ll11l1l1l1l + ll1ll11l1ll11l1l11ll while l1l11l1l1ll11l1l1l1l > 1 do
                    l1ll1l11l1l1l1ll1l11(ll1ll11l1l1ll11ll11l, l1l11l11ll1l1l11l11l, l1ll1l11ll1ll1l11l1l, l1l1l1l1ll11l11l1l11, l11l1l11ll1l11l11l1l, l11l1l1l1ll1l11ll11l, l11l11l1l11ll1l1l1ll, ll1ll1ll11ll1l1ll1ll, ll11l11l1ll11l11ll11, l1ll1l1l1ll11ll11l1l, ll11l1l1l11l1ll1l1ll) l1l11l1l1ll11l1l1l1l = l1l11l1l1ll11l1l1l1l - 1
                end
            end
        end
    end
    )

end

local l1l11ll1l1l1l11l1ll1 = .5 local l11l1l1l1l1l11ll11ll ={"playerghost", "ghost", "shadow", "shadowminion", "noauradamage", "FX", "INLIMBO", "notarget", "noattack", "flight", "invisible"}

local function ll11l1ll1ll11ll1ll11(l11l1l11l1l1ll1l1ll1, ll1l1l11ll11l1l1ll11)
    for ll1l1l1ll11l11l1l1ll in pairs(ll1l1l11ll11l1l1ll11)
    do
        ll1l1l11ll11l1l1ll11[ll1l1l1ll11l11l1l1ll] = nil if ll1l1l1ll11l11l1l1ll:IsValid() and ll1l1l1ll11l11l1l1ll["components"]["miasmawatcher"] ~= nil then
            ll1l1l1ll11l11l1l1ll["components"]["miasmawatcher"]:RemoveMiasmaSource(l11l1l11l1l1ll1l1ll1)
        end
    end

end

local ll1l1ll11l11l1ll11ll ={"fire"}

local l11l1ll1l1ll1l11l11l = l11l11l11ll11l1l11l1 + 1

local function ll1ll11l11l11ll11ll1(ll11l11l1l11ll11ll1l)
    local l1l1l1ll1l1l11l1l1ll = ll11l11l1l11ll11ll1l["watchers_toremove"]
    ll11l11l1l11ll11ll1l["watchers_toremove"] = ll11l11l1l11ll11ll1l["watchers_exiting"]
    ll11l11l1l11ll11ll1l["watchers_exiting"] = ll11l11l1l11ll11ll1l["watchers"]
    ll11l11l1l11ll11ll1l["watchers"] = l1l1l1ll1l1l11l1l1ll
    local l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11 = ll11l11l1l11ll11ll1l["Transform"]:GetWorldPosition()
    for l1ll11l1l11l11l11ll1, ll11l11l11ll11ll1l11 in ipairs(TheSim:FindEntities(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11, l11l11l11ll11l1l11l1, nil, l11l1l1l1l1l11ll11ll))
    do
        if ll11l11l11ll11ll1l11["entity"]:IsVisible() then
            if ll11l11l11ll11ll1l11["components"]["miasmawatcher"] ~= nil then
                ll11l11l1l11ll11ll1l["watchers"][ll11l11l11ll11ll1l11] =(string.sub("ll11ll1l1l1l1l1l1l11", 6, 13) == "l1l1l1l1")
                if ll11l11l1l11ll11ll1l["watchers_toremove"][ll11l11l11ll11ll1l11] then
                    ll11l11l1l11ll11ll1l["watchers_toremove"][ll11l11l11ll11ll1l11] = nil
                elseif ll11l11l1l11ll11ll1l["watchers_exiting"][ll11l11l11ll11ll1l11] then
                    ll11l11l1l11ll11ll1l["watchers_exiting"][ll11l11l11ll11ll1l11] = nil
                else
                    ll11l11l11ll11ll1l11["components"]["miasmawatcher"]:AddMiasmaSource(ll11l11l1l11ll11ll1l)
                end
            end
        end
    end
    local l11l1l11l1ll1ll11l11 = TheWorld["components"]["miasmamanager"]
    local ll11ll1l1l11l11l1l11 = TheSim:FindEntities(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11, l11l1ll1l1ll1l11l11l, ll1l1ll11l11l1ll11ll)[1]
    if ll11ll1l1l11l11l1l11 then
        if l11l1l11l1ll1ll11l11 and l11l1l11l1ll1ll11l11:GetMiasmaAtPoint(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11) then
            l11l1l11l1ll1ll11l11:SetMiasmaDiminishingAtPoint(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11,(string.sub("l1l1l11l1l11l1ll1l11", 7, 12) ~= "l1ll11"))
        elseif ll11l11l1l11ll11ll1l["_miasma_kill_task"] == nil then
            ll11l11l1l11ll11ll1l["_miasma_kill_task"] = ll11l11l1l11ll11ll1l:DoTaskInTime(TUNING["MIASMA_DIMINISH_INTERVAL_SECONDS"] * TUNING["MIASMA_MAXSTRENGTH"], ll11l11l1l11ll11ll1l["Remove"])
        end
        ll11l11l1l11ll11ll1l["_diminishing"]:set((string.sub("ll11ll11ll1l1ll1l1ll", 8, 14) ~= "l1l11l1"))
    else
        if l11l1l11l1ll1ll11l11 and l11l1l11l1ll1ll11l11:GetMiasmaAtPoint(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11) then
            l11l1l11l1ll1ll11l11:SetMiasmaDiminishingAtPoint(l1ll1l1l1ll11l1l11l1, l11l1ll11l1ll11l1ll1, l1l1ll11l1l11l1l1l11,(string.sub("l1l1l1l1ll1l11l1l1ll", 8, 14) ~= "1ll1l11"))
        elseif ll11l11l1l11ll11ll1l["_miasma_kill_task"] ~= nil then
            ll11l11l1l11ll11ll1l["_miasma_kill_task"]:Cancel()
            ll11l11l1l11ll11ll1l["_miasma_kill_task"] = nil
        end
        ll11l11l1l11ll11ll1l["_diminishing"]:set((string.sub("ll11ll11l11l11ll1ll1", 8, 11) ~= "1l11"))
    end
    ll11l11l1l11ll11ll1l:ClearWatcherTable(ll11l11l1l11ll11ll1l["watchers_toremove"])

end

local function ll1l1l1l1ll11ll1l11l(l1l1l1ll1l11l11ll11l)
    if l1l1l1ll1l11l11ll11l["task"] == nil then
        l1l1l1ll1l11l11ll11l["task"] = l1l1l1ll1l11l11ll11l:DoPeriodicTask(l1l11ll1l1l1l11l1ll1, ll1ll11l11l11ll11ll1, math["random"]() * .5)
    end

end

local function ll1l1ll1l1l1l1ll1l11(l11l11ll1l1l11ll11ll)
    if l11l11ll1l1l11ll11ll["task"] ~= nil then
        l11l11ll1l1l11ll11ll["task"]:Cancel()
        l11l11ll1l1l11ll11ll["task"] = nil l11l11ll1l1l11ll11ll:ClearWatcherTable(l11l11ll1l1l11ll11ll["watchers"])
        l11l11ll1l1l11ll11ll:ClearWatcherTable(l11l11ll1l1l11ll11ll["watchers_exiting"])
        l11l11ll1l1l11ll11ll:ClearWatcherTable(l11l11ll1l1l11ll11ll["watchers_toremove"])
    end

end

local function l1l1l1l1l11l1l11ll11(l11l1l11l11l1ll11l11)
    l11l1l11l11l1ll11l11:StopAllWatchers()
    l1l1ll1l11l11l11l1l1 = l1l1ll1l11l11l11l1l1 - 1
    if l1l1ll1l11l11l11l1l1 == 0 then
        TheWorld:PushEvent("miasmacloudexists",(string.sub("l1l11l1l1ll1l1l11l11", 8, 14) == "l1lll11"))
    end

end

local function ll1ll1ll11ll11ll11l1(l1l11ll11ll11l1ll1l1)
    l1l11ll11ll11l1ll1l1:StartAllWatchers()

end

local function l11l1ll11l1ll1ll1l1l(l11l1l11l1ll1ll1l1l1)
    l11l1l11l1ll1ll1l1l1:StopAllWatchers()

end

local function l11l1l1l1l1l11l1ll1l(ll11l1ll1l11l1ll1l1l)
    local l11ll11l1ll1ll1ll1ll = SpawnPrefab "miasma_cloud_fx"
    l11ll11l1ll1ll1ll1ll["entity"]:SetParent(ll11l1ll1l11l1ll1l1l["entity"])
    l11ll11l1ll1ll1ll1ll["Transform"]:SetPosition(l11l1l1ll1l1ll11ll11, 0, 0)
    l11ll11l1ll1ll1ll1ll["_frontsemicircle"] =(99 * 399+249 ~= 39754)
    local ll11l11l1l1ll1ll1ll1 = SpawnPrefab "miasma_cloud_fx"
    ll11l11l1l1ll1ll1ll1["entity"]:SetParent(ll11l1ll1l11l1ll1l1l["entity"])
    ll11l11l1l1ll1ll1ll1["Transform"]:SetPosition(- l11l1l1ll1l1ll11ll11, 0, 0)
    ll11l1ll1l11l1ll1l1l["_front_cloud_fx"] = l11ll11l1ll1ll1ll1ll
    ll11l1ll1l11l1ll1l1l["_back_cloud_fx"] = ll11l11l1l1ll1ll1ll1

end

local function ll1l1l11l1l11l1ll11l()
    local l11ll11l1l11ll1l1l1l = CreateEntity()
    l11ll11l1l11ll1l1l1l["entity"]:AddTransform()
    l11ll11l1l11ll1l1l1l["entity"]:AddNetwork()
    l11ll11l1l11ll1l1l1l:AddTag "FX"
    l11ll11l1l11ll1l1l1l:AddTag "miasma"
    l11ll11l1l11ll1l1l1l["_diminishing"] = net_bool(l11ll11l1l11ll1l1l1l["GUID"], "miasma_cloud._diminishing", "diminishingdirty")
    if not TheNet:IsDedicated() then
        l11l1l1l1l1l11l1ll1l(l11ll11l1l11ll1l1l1l)
        if l1l1l11l11ll1l1l1l1l == nil then
            l1l1l11l11ll1l1l1l1l ={}
            if TheCamera then
                TheCamera:AddListener("MiasmaClouds", l11l11l1ll11l1l11l1l)
            end
        end
        if TheCamera then
            l11ll11l11ll11l11ll1(l11ll11l1l11ll1l1l1l)
        end
        l1l1l11l11ll1l1l1l1l[l11ll11l1l11ll1l1l1l] =(19+137+20 == 176)
        l11ll11l1l11ll1l1l1l:ListenForEvent("onremove", ll1l1l11l11ll1ll1l1l)
    end
    l11ll11l1l11ll1l1l1l["entity"]:SetPristine()
    if not TheWorld["ismastersim"] then
        return l11ll11l1l11ll1l1l1l
    end
    l11ll11l1l11ll1l1l1l["watchers"] ={}
    l11ll11l1l11ll1l1l1l["watchers_exiting"] ={}
    l11ll11l1l11ll1l1l1l["watchers_toremove"] ={}
    l11ll11l1l11ll1l1l1l["OnEntityWake"] = ll1ll1ll11ll11ll11l1
    l11ll11l1l11ll1l1l1l["OnEntitySleep"] = l11l1ll11l1ll1ll1l1l
    l11ll11l1l11ll1l1l1l["OnRemoveEntity"] = l1l1l1l1l11l1l11ll11
    l11ll11l1l11ll1l1l1l["ClearWatcherTable"] = ll11l1ll1ll11ll1ll11
    l11ll11l1l11ll1l1l1l["StartAllWatchers"] = ll1l1l1l1ll11ll1l11l
    l11ll11l1l11ll1l1l1l["StopAllWatchers"] = ll1l1ll1l1l1l1ll1l11
    l1l1ll1l11l11l11l1l1 = l1l1ll1l11l11l11l1l1 + 1
    if l1l1ll1l11l11l11l1l1 == 1 then
        TheWorld:PushEvent("miasmacloudexists",(453+385 * 240 * 470-283 ~= 43428175))
    end
    if TheWorld["GetMiasmaCloudCount"] == nil then
        TheWorld["GetMiasmaCloudCount"] = ll11l1l1ll11l11ll1l1
    end
    return l11ll11l1l11ll1l1l1l

end

local function l11l11l1ll11l1ll1l1l()
    local ll11ll1l11ll11ll1l11 = CreateEntity()
    ll11ll1l11ll11ll1l11["entity"]:AddTransform()
    ll11ll1l11ll11ll1l11:AddTag "FX"
    ll11ll1l11ll11ll1l11["entity"]:SetCanSleep((445-187+253 ~= 511))
    ll11ll1l11ll11ll1l11["persists"] =(295 * 72 * 433+6+259 == 9197191)
    l1ll1l1ll1l11l1ll1ll(ll11ll1l11ll11ll1l11)
    return ll11ll1l11ll11ll1l11

end

return Prefab("miasma_cloud", ll1l1l11l1l11l1ll11l, nil, l1l1ll1l1ll1ll1ll1ll), Prefab("miasma_cloud_fx", l11l11l1ll11l1ll1l1l, l1l11l1l11l1l1l11ll1)