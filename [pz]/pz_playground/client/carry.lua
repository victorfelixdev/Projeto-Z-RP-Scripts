-- CreateThread(function()
--     while true do
--         local currentWeight = exports.ox_inventory:GetPlayerWeight()
--         local maxWeight = exports.ox_inventory:GetPlayerMaxWeight()
--         if currentWeight >= maxWeight then
--             setWalk('move_m@hiking')
--             DisableControlAction(0, 21, true)
--         else
--             resetWalk()
--         end
--         Wait(1)
--     end
-- end)

AddStateBagChangeHandler("carryItem", nil, function(bagName, key, propData, _unused, replicated)
    local currentWeight = exports.ox_inventory:GetPlayerWeight()
    local maxWeight = exports.ox_inventory:GetPlayerMaxWeight()
    if currentWeight >= maxWeight then
        LocalPlayer.state:set('canRun', false)
        setWalk('move_m@hiking')
        while true do
            if LocalPlayer.state.canRun then break end
            DisableControlAction(0, 21, true)
            Wait(0)
        end
    else
        LocalPlayer.state:set('canRun', true)
        resetWalk()
    end
    SetPlayerSprint(cache.playerId, true)
end)

function setWalk(name)
    lib.requestAnimSet(name, 1000)
    SetPedMovementClipset(cache.ped, name, 0.2)
    RemoveAnimSet(name)
    SetResourceKvp('animations_walkstyle', name)
end

function resetWalk()
    ResetPedMovementClipset(cache.ped, 0)
    SetResourceKvp('animations_walkstyle', 'default')
end