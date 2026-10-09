return {
	-- {
	-- 	items = {
	-- 		{
	-- 			name = 'lockpick',
	-- 			ingredients = {
	-- 				scrapmetal = 5,
	-- 				WEAPON_HAMMER = 0.05
	-- 			},
	-- 			duration = 5000,
	-- 			count = 2,
	-- 		},
	-- 	},
	-- 	points = {
	-- 		vec3(-1147.083008, -2002.662109, 13.180260),
	-- 		vec3(-345.374969, -130.687088, 39.009613)
	-- 	},
	-- 	zones = {
	-- 		{
	-- 			coords = vec3(-1146.2, -2002.05, 13.2),
	-- 			size = vec3(3.8, 1.05, 0.15),
	-- 			distance = 1.5,
	-- 			rotation = 315.0,
	-- 		},
	-- 		{
	-- 			coords = vec3(-346.1, -130.45, 39.0),
	-- 			size = vec3(3.8, 1.05, 0.15),
	-- 			distance = 1.5,
	-- 			rotation = 70.0,
	-- 		},
	-- 	},
	-- 	blip = { id = 566, colour = 31, scale = 0.8 },
	-- },
	{
        items = {
			-- CONSTRUÇÃO DE BASES
            {
                name = 'nail',
                ingredients = {
                    metalscrap = 1,
                },
                duration = 1000,
                count = 1,
            },
            {
                name = 'metalscrap',
                ingredients = {
                    aluminum = 1,
                },
                duration = 1000,
                count = 5,
            },
            {
                name = 'metalscrap',
                ingredients = {
                    iron = 1,
                },
                duration = 1000,
                count = 3,
            },
            {
                name = 'metalscrap',
                ingredients = {
                    steel = 1,
                },
                duration = 1000,
                count = 4,
            },
            {
                name = 'gr_prop_gr_bench_04b',
                ingredients = {
                    metalscrap = 100,
                    WEAPON_HAMMER = 1,
                    handsaw = 1,
                    screwdriverset = 2,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'ex_prop_crate_expl_sc',
                ingredients = {
                    metalscrap = 100,
                    WEAPON_HAMMER = 1,
                    handsaw = 1,
                    stone = 5,
                    wood = 10,
                    screwdriverset = 2,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_base_wood',
                ingredients = {
                    wood = 3,
                    wooden_plank = 3,
					nail = 10
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_door_wood',
                ingredients = {
                    wooden_plank = 5
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_window_wood',
                ingredients = {
                    glass = 10,
					wood = 3
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_windowway_wood',
                ingredients = {
                    stick = 4,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_wood',
                ingredients = {
                    wood = 3,
					nail = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_doorway_wood',
                ingredients = {
                    wooden_plank = 2,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_gateway_wood',
                ingredients = {
                    wood = 2,
					wooden_plank = 2,
					nail = 10

                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceiling_wood',
                ingredients = {
                    wooden_plank = 6,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceilingstairs_wood',
                ingredients = {
                    wooden_plank = 4,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_pillar_wood',
                ingredients = {
                    wood = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_gate_wood',
                ingredients = {
                    wood = 4,
					wooden_plank = 2,
					nail = 8
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_bigwall_wood',
                ingredients = {
                    wood = 10,
					nail = 20
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_biggateway_wood',
                ingredients = {
					wooden_plank = 10,
					nail = 20
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_biggate_wood',
                ingredients = {
                    wood = 8,
					wooden_plank = 8,
					nail = 20
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_base_wood_triangle',
                ingredients = {
                    wood = 2,
					wooden_plank = 2,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceiling_wood_triangle',
                ingredients = {
                    wood = 3,
                    wooden_plank = 3,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_wood_roof',
                ingredients = {
                    wood = 2,
					stick = 2,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_wood_roof_triangle',
                ingredients = {
                    wood = 3,
					stick = 3,
					nail = 6
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_wood_small',
                ingredients = {
                    wooden_plank = 4,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_wood_triangle',
                ingredients = {
                    wood = 2,
					wooden_plank = 2,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceilingladder_wood_triangle',
                ingredients = {
                    wood = 1,
					wooden_plank = 3,
					nail = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_stairs_wood',
                ingredients = {
                    wooden_plank = 3
                },
                duration = 20000,
                count = 1,
            },

			-- CONSTRUÇÃO DE PEDRA
			{
                name = 'model_door_stone',
                ingredients = {
                    stone = 3
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_window_stone',
                ingredients = {
                    stone = 2,
					glass = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_windowway_stone',
                ingredients = {
                    stone = 2,
					rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_stone',
                ingredients = {
                    stone = 5
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_doorway_stone',
                ingredients = {
                    stone = 3,
					rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_gateway_stone',
                ingredients = {
                    stone = 4
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_base_stone',
                ingredients = {
                    stone = 5
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceiling_stone',
                ingredients = {
                    stone = 3
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceilingstairs_stone',
                ingredients = {
                    stone = 2,
                    rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_pillar_stone',
                ingredients = {
                    stone = 3,
					rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_gate_stone',
                ingredients = {
                    stone = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_base_stone_triangle',
                ingredients = {
                    stone = 5,
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceiling_stone_triangle',
                ingredients = {
                    stone = 3,
					rubber = 16
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_stone_roof',
                ingredients = {
                    stone = 3,
                    rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_stone_roof_triangle',
                ingredients = {
                    stone = 3,
					rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_stone_small',
                ingredients = {
                    stone = 2,
                    rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_ceilingladder_stone_triangle',
                ingredients = {
                    stone = 3,
                    rubber = 10
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_stairs_stone',
                ingredients = {
                    stone = 3
                },
                duration = 20000,
                count = 1,
            },

			-- CONSTRUÇÃO DE METAL
			{
                name = 'model_door_metal',
                ingredients = {
                    metalscrap = 10,
					iron = 20,
					steel = 20
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_window_metal',
                ingredients = {
                    metalscrap = 25,
					iron = 20,
					glass = 20
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_windowway_metal',
                ingredients = {
                    metalscrap = 35,
                    iron = 2
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_wall_metal',
                ingredients = {
                    metalscrap = 25,
					iron = 30,
					steel = 30
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_doorway_metal',
                ingredients = {
                    metalscrap = 25,
					copper = 30,
					aluminum = 30
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_gateway_metal',
                ingredients = {
                    metalscrap = 25,
					iron = 30,
					steel = 30
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_base_metal',
                ingredients = {
                    metalscrap = 50,
					iron = 50,
					steel = 50,
                    aluminum = 10
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceiling_metal',
                ingredients = {
                    metalscrap = 25,
					iron = 30,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceilingstairs_metal',
                ingredients = {
                    metalscrap = 25,
                    iron = 25
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_pillar_metal',
                ingredients = {
                    iron = 25,
                    steel = 25
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_gate_metal',
                ingredients = {
                    metalscrap = 50,
					iron = 50,
					steel = 50,
                    aluminum = 10
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_base_metal_triangle',
                ingredients = {
                    metalscrap = 50,
					iron = 50,
					steel = 50,
                    aluminum = 10
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceiling_metal_triangle',
                ingredients = {
                    metalscrap = 25,
					iron = 30,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_wall_metal_roof',
                ingredients = {
                    metalscrap = 25,
					iron = 25
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_wall_metal_roof_triangle',
                ingredients = {
                    metalscrap = 25,
					iron = 25
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_wall_metal_small',
                ingredients = {
                    metalscrap = 30,
                    iron = 26,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_wall_metal_triangle',
                ingredients = {
                    metalscrap = 25,
                    iron = 25
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceilingladder_metal_triangle',
                ingredients = {
                    metalscrap = 30,
                    iron = 26
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_stairs_metal',
                ingredients = {
                    metalscrap = 30,
                    iron = 26
                },
                duration = 20000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 1
	{
        items = {
			-- CONSTRUÇÃO MEDICA
            {
                name = 'defibrillator',
                ingredients = {
                    electronickit = 2,
                    iron = 5
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'icepack',
                ingredients = {
                    water_bottle = 1,
                    plastic = 2
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'tweezers',
                ingredients = {
                    iron = 2,
					aluminum = 2,
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'suturekit',
                ingredients = {
                    steel = 2,
					disinfectant = 1,
                    cloth = 5
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'burncream',
                ingredients = {
                    aloe = 2,
					animal_skin = 1
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'bandage',
                ingredients = {
                    cloth = 10,
                },
                duration = 5000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 2
	{
        items = {
			-- CONSTRUÇÃO DE ARMAS
            {
                name = 'WEAPON_DOUBLEACTION',
                ingredients = {
                    metalscrap = 25,
                    wooden_plank = 1,
                    nail = 1,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'WEAPON_MUSKET',
                ingredients = {
                    wooden_plank = 5,
                    metalscrap = 25,
                    nail = 3,
                },
                duration = 45000,
                count = 1,
            },
			{
                name = 'ammo-38',
                ingredients = {
                    casing = 1,
					gunpowder = 2,
					projectile = 1,
                },
                duration = 2000,
                count = 1,
            },
			{
                name = 'ammo-musket',
                ingredients = {
                    iron = 1,
					gunpowder = 1,
                },
                duration = 2000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 3
	{
        items = {
			-- CONSTRUÇÃO Elétricos
            {
                name = 'prop_solarpanel_02',
                ingredients = {
                    glass = 20,
                    steel = 4,
                    nail = 5,
                    copper = 5,
                    cable = 2,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'prop_solarpanel_03',
                ingredients = {
                    glass = 35,
                    steel = 10,
                    nail = 10,
                    copper = 10,
                    cable = 4,
                },
                duration = 35000,
                count = 1,
            },
			{
                name = 'prop_rural_windmill',
                ingredients = {
                    iron = 15,
                    steel = 15,
                    nail = 50,
                    copper = 10,
                    cable = 25,
                },
                duration = 35000,
                count = 1,
            },
			{
                name = 'cable',
                ingredients = {
                    rubber = 1,
                    copper = 1,
                },
                duration = 2000,
                count = 1,
            },
			{
                name = 'model_powerdist1_wall',
                ingredients = {
                    steel = 4,
                    nail = 4,
                    copper = 10,
                    cable = 2,
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_powercomb1_wall',
                ingredients = {
                    steel = 4,
                    nail = 4,
                    copper = 10,
                    cable = 2,
                },
                duration = 20000,
                count = 1,
            },
			{
                name = 'model_powerdist1_switch_wall',
                ingredients = {
                    steel = 4,
                    nail = 4,
                    copper = 10,
                    cable = 2,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'prop_telegraph_06a',
                ingredients = {
                    wood = 5,
                    iron = 5,
                    steel = 15,
                    nail = 25,
                    copper = 10,
                    cable = 25,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_generator_small',
                ingredients = {
                    iron = 25,
                    steel = 25,
                    nail = 50,
                    copper = 25,
                    cable = 50,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_generator_medium',
                ingredients = {
                    iron = 35,
                    steel = 35,
                    nail = 75,
                    copper = 35,
                    cable = 75,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_generator_big',
                ingredients = {
                    iron = 40,
                    steel = 40,
                    nail = 100,
                    copper = 40,
                    cable = 100,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_battery_pack_6',
                ingredients = {
                    steel = 10,
                    nail = 20,
                    copper = 100,
                    cable = 100,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'radiocell',
                ingredients = {
                    copper = 4,
                    aluminum = 10,
                    nail = 2,
                    electronickit = 2
                },
                duration = 35000,
                count = 1
            },
            {
                name = 'radio',
                ingredients = {
                    radiocell = 1,
                    glass = 1,
                    plastic = 10,
                    electronickit = 2
                },
                duration = 35000,
                count = 1
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 4
	{
        items = {
			-- CONSTRUÇÃO FERRAMENTAS
            {
                name = 'bkr_prop_biker_campbed_01',
                ingredients = {
                    cloth = 50,
                    wooden_plank = 10,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'v_tre_sofa_mess_b_s',
                ingredients = {
                    cloth = 50,
                    wooden_plank = 10,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'imp_prop_impexp_boxwood_01',
                ingredients = {
                    wooden_plank = 10,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'gr_prop_gr_gunlocker_01a',
                ingredients = {
                    iron = 20,
                    steel = 20,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'p_v_43_safe_s',
                ingredients = {
                    iron = 40,
                    steel = 40,
                    nail = 40,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'bkr_prop_meth_table01a',
                ingredients = {
                    bandage = 10,
                    wooden_plank = 10,
                    plastic = 10,
                    aluminum = 10,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'gr_prop_gr_bench_02a',
                ingredients = {
                    weapons_parts = 10,
                    metalscrap = 100,
                    plastic = 10,
                    aluminum = 10,
                    nail = 20,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'prop_planer_01',
                ingredients = {
                    iron = 10,
                    steel = 10,
                    metalscrap = 100,
                    plastic = 10,
                    rubber = 10,
                    glass = 10,
                    copper = 10,
                    aluminum = 10,
                    nail = 10,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'imp_prop_impexp_mechbench',
                ingredients = {
                    electronickit = 10,
                    goldbar = 5,
                    metalscrap = 100,
                    glass = 10,
                    copper = 50,
                    aluminum = 10,
                    nail = 50,
                },
                duration = 35000,
                count = 1,
            },
            {
                name = 'model_worklight_2',
                ingredients = {
                    electronickit = 2,
                    glass = 2,
                    cable = 5,
                    aluminum = 5,
                    nail = 5,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_oldlight_ext',
                ingredients = {
                    electronickit = 2,
                    glass = 2,
                    cable = 5,
                    aluminum = 5,
                    nail = 5,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_worklight_1',
                ingredients = {
                    electronickit = 4,
                    glass = 4,
                    cable = 10,
                    aluminum = 10,
                    nail = 10,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_biglight_1',
                ingredients = {
                    electronickit = 4,
                    glass = 4,
                    cable = 10,
                    aluminum = 10,
                    nail = 10,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_walllight_1',
                ingredients = {
                    electronickit = 2,
                    glass = 2,
                    cable = 5,
                    aluminum = 5,
                    nail = 5,
                },
                duration = 20000,
                count = 1,
            },
            {
                name = 'model_ceilinglight_1',
                ingredients = {
                    electronickit = 2,
                    glass = 2,
                    cable = 5,
                    aluminum = 5,
                    nail = 5,
                },
                duration = 20000,
                count = 1,
            },
            --[[{
                name = 'gr_prop_gr_hobo_stove_01',
                ingredients = {
                    stick = 10,
                    wood = 5,
                    aluminum = 2,
                },
                duration = 20000,
                count = 1,
            },]]
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 5
    {
        items = {
			-- CONSTRUÇÃO Inventário
            {
                name = 'prop_tool_bench02_ld',
                ingredients = {
                    wooden_plank = 20,
                    handsaw = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'campfire',
                ingredients = {
                    stick = 5,
                    wood = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'wooden_plank',
                ingredients = {
                    wood = 1,
                },
                duration = 5000,
                count = 2,
            },
            {
                name = 'upgrade_stash',
                ingredients = {
                    nail = 5,
                    wooden_plank = 4,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'bau',
                ingredients = {
                    nail = 20,
                    wooden_plank = 16,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'nail',
                ingredients = {
                    metalscrap = 1,
                },
                duration = 5000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 6
    {
        items = {
			-- CONSTRUÇÃO Alimentos
            {
                name = 'water_bottle',
                ingredients = {
                    cactus = 3,
                    empty_water_bottle = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'water_contaminat',
                ingredients = {
                    cactus = 3,
                    can = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'potato',
                ingredients = {
                    dirty_potato = 3,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 3,
            },
            {
                name = 'cabbage',
                ingredients = {
                    dirty_cabbage = 1,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'tomato',
                ingredients = {
                    dirty_tomato = 2,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 2,
            },
            {
                name = 'orange',
                ingredients = {
                    dirty_orange = 2,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 2,
            },
            {
                name = 'coffee_beans',
                ingredients = {
                    dirty_coffee_beans = 5,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 5,
            },
            {
                name = 'sandwich',
                ingredients = {
                    bread = 2,
                    cooked_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'soup_plate',
                ingredients = {
                    plate = 3,
                    cooked_soup_pot = 1,
                },
                duration = 5000,
                count = 3,
            },
            {
                name = 'potato_cabbage',
                ingredients = {
                    potato = 2,
                    cabbage = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'potato_tomato',
                ingredients = {
                    potato = 2,
                    tomato = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'potato_raw_meat',
                ingredients = {
                    potato = 2,
                    raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'cabbage_tomato',
                ingredients = {
                    cabbage = 1,
                    tomato = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'cabbage_raw_meat',
                ingredients = {
                    cabbage = 1,
                    raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'tomato_raw_meat',
                ingredients = {
                    tomato = 1,
                    raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'soup_ingredients',
                ingredients = {
                    potato_cabbage = 1,
                    tomato_raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'soup_ingredients',
                ingredients = {
                    potato_tomato = 1,
                    cabbage_raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'soup_ingredients',
                ingredients = {
                    potato_raw_meat = 1,
                    cabbage_tomato = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'raw_soup',
                ingredients = {
                    soup_ingredients = 1,
                    cooking_pot = 1,
                },
                duration = 5000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 7
    {
        items = {
			-- CONSTRUÇÃO Inventário
            {
                name = 'lockpick',
                ingredients = {
                    garbage = 1,
                    metalscrap = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'WEAPON_KNIFE',
                ingredients = {
                    stick = 1,
                    iron = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'WEAPON_POOLCUE',
                ingredients = {
                    duct_tape = 1,
                    wood = 2,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'WEAPON_HATCHET',
                ingredients = {
                    iron = 1,
                    stick = 2,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'WEAPON_HATCHET',
                ingredients = {
                    steel = 1,
                    stick = 2,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'WEAPON_HAMMER',
                ingredients = {
                    iron = 1,
                    stick = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'handsaw',
                ingredients = {
                    steel = 2,
                    plastic = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'huntingbait',
                ingredients = {
                    stick = 1,
                    raw_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'paperbag',
                ingredients = {
                    printer_paper = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'basic_rod',
                ingredients = {
                    stick = 2,
                    rope = 3,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'artificial_bait',
                ingredients = {
                    worms = 5,
                    can = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'disinfectant',
                ingredients = {
                    bandage = 1,
                    water_bottle = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'clothing_bag',
                ingredients = {
                    suturekit = 1,
                    cloth = 15,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'nightvision',
                ingredients = {
                    can = 1,
                    radiocell = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'whetstone',
                ingredients = {
                    stone = 2,
                    carbon = 2,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'advanced_whetstone',
                ingredients = {
                    uncut_diamond = 1,
                    whetstone = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'ammo-musket',
                ingredients = {
                    gunpowder = 5,
                    iron = 5,
                },
                duration = 5000,
                count = 5,
            },
            {
                name = 'ammo-stungun',
                ingredients = {
                    radiocell = 1,
                    plastic = 1,
                },
                duration = 5000,
                count = 3,
            },
            {
                name = 'empty_water_bottle',
                ingredients = {
                    plastic = 5
                },
                duration = 5000,
                count = 2
            },
            {
                name = 'rope',
                ingredients = {
                    vegetal_fiber = 3
                },
                duration = 5000,
                count = 1
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 8
    {
        items = {
			-- CONSTRUÇÃO Pets
            {
                name = 'petfood',
                ingredients = {
                    cooked_meat = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'petfood',
                ingredients = {
                    raw_meat = 2,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'collarpet',
                ingredients = {
                    rope = 1,
                    iron = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'firstaidforpet',
                ingredients = {
                    bandage = 1,
                    adrenaline = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'petwaterbottleportable',
                ingredients = {
                    water_bottle = 1,
                },
                duration = 5000,
                count = 1,
            },
            {
                name = 'petgroomingkit',
                ingredients = {
                    plastic = 5,
                    rubber = 2,
                },
                duration = 5000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 9
    {
        items = {
			-- Katanas
            {
                name = 'WEAPON_KATANA',
                ingredients = {
                    katana_hilt = 1,
                    katana_hilt_pin = 1,
                    katana_hilt_tsuba = 1,
                    katana_blade = 1,
                },
                duration = 120000,
                count = 1,
            },
            {
                name = 'WEAPON_CHERRYKATANAS',
                ingredients = {
                    sakura_katana_hilt = 1,
                    sakura_katana_hilt_pin = 1,
                    sakura_katana_blade = 1,
                },
                duration = 180000,
                count = 1,
            },
            {
                name = 'sakura_wooden_plank',
                ingredients = {
                    sakura_wood = 1,
                },
                duration = 25000,
                count = 1,
            },
            {
                name = 'sakura_katana_hilt',
                ingredients = {
                    sakura_wooden_plank = 5,
                    rope = 5,
                    diamond = 1
                },
                duration = 60000,
                count = 1,
            },
            {
                name = 'sakura_katana_hilt_pin',
                ingredients = {
                    goldbar = 1,
                    steel = 1,
                },
                duration = 35000,
                count = 5,
            },
            {
                name = 'sakura_katana_blade',
                ingredients = {
                    steel = 15,
                    silveringot = 3,
                    carbon = 5,
                },
                duration = 120000,
                count = 1,
            },
            {
                name = 'katana_hilt',
                ingredients = {
                    wooden_plank = 5,
                    rope = 5
                },
                duration = 45000,
                count = 1,
            },
            {
                name = 'katana_hilt_pin',
                ingredients = {
                    iron = 5,
                    nail = 2,
                },
                duration = 30000,
                count = 25,
            },
            {
                name = 'katana_hilt_tsuba',
                ingredients = {
                    iron = 2,
                    carbon = 2,
                    silveringot = 1,
                },
                duration = 30000,
                count = 1,
            },
            {
                name = 'katana_blade',
                ingredients = {
                    steel = 5,
                    carbon = 5,
                    silveringot = 1,
                    iron = 5,
                },
                duration = 90000,
                count = 1,
            },
        },
        points = {
        },
        zones = {
        },
        blip = { id = 566, colour = 31, scale = 0.8 },
    }, -- INDEX = 10
}
