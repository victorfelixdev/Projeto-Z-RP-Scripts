local espEnabled = false
local players = {}
local currentPlayers = {}
-- Função auxiliar para desenhar 3D text
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z + 0.95)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(false)
        SetTextCentre(true)
        SetTextColour(255, 255, 255, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local function preparePlayers()
    currentPlayers = {}
    Wait(100)
    currentPlayers = lib.callback.await('ps-adminmenu:callback:GetPlayers')
end

RegisterNetEvent('pz_playground:CL:esp', function()
    if not espEnabled then preparePlayers() end
    espEnabled = not espEnabled
    if espEnabled then
        lib.notify({description = 'ESP - Ativado'})
    else
        lib.notify({description = 'ESP - Desativado'})
    end
end)

-- Loop de desenho
CreateThread(function()
    while true do
        Wait(0)
        if espEnabled then
            for _, player in pairs(currentPlayers) do
                if player.id then
                    local playerId = GetPlayerFromServerId(player.id)
                    local ped = GetPlayerPed(playerId)
                    if ped and ped ~= PlayerPedId() and IsPedAPlayer(ped) then
                        local x, y, z = table.unpack(GetEntityCoords(ped))
                        local onScreen, screenX, screenY = World3dToScreen2d(x, y, z + 1.1)
                        if onScreen then
                            -- Dados e texto
                            -- local serverId = GetPlayerServerId(pid)
                            -- local name     = GetPlayerName(pid)
                            local health = GetEntityHealth(ped) - 100
                            local armour = GetPedArmour(ped)
                            local text     = ('[%d] %s \n Vida: %d | Colete: %d'):format(player.id, player.name, health, armour)
                            -- Texto 3D
                            DrawText3D(x, y, z + 1.1, text)
                        end
                    end
                end
            end
        end
    end
end)