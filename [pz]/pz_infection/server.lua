local QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("pz_infection:SV:updatePlayerInfection", function(amount)
    local playerId = source

    if playerId then
        local Player = QBCore.Functions.GetPlayer(playerId)

        if Player then
            local citizenId = Player.PlayerData.citizenid
            exports.oxmysql:fetch("SELECT infected FROM players WHERE citizenid = ?", { citizenId }, function(result)
                if result then
                    local infected = result[1].infected
                    local newInfectionValue = infected + amount
                    print('eski: ' .. infected .. ' yeni. ' .. newInfectionValue)
                    exports.oxmysql:execute("UPDATE players SET infected = ? WHERE citizenid = ?", { newInfectionValue, citizenId })
                else
                    print("No se encontraron datos para el jugador en la base de datos")
                end
            end)
        end
    end
end)

lib.callback.register('pz_infection:SV:checkInfection', function(source, targetId)
    local Player = QBCore.Functions.GetPlayer(targetId)
    local citizenId = Player.PlayerData.citizenid
    local infection = MySQL.single.await('SELECT `infected` FROM `players` WHERE `citizenid` = ? LIMIT 1', {
        citizenId
    })
    return infection.infected
end)

RegisterServerEvent('pz_infection:SV:checkInfection', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    local citizenId = Player.PlayerData.citizenid
    exports.oxmysql:fetch("SELECT infected FROM players WHERE citizenid = ?", { citizenId }, function(result)
        if result and result[1] then
            local infected = result[1].infected
            if infected > 0 and infected < 100 then
                infected = infected + 1
            elseif infected >= 100 then
                infected = 100
            end
            exports.oxmysql:execute("UPDATE players SET infected = ? WHERE citizenid = ?", { infected, citizenId })
            TriggerClientEvent("pz_infection:CL:infectedPlayers", src, infected)
            if infected > 35 then
                TriggerClientEvent("pz_infection:CL:updateInfectionUI", src, infected)
            end
        end
    end)
end)

lib.addCommand('curar', {
    help = 'Cura a infecção de um player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'ID do Player',
            optional = true,
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    if not args.target then args.target = source end
    local Player = QBCore.Functions.GetPlayer(args.target)
    if Player then
        exports.oxmysql:execute("UPDATE players SET infected = 0 WHERE citizenid = ?",
            { Player.PlayerData.citizenid })
        TriggerClientEvent("pz_infection:CL:updateInfectionUI", args.target, 0)
    end
end)

RegisterNetEvent('pz_infection:SV:reduceInfection', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    exports.oxmysql:fetch("SELECT infected FROM players WHERE citizenid = ?", { citizenId }, function(result)
        if result and result[1] then
            local infected = result[1].infected
            if infected > 0 then
                exports.oxmysql:execute("UPDATE players SET infected = 1 WHERE citizenid = ?",
                { Player.PlayerData.citizenid })
            TriggerClientEvent("pz_infection:CL:updateInfectionUI", src, 1)
            end
        end
    end)
end)

QBCore.Functions.CreateUseableItem("antibiotic", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if exports.ox_inventory:RemoveItem(source, 'antibiotic', 1) then
        exports.oxmysql:fetch("SELECT infected FROM players WHERE citizenid = ?", { Player.PlayerData.citizenid }, function(result)
            if result and result[1] then
                local infected = result[1].infected
                if infected > 0 then
                    exports.oxmysql:execute("UPDATE players SET infected = 1 WHERE citizenid = ?", { Player.PlayerData.citizenid })
                    TriggerClientEvent("pz_infection:CL:updateInfectionUI", source, 1)
                    TriggerClientEvent("pz_infection:CL:reduceInfection", source)
                end
            end
        end)

    end
end)
QBCore.Functions.CreateUseableItem("antidote", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if exports.ox_inventory:RemoveItem(source, 'antidote', 1) then
        exports.oxmysql:execute("UPDATE players SET infected = 0 WHERE citizenid = ?", { Player.PlayerData.citizenid })
        TriggerClientEvent("pz_infection:CL:updateInfectionUI", source, 0)
        TriggerClientEvent("pz_infection:CL:reduceInfection", source)
    end
end)