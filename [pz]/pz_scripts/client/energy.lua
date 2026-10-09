-- client.lua
local zones = {
    -- Bunker Governo
    { coords = vec3(3104.30, 5441.29, 19.59), radius = 50.0 },
    { coords = vec3(3104.30, 5441.29, 23.59), radius = 50.0 },
    { coords = vec3(3096.68, 5450.03, 27.59), radius = 50.0 },
}

-- Cria zonas via OX Lib
CreateThread(function()
    for _, zone in ipairs(zones) do
        lib.zones.sphere({
            coords  = zone.coords,
            radius  = zone.radius,
            -- ao entrar na zona, liga as luzes
            onEnter = function()
                SetArtificialLightsState(false)
            end,
            -- ao sair da zona, desliga as luzes
            onExit  = function()
                SetArtificialLightsState(true)
            end,
        })
    end
end)
