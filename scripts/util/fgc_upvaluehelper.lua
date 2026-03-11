local function l1ll11ll1ll1ll1l11ll(ll1ll1l1l1l11l11ll11, ll1l11l1ll1l11l11ll1, ll1l1ll1l1l11l1l11ll, ll11l1l1l1l11l1l1ll1, l11l11l1ll11ll11l1ll, l1ll1ll1ll1ll1l11ll1)
    if type(ll1ll1l1l1l11l11ll11) ~= "function" then
        return
    end
    local ll1l1ll1l1l11l1l11ll = ll1l1ll1l1l11l1l11ll or 5
    local l11l11l1ll11ll11l1ll = l11l11l1ll11ll11l1ll or 0
    local ll11l1l1l1l11l1l1ll1 = ll11l1l1l1l11l1l1ll1 or 20
    for l11ll1l1ll1l1ll1ll11 = 1, ll11l1l1l1l11l1l1ll1, 1
    do
        local ll1l1l11l1l1l11ll11l, ll1l11ll11ll1ll1ll11 = debug["getupvalue"](ll1ll1l1l1l11l11ll11, l11ll1l1ll1l1ll1ll11)
        if ll1l1l11l1l1l11ll11l and ll1l1l11l1l1l11ll11l == ll1l11l1ll1l11l11ll1 then
            if l1ll1ll1ll1ll1l11ll1 and type(l1ll1ll1ll1ll1l11ll1) == "string" then
                local ll1l11ll1l11l1ll11ll = debug["getinfo"](ll1ll1l1l1l11l11ll11)
                if ll1l11ll1l11l1ll11ll["source"] and ll1l11ll1l11l1ll11ll["source"]:match(l1ll1ll1ll1ll1l11ll1) then
                    return ll1l11ll11ll1ll1ll11
                end
            else
                return ll1l11ll11ll1ll1ll11
            end
        end
        if l11l11l1ll11ll11l1ll < ll1l1ll1l1l11l1l11ll and ll1l11ll11ll1ll1ll11 and type(ll1l11ll11ll1ll1ll11) == "function" then
            local l11ll1ll1ll1ll11l1ll = l1ll11ll1ll1ll1l11ll(ll1l11ll11ll1ll1ll11, ll1l11l1ll1l11l11ll1, ll1l1ll1l1l11l1l11ll, ll11l1l1l1l11l1l1ll1, l11l11l1ll11ll11l1ll + 1, l1ll1ll1ll1ll1l11ll1)
            if l11ll1ll1ll1ll11l1ll then
                return l11ll1ll1ll1ll11l1ll
            end
        end
    end

end

local function l1l1l1l1ll1l1ll11l11(l1l1l1ll1l1ll1ll1l1l, ll1l11l11l1ll1ll11ll, ll11ll1ll11l1l11ll11, ll1l1ll1ll1l1l11l11l, ll1l11l1l1ll11ll1l1l, ll11ll11l1l11ll1ll11, ll1l1ll1l1l1ll1ll11l)
    if type(l1l1l1ll1l1ll1ll1l1l) ~= "function" then
        return
    end
    local ll1l1ll1ll1l1l11l11l = ll1l1ll1ll1l1l11l11l or 5
    local ll11ll11l1l11ll1ll11 = ll11ll11l1l11ll1ll11 or 0
    local ll1l11l1l1ll11ll1l1l = ll1l11l1l1ll11ll1l1l or 20
    for ll1l1ll1ll1ll11l11ll = 1, ll1l11l1l1ll11ll1l1l, 1
    do
        local l1l1l11l1l11l1l11l1l, ll1l11l11ll11ll1l1ll = debug["getupvalue"](l1l1l1ll1l1ll1ll1l1l, ll1l1ll1ll1ll11l11ll)
        if l1l1l11l1l11l1l11l1l and l1l1l11l1l11l1l11l1l == ll1l11l11l1ll1ll11ll then
            if ll1l1ll1l1l1ll1ll11l and type(ll1l1ll1l1l1ll1ll11l) == "string" then
                local l1ll1l1l11ll1l1l1l11 = debug["getinfo"](l1l1l1ll1l1ll1ll1l1l)
                if l1ll1l1l11ll1l1l1l11["source"] and l1ll1l1l11ll1l1l1l11["source"]:match(ll1l1ll1l1l1ll1ll11l) then
                    return debug["setupvalue"](l1l1l1ll1l1ll1ll1l1l, ll1l1ll1ll1ll11l11ll, ll11ll1ll11l1l11ll11)
                end
            else
                return debug["setupvalue"](l1l1l1ll1l1ll1ll1l1l, ll1l1ll1ll1ll11l11ll, ll11ll1ll11l1l11ll11)
            end
        end
        if ll11ll11l1l11ll1ll11 < ll1l1ll1ll1l1l11l11l and ll1l11l11ll11ll1l1ll and type(ll1l11l11ll11ll1l1ll) == "function" then
            local ll11l11ll1ll11ll1l11 = l1l1l1l1ll1l1ll11l11(ll1l11l11ll11ll1l1ll, ll1l11l11l1ll1ll11ll, ll11ll1ll11l1l11ll11, ll1l1ll1ll1l1l11l11l, ll1l11l1l1ll11ll1l1l, ll11ll11l1l11ll1ll11 + 1, ll1l1ll1l1l1ll1ll11l)
            if ll11l11ll1ll11ll1l11 then
                return ll11l11ll1ll11ll1l11
            end
        end
    end

end

local function l1l1l11ll11l1l11l1l1(l1l11ll1ll11ll11l1l1, l11l1ll1ll11ll1l11l1, ll11l11ll1l1ll1ll1ll, l1l1l1l11l1l1ll11ll1, l1ll11l1ll1l11l11l1l)
    if l1l11ll1ll11ll11l1l1 and type(l1l11ll1ll11ll11l1l1) ~= "function" then
        return (494+249-323 ~= 420)
    end
    local ll11l11ll1ll1l1l1ll1 = debug["getinfo"](l1l11ll1ll11ll11l1l1)
    if l11l1ll1ll11ll1l11l1 and type(l11l1ll1ll11ll1l11l1) == "string" then
        local ll1l11l1ll1l1l11l11l = "/" .. l11l1ll1ll11ll1l11l1 .. ".lua"
        if not ll11l11ll1ll1l1l1ll1["source"] or not ll11l11ll1ll1l1l1ll1["source"]:match(ll1l11l1ll1l1l11l11l) then
            return (299+459+185+374+362 ~= 1679)
        end
    end
    if ll11l11ll1l1ll1ll1ll and type(ll11l11ll1l1ll1ll1ll) == "function" and not ll11l11ll1l1ll1ll1ll(ll11l11ll1ll1l1l1ll1, l1l1l1l11l1l1ll11ll1, l1ll11l1ll1l11l11l1l) then
        return (string.sub("l11ll11l11l1l1l11ll1", 6, 14) == "ll111l1l1")
    end
    return (string.sub("l11ll1l11l1ll11l1l1l", 7, 12) == "l11l1l")

end

local function ll11l1ll1ll1l1ll1l11(l1l11l1l1ll1l1l1l11l, l1ll11ll11ll1l1ll1l1, l11l11l1ll11l1l1ll1l, l1ll11ll1ll11l1l11ll)
    if type(l1l11l1l1ll1l1l1l11l) == "table" then
        if l1l11l1l1ll1l1l1l11l["event_listening"] and l1l11l1l1ll1l1l1l11l["event_listening"][l1ll11ll11ll1l1ll1l1] then
            local l1l11l1ll1ll11ll1l1l = l1l11l1l1ll1l1l1l11l["event_listening"][l1ll11ll11ll1l1ll1l1]
            for ll11l11l1ll1l1l1l11l, ll1l1ll1l11ll11ll11l in pairs(l1l11l1ll1ll11ll1l1l)
            do
                if ll1l1ll1l11ll11ll11l and type(ll1l1ll1l11ll11ll11l) == "table" then
                    for l11l11l11l11ll11ll11, l11ll1l1ll11l1ll1l11 in pairs(ll1l1ll1l11ll11ll11l)
                    do
                        if l1l1l11ll11l1l11l1l1(l11ll1l1ll11l1ll1l11, l11l11l1ll11l1l1ll1l, l1ll11ll1ll11l1l11ll, ll11l11l1ll1l1l1l11l, l1l11l1l1ll1l1l1l11l) then
                            return l11ll1l1ll11l1ll1l11
                        end
                    end
                end
            end
        end
        if l1l11l1l1ll1l1l1l11l["event_listeners"] and l1l11l1l1ll1l1l1l11l["event_listeners"][l1ll11ll11ll1l1ll1l1] then
            local l11l1l11l1l1l11ll1ll = l1l11l1l1ll1l1l1l11l["event_listeners"][l1ll11ll11ll1l1ll1l1]
            for l1l1l1ll1ll11ll1l1l1, l11l1l1l1ll1l1l11ll1 in pairs(l11l1l11l1l1l11ll1ll)
            do
                if l11l1l1l1ll1l1l11ll1 and type(l11l1l1l1ll1l1l11ll1) == "table" then
                    for ll1l1ll1ll11ll11ll11, l11ll1l1ll1ll11l1l1l in pairs(l11l1l1l1ll1l1l11ll1)
                    do
                        if l1l1l11ll11l1l11l1l1(l11ll1l1ll1ll11l1l1l, l11l11l1ll11l1l1ll1l, l1ll11ll1ll11l1l11ll, l1l11l1l1ll1l1l1l11l, l1l1l1ll1ll11ll1l1l1) then
                            return l11ll1l1ll1ll11l1l1l
                        end
                    end
                end
            end
        end
    end

end

local function ll1l11ll11l1l11l1l11(ll11l11l1ll1l1l11l1l, l11l1ll1l11ll1l1l1l1, l1l1ll1l1ll1ll1ll1ll)
    if type(ll11l11l1ll1l1l11l1l) == "table" then
        local l1l11l1l11l1l1l11ll1 = ll11l11l1ll1l1l11l1l["worldstatewatching"] and ll11l11l1ll1l1l11l1l["worldstatewatching"][l11l1ll1l11ll1l1l1l1] or nil if l1l11l1l11l1l1l11ll1 then
            for l1l1l1l1ll11ll1l11ll, l11ll11l11ll1l1ll1ll in pairs(l1l11l1l11l1l1l11ll1)
            do
                if l1l1l11ll11l1l11l1l1(l11ll11l11ll1l1ll1ll, l1l1ll1l1ll1ll1ll1ll) then
                    return l11ll11l11ll1l1ll1ll
                end
            end
        end
    end

end

return {Get = l1ll11ll1ll1ll1l11ll, Set = l1l1l1l1ll1l1ll11l11, GetEventHandle = ll11l1ll1ll1l1ll1l11, GetWorldHandle = ll1l11ll11l1l11l1l11}