local l11l11l1l1l11l11l1l1 = require "List/list_tumbleweed_resources"

local ll1l11l1ll1l1l1ll1l1 ={}

if TUNING["LUCKY_MODE"] then
    for ll11ll1l1l1l1l1ll1ll, l1ll11ll1ll1ll1l11ll in pairs(l11l11l1l1l11l11l1l1)
    do
        local l1l1l1l1ll1l1ll11l11 = l1ll11ll1ll1ll1l11ll["multiple"] or 0
        if not (type(l1l1l1l1ll1l1ll11l11) == "number" and l1l1l1l1ll1l1ll11l11 > 0) then
            l11l11l1l1l11l11l1l1["k"] = nil
        end
    end
    for l1l1l11ll11l1l11l1l1, ll11l1ll1ll1l1ll1l11 in pairs(l11l11l1l1l11l11l1l1)
    do
        local ll1l11ll11l1l11l1l11 = ll11l1ll1ll1l1ll1l11["multiple"] or 0
        for ll1ll1l1l1l11l11ll11, ll1l11l1ll1l11l11ll1 in pairs(ll11l1ll1ll1l1ll1l11["resourcesList"])
        do
            ll1l11l1ll1l11l11ll1["chance"] = ll1l11l1ll1l11l11ll1["chance"] * ll1l11ll11l1l11l1l11
            table["insert"](ll1l11l1ll1l1l1ll1l1, ll1l11l1ll1l11l11ll1)
        end
    end

else
    for ll1l1ll1l1l11l1l11ll, ll11l1l1l1l11l1l1ll1 in pairs(l11l11l1l1l11l11l1l1)
    do
        for l11l11l1ll11ll11l1ll, l1ll1ll1ll1ll1l11ll1 in pairs(ll11l1l1l1l11l1l1ll1["resourcesList"])
        do
            l1ll1ll1ll1ll1l11ll1["chance"] = 1
            table["insert"](ll1l11l1ll1l1l1ll1l1, l1ll1ll1ll1ll1l11ll1)
        end
    end

end

return ll1l11l1ll1l1l1ll1l1