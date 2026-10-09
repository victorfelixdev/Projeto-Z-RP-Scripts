local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem('cloth_torso', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_pants', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_mask', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_gloves', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_shoes', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_shirt', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_hat', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)
QBCore.Functions.CreateUseableItem('cloth_glass', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)

QBCore.Functions.CreateUseableItem('clothing_bag', function(source, item)
    TriggerClientEvent('pz_clothing:CL:useClothing', source, item)
end)

QBCore.Functions.CreateUseableItem('nightvision', function(source, item)
    TriggerClientEvent('pz_clothing:CL:openClothingMenu', source, item)
end)

local hookId = exports.ox_inventory:registerHook('createItem', function(payload)
    local metadata = payload.metadata
    if metadata.id == nil then 
        return
    end
    local barCode = metadata.sex..'_'..metadata.category..'_'..metadata.id
    metadata.unique = true
    metadata.label = payload.item.label..' - ' .. (metadata.sex == 'male' and 'Masculina' or 'Feminina')
    metadata.imageurl = 'https://assets.projetozrp.com/roupas/v2/'..metadata.sex..'_'..metadata.category..'_'..metadata.id..'.png'
    local desc = '#### Etiqueta:\n    '..barCode..' \n---\n ![Imagem](https://assets.projetozrp.com/roupas/v2/'..metadata.sex..'_'..metadata.category..'_'..metadata.id..'.png "a title")'
    metadata.description = desc
    
    return metadata
end, {
    print = false,
    itemFilter = {
        cloth_torso = true,
        cloth_pants = true,
        cloth_mask = true,
        cloth_gloves = true,
        cloth_shoes = true,
        cloth_shirt = true,
        cloth_hat = true,
        cloth_glass = true,
        nightvision = true,
    }
})

RegisterNetEvent('pz_clothing:SV:saveItemMetadata', function(item, metadata)
    local src = source
    exports.ox_inventory:RemoveItem(src, item.name, 1, nil, item.slot)
    exports.ox_inventory:AddItem(src, item.name, 1, {
        variation = metadata.variation,
        category = metadata.category,
        sex = metadata.sex,
        id = metadata.id
    })
end)

RegisterServerEvent('pz_clothing:SV:removeClothesFromOutfit', function(slot)
    local src = source
    local slotData = exports.ox_inventory:GetSlot(src, slot)
    if slotData.metadata.outfit then
        for _, item in pairs(slotData.metadata.outfit) do
            exports.ox_inventory:AddItem(src, item.name, 1, {
                variation = item.variation,
                category = item.category,
                sex = item.sex,
                id = item.id
            })
        end
        exports.ox_inventory:RemoveItem(src, slotData.name, 1, nil, slot)
        exports.ox_inventory:AddItem(src, slotData.name, 1, nil, slot)
    end
end)