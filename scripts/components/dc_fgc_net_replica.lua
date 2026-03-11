local l1ll1ll1l11l1l11ll11 = Class(function(self, l1ll1l1l1l1l1ll1l1ll)
    self["inst"] = l1ll1l1l1l1l1ll1l1ll self["_records"] = net_string(l1ll1l1l1l1l1ll1l1ll["GUID"], "fgc_net._records", "event_fgc_net_records")

end
)

function l1ll1ll1l11l1l11ll11:SetRecords(l1ll1l11l11l1l1ll11l)
    self["_records"]:set(l1ll1l11l11l1l1ll11l)

end

function l1ll1ll1l11l1l11ll11:GetAllData()
    return json["decode"](self["_records"]:value())

end

return l1ll1ll1l11l1l11ll11