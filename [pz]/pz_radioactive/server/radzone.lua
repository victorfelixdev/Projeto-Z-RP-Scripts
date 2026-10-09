local QBCore = exports['qb-core']:GetCoreObject()
local usingHazmat = {}
QBCore.Functions.CreateUseableItem("hazmat", function(source, item)
    exports.ox_inventory:AddItem(source, 'clothing', 1)
    exports.ox_inventory:RemoveItem(source, 'hazmat', 1)
    usingHazmat[source] = true
    TriggerClientEvent("indossa:hazmat", source)
end)

QBCore.Functions.CreateUseableItem("clothing", function(source, item)
    if usingHazmat[source] == true then
        usingHazmat[source] = false
        exports.ox_inventory:AddItem(source, 'hazmat', 1)
    end
    exports.ox_inventory:RemoveItem(source, 'clothing', 1)
    TriggerClientEvent("illenium-appearance:client:reloadSkin", source)
end)


QBCore.Functions.CreateUseableItem("antirad", function(source, item)
    exports.ox_inventory:RemoveItem(source, 'antirad', 1)
    TriggerClientEvent('rad:clear', source)
end)
lib.callback.register('pz_radioactive:SV:isAdmin', function(source)
    return exports.zdiscord:isRolePresent(source,"1356307312444444713")
end)