local freecamStatus = false
local function toggleFreecam()
    freecamStatus = not freecamStatus
    exports['fivem-freecam']:SetActive(freecamStatus)
end

RegisterNetEvent('pz_scripts:CL:ToggleFreecam', function()
    toggleFreecam()
end)