RegisterNetEvent("pz_scripts:SV:createNotepad", function(slot)
    exports.ox_inventory:RemoveItem(source, 'printer_paper', 1)
    exports.ox_inventory:AddItem(source, 'notepad', 1)
end)