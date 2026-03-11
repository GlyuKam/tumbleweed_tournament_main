local l1ll1l1l1l1l1ll1l1ll ={{description = STRINGS["DC_FGC"]["Naval"], data = "Naval", announce = STRINGS["DC_FGC"]["announce_Naval"]},{description = STRINGS["DC_FGC"]["Wharf"], data = "Wharf", announce = STRINGS["DC_FGC"]["announce_Wharf"]},{description = STRINGS["DC_FGC"]["Land"], data = "Land", announce = STRINGS["DC_FGC"]["announce_Land"]},{description = STRINGS["DC_FGC"]["Arena"], data = "Arena", announce = STRINGS["DC_FGC"]["announce_Arena"]}}

local l1ll1l11l11l1l1ll11l ={Classic ={description = STRINGS["DC_FGC"]["Classic"], data = "Classic", announce = STRINGS["DC_FGC"]["announce_Classic"]}, Rondom ={description = STRINGS["DC_FGC"]["Rondom"], data = "Rondom", announce = STRINGS["DC_FGC"]["announce_Rondom"]}}

for l11l1l11l11l1ll11l11, ll11l11ll1l1l1l11l11 in ipairs(l1ll1l1l1l1l1ll1l1ll)

do
    l1ll1l11l11l1l1ll11l[ll11l11ll1l1l1l11l11["data"]] = ll11l11ll1l1l1l11l11

end

return {special_modes = l1ll1l1l1l1l1ll1l1ll, game_modes = l1ll1l11l11l1l1ll11l}