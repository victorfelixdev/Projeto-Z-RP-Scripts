CreateThread(function()
    local models = { "prop_box_ammo03a", "prop_box_ammo03a_set", "prop_box_ammo03a_set2", "p_secret_weapon_02",
        "hei_heist_flecca_weapons", "hei_prison_heist_weapons", "prop_box_ammo01a", "prop_box_ammo04a",
        "prop_box_ammo07a", "prop_box_ammo06a", "prop_box_ammo02a", "hei_prop_hei_ammo_pile",
        "hei_prop_hei_ammo_pile_02", "hei_prop_hei_ammo_single", "prop_box_wood02a_mws",
        "ex_prop_crate_ammo_sc", "bkr_prop_biker_gcase_s", "xm_prop_crates_rifles_02a",
        "ex_office_swag_guns03", "bkr_prop_gunlocker_01a", "xm_prop_crates_weapon_mix_01a",
        'gr_prop_gr_cratespile_01a',
        -703051854, 1968867096, 149728010, 1008042510, 1784667810,
        437101437, 2055933813, -705542590, 1098160621, 1008042510, -1989890776

    }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Weapon(entity)
                end,
                icon = 'fa-solid fa-gun',
                label = 'Procurar peças de armas',
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
                    local data = lib.callback.await('ars_ambulancejob:getData', false, targetServerId)
                    if data.status.isDead then
                        return false
                    else
                        return true
                    end
                end
            },
        },
        distance = 2.5 -- Esta é a distância que você deve estar para o alvo ficar azul, isso está em unidades GTA e tem que ser um valor flutuante
    })
end)

function Weapon(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'weapon'

    local progressLabel = 'Procurando peças de armas...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }

    local time = 3600

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, false)
end
