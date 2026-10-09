Config = {}
Config.Drop = {}

Config.Debug = false

Config.SyncLoot = true -- Ative (true) ou desative (false) a sincronização global de loot

Config.MissDropMessages = {
    "Droga... Eu não achei nada aqui.",
    "Parece que hoje não é o meu dia, estou sem nada.",
    "Ué, eu até tentei, mas não tem nada pra mim.",
    "Eu estava tão animado, mas nada apareceu pra mim.",
    "Eu juro, parece que o universo não me quer hoje.",
    "Que azar, eu não consegui encontrar nada.",
    "Estou indo pra casa de mãos vazias, não achei nada.",
    "Hoje a sorte não está do meu lado, não há nada pra mim.",
    "Eu procurei por toda parte e tudo está vazio.",
    "Poxa, eu esperava algo, mas ficou tudo em vão.",
    "Eu me sinto completamente abandonado, nada por aqui.",
    "Acreditei que encontraria algo, mas me enganei.",
    "Parece que a sorte me deixou de fora hoje, não achei nada.",
    "Eu estava contando com alguma coisa, mas nada surgiu.",
    "Investi meu tempo aqui e, mesmo assim, fiquei sem nada.",
    "Me esforcei tanto e o resultado foi em vão...",
    "Nem uma pista do que procurava apareceu pra mim.",
    "Hoje me sinto tão vazio quanto esse lugar.",
    "Tentei de tudo, mas hoje simplesmente não é meu dia.",
    "Esperava um pouco de sorte, mas acabei ficando sem nada."
}

Config.fuelItem = 'jerrycan'

Config.silentSearch = 25000
Config.silentSearchArmed = 45000
Config.searchTimeArmed = 25000
Config.searchTimeUnarmed = 8000

Config.lootType = {}


Config.lootType.clothing = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'cloth',
        'cloth_torso',
        'cloth_pants',
        'cloth_mask',
        'cloth_gloves',
        'cloth_shoes',
        'cloth_shirt',
        'cloth_hat',
        'cloth_glass',
    }
}

Config.lootType.fuel = {
    options = {
        unique = true,
        quantity = 1,
        probability = 85,
        xp = 5
    },
    items = {
        'jerrycan',
    }
}
Config.lootType.diesel = {
    options = {
        unique = true,
        quantity = 1,
        probability = 10,
        xp = 5
    },
    items = {
        'diesel',
    }
}

Config.lootType.cactus = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'cactus',
    }
}
Config.lootType.aloe = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'aloe',
    }
}
Config.lootType.wood = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'wood',
    }
}
Config.lootType.woodSakura = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'sakura_wood',
    }
}
Config.lootType.fiber = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'vegetal_fiber',
    }
}
Config.lootType.bush = {
    options = {
        unique = true,
        quantity = 1,
        probability = 100,
        xp = 5
    },
    items = {
        'wood',
        'stick',
    }
}

Config.lootType.backpack = {
    options = {
        unique = true,
        quantity = 1,
        probability = 5,
        xp = 5
    },
    items = {
        'backpack1',
    }
}

Config.lootType.boar = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_fat',
        'raw_meat',
        'raw_meat',
        'animal_skin',
        'fangs',
        'raw_meat',
        'raw_meat',
    }
}
Config.lootType.chicken = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_fat',
        'raw_meat',
        'feather',
        'raw_meat',
    }
}
Config.lootType.cow = {
    options = {
        unique = false,
        quantity = 3,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_fat',
        'raw_meat',
        'animal_fat',
        'raw_meat',
        'raw_meat',
        'raw_meat',
        'animal_skin',
        'raw_meat',
    }
}
Config.lootType.coyote = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_skin',
        'raw_meat',
        'fangs',
        'raw_meat',
    }
}
Config.lootType.deer = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'skin_deer_ruined',
        'animal_fat',
        'skin_deer_low',
        'raw_meat',
        'skin_deer_medium',
        'animal_fat',
        'skin_deer_good',
        'raw_meat',
        'skin_deer_perfect',
        'animal_fat',
        'deer_horn',
        'raw_meat',
        'raw_meat',
        'raw_meat',
    }
}
Config.lootType.mt_lion = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_skin',
        'animal_fat',
        'raw_meat',
        'fangs',
        'raw_meat',
        'raw_meat',
    }
}
Config.lootType.rabbit = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'raw_meat',
        'animal_skin',
        'raw_meat',
        'animal_fat',
        'raw_meat',
    }
}
Config.lootType.pig = {
    options = {
        unique = false,
        quantity = 2,
        probability = 100,
        xp = 5
    },
    items = {
        'raw_meat',
        'animal_fat',
        'raw_meat',
        'raw_meat',
        'animal_skin',
        'raw_meat',
        'raw_meat',
    }
}

Config.lootType.medic = {
    options = {
        unique = false,
        quantity = 2,
        probability = 20,
        xp = 5
    },
    items = {
        -- 'adrenaline',
        -- 'medicalbag',
        'bandage',
        'defibrillator',
        'tweezers',
        'burncream',
        'disinfectant',
        'suturekit',
        'icepack',
        'disinfectant',
        'antibiotic',
        'antidote',
    }
}

Config.lootType.ammo = {
    options = {
        unique = false,
        quantity = math.random(2, 6),
        probability = 5,
        xp = 5
    },
    items = {
        'ammo-22',
        'ammo-38',
        'ammo-44',
        'ammo-45',
        'ammo-50',
        'ammo-9',
        'ammo-flare',
        'ammo-heavysniper',
        'ammo-musket',
        'ammo-rifle',
        'ammo-rifle2',
        'ammo-shotgun',
        'ammo-sniper',
        'gunpowder',
        'casing',
        'projectile',
    }
}

Config.lootType.weapon = {
    options = {
        unique = false,
        quantity = math.random(2, 4),
        probability = 25,
        xp = 5
    },
    items = {
        'weapons_parts',
    }
}

Config.lootType.boss = {
    options = {
        unique = true,
        quantity = 1,
        probability = 25,
        xp = 35
    },
    items = {
        'WEAPON_remington',
        'WEAPON_DE',
        'WEAPON_KATANA',
        'WEAPON_HUNTINGRIFLE',
        'WEAPON_AK47',
        'WEAPON_AK74',
        'WEAPON_AKS74',
        'WEAPON_AR15',
        'WEAPON_FNX45',
        'WEAPON_GLOCK17',
        'WEAPON_GLOCK18C',
        'WEAPON_GLOCK22',
        'WEAPON_HK416',
        'WEAPON_M4',
        'WEAPON_M9',
        'WEAPON_M70',
        'WEAPON_M110',
        'WEAPON_M1911',
        'WEAPON_MAC10',
        'WEAPON_MK14',
        'WEAPON_MOSSBERG',
        'WEAPON_MP5',
        'WEAPON_MP9',
        'WEAPON_SCARH',
        'WEAPON_UZI',
    }
}

Config.lootType.bossWeak = {
    options = {
        unique = true,
        quantity = 1,
        probability = 25,
        xp = 10
    },
    items = {
        'WEAPON_GRENADE',
        'WEAPON_MOLOTOV',
    }
}


Config.lootType.policeItens = {
    options = {
        unique = true,
        quantity = 1,
        probability = 15,
        xp = 5
    },
    items = {
        'parachute', 
        'armour',
        'police_stormram',
        'WEAPON_STUNGUN',
        'spikestrip',
        'cuffs',
        'zipties',
        'handcuffkey',
        'prop_cone_small',
        'prop_cone_large',
        'prop_police_barrier',
        'prop_barrier_small',
        'prop_barrier_medium',
        'prop_barrier_large',
        'prop_worklight_large',
        'prop_worklight_small',
        'WEAPON_DOUBLEACTION',
        'at_flashlight',
        'at_suppressor_light',
        'ammo-38',
        'ammo-stungun',
        'tire',
    }
}

Config.lootType.consumables = {
    options = {
        unique = false,
        quantity = 2,
        probability = 85,
        xp = 4
    },
    items = {
        'burger',
        'tosti',
        'cola',
        'sprunk',
        'mustard',
        'water_bottle',
        'empty_water_bottle',
        'water_contaminat',
        'beer',
        'sandwich',
        'vodka',
        'coffee',
        'cooked_meat',
        'potato',
        'cabbage',
        'tomato',
        'orange',
        'bread_loaf',
        'bread',
    }
}

Config.lootType.misc = {
    options = {
        unique = true,
        quantity = 1,
        probability = 35,
        xp = 5
    },
    items = {
        'survival_guide',
        'rolling_paper', 
        '10kgoldchain',
        'rolex',
        'goldbar',
        'goldchain',
        'diamond_ring',
        'stickynote',
        'security_card_01',
        'security_card_02',
        'trojan_usb',
        'radio',
        'laptop',
        'money',
        'notepad',
        'binoculars',
        'walkstick',
        'tablet',
        'casinochips',
        'casing',
        'projectile',
        'cleaningkit',
        'basic_rod',
        'worms',
        'artificial_bait',
        'WEAPON_FLASHLIGHT',
        'WEAPON_GOLFCLUB',
        'WEAPON_KNIFE',
        'WEAPON_KNUCKLE',
        'WEAPON_MOLOTOV',
        'WEAPON_MUSKET',
        'WEAPON_POOLCUE',
        'WEAPON_DOUBLEACTION',
        'WEAPON_SWITCHBLADE',
        'WEAPON_BOTTLE',
        'ammo-38',
        'cooking_pot',
        'plate',
        'handsaw',
        'duct_tape',
        'tire',
        'map',
        'printer_paper',
        'stick',
        'radiocell',
        'electronickit'
    }
}

Config.lootType.trash = {
    options = {
        unique = true,
        quantity = 4,
        probability = 100,
        xp = 2
    },
    items = {
        'garbage',
    }
}

Config.lootType.fallbackLoot = {
    options = {
        unique = true,
        quantity = 2,
        probability = 100,
        xp = 2
    },
    items = {
        'garbage',
        'casing',
        'garbage',
        'shotgun_casing',
        'garbage',
        'projectile',
        'garbage',
        'shotgun_pellet',
        'garbage',
        'gunpowder',
        'garbage',
        'carbon',
        'garbage',
        'can',
        'garbage',
        'nail',
        'garbage',
        'wooden_plank',
        'garbage',
        'printer_paper',
        'survival_guide'
    }
}

Config.lootType.trashReturn = {
    options = {
        unique = false,
        quantity = 4,
        probability = 100,
        xp = 5
    },
    items = {
        'glass',
        'plastic',
        'rubber',
        'metalscrap',
        'copper',
        'iron',
        'steel',
        'aluminum',
        'wood',
        'paperbag',
        'guide',
        'rope',
        'can',
        'stone',
        'carbon',
        'bottle',
        'recyclablematerial',
        'gunpowder',
        'casing',
        'plate',
        'printer_paper',
        'stick'
    }
}

Config.lootType.tools = {
    options = {
        unique = true,
        quantity = 1,
        probability = 35,
        xp = 5
    },
    items = {
        'lockpick',
        'advancedlockpick',
        'screwdriverset',
        'electronickit',
        'WEAPON_DRILL',
        'lighter',
        'tools',
        'animal_tracker',
        'campfire',
        'huntingbait',
        'pickaxe',
        'miningdrill',
        'drillbit',
        'goldpan',
        'repairkit',
        'advancedrepairkit',
        'tow_rope',
        'trowel',
        'shovel',
        'WEAPON_HAMMER',
        'WEAPON_CROWBAR',
        'WEAPON_HATCHET',
        'gunpowder',
        'cooking_pot',
        'plate',
        'duct_tape',
        'handsaw',
        'tire',
        'WEAPON_KNIFE',
        'radiocell',
        'electronickit'
    }
}

Config.lootType.car = {
    options = {
        unique = false,
        quantity = 3,
        probability = 65,
        xp = 5
    },
    items = {
        'vehicle_battery',
        'vehicleparts',
        'chain',
        'vehicleparts',
        'engineoil',
        'vehicleparts',
        'bike_tire',
        'vehicleparts',
        'tools',
        'vehicleparts',
        'bicycle_tire',
        'vehicleparts',
        'truck_tire',
        'vehicleparts',
        'cleaningkit',
        'vehicleparts',
        'tire',
        'radiocell',
        'screwdriverset',
        'electronickit'
    }
}

Config.lootType.drugs = {
    options = {
        unique = false,
        quantity = 4,
        probability = 65,
        xp = 10
    },
    items = {
        'weed_seed',
        'weed',
        'coke_seed',
        'coke',
        'cokebaggy',
        'oxy',
        'joint',
    }
}

Config.lootType.farm = {
    options = {
        unique = false,
        quantity = 4,
        probability = 40,
        xp = 6
    },
    items = {
        'watering_can', 
        'fertilizer', 
        'advanced_fertilizer', 
        'liquid_fertilizer',
        'dirty_potato',
        'dirty_cabbage',
        'dirty_tomato',
        'dirty_coffee_beans',
        'dirty_orange',
    }
}

Config.Drop = {
    ['drink'] = { {
        data = Config.lootType.consumables,
    } },
    ['food'] = { {
        data = Config.lootType.consumables,
    } },
    ['fuel'] = { {
        data = Config.lootType.fuel,
    } },
    ['diesel'] = { {
        data = Config.lootType.diesel,
    } },
    ['car'] = { {
        data = Config.lootType.car,
    } },
    ['hunting-boar'] = { {
        data = Config.lootType.boar,
    }, },
    ['hunting-chicken'] = { {
        data = Config.lootType.chicken,
    }, },
    ['hunting-cow'] = { {
        data = Config.lootType.cow,
    }, },
    ['hunting-coyote'] = { {
        data = Config.lootType.coyote,
    }, },
    ['hunting-deer'] = { {
        data = Config.lootType.deer,
    }, },
    ['hunting-mt-lion'] = { {
        data = Config.lootType.mt_lion,
    }, },
    ['hunting-pig'] = { {
        data = Config.lootType.pig,
    }, },
    ['hunting-rabbit'] = { {
        data = Config.lootType.rabbit,
    }, },
    ['medic'] = { {
        data = Config.lootType.medic,
    }, {
        data = Config.lootType.drugs,
    } },
    ['drugs'] = { {
        data = Config.lootType.drugs,
    } },
    ['loot'] = { {
        data = Config.lootType.misc,
    }, {
        data = Config.lootType.backpack,
    }, {
        data = Config.lootType.weapon,
    }, {
        data = Config.lootType.ammo,
    }, {
        data = Config.lootType.clothing,
    } },
    ['trash'] = { {
        data = Config.lootType.trash,
    }, {
        data = Config.lootType.clothing,
    } },
    ['weapon'] = { {
        data = Config.lootType.ammo,
    }, {
        data = Config.lootType.policeItens,
    }, {
        data = Config.lootType.weapon,
    } },
    ['wood'] = { {
        data = Config.lootType.wood,
    } },
    ['wood_sakura'] = { {
        data = Config.lootType.woodSakura,
    } },
    ['fiber'] = { {
        data = Config.lootType.fiber,
    } },
    ['bush'] = { {
        data = Config.lootType.bush,
    } },
    ['cactus'] = { {
        data = Config.lootType.cactus,
    } },
    ['aloe'] = { {
        data = Config.lootType.aloe,
    } },
    ['mechanic'] = { {
        data = Config.lootType.tools,
    } },
    ['zombie'] = { {
        data = Config.lootType.misc,
    }, {
        data = Config.lootType.clothing,
    } },
    ['boss'] = { {
        data = Config.lootType.boss,
    }},
    ['boss_weak'] = { {
        data = Config.lootType.bossWeak,
    }},
    ['police'] = { {
        data = Config.lootType.policeItens,
    }},
}
