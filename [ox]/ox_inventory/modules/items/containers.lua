local containers = {}

---@class ItemContainerProperties
---@field slots number
---@field maxWeight number
---@field whitelist? table<string, true> | string[]
---@field blacklist? table<string, true> | string[]

local function arrayToSet(tbl)
	local size = #tbl
	local set = table.create(0, size)

	for i = 1, size do
		set[tbl[i]] = true
	end

	return set
end

---Registers items with itemName as containers (i.e. backpacks, wallets).
---@param itemName string
---@param properties ItemContainerProperties
---@todo Rework containers for flexibility, improved data structure; then export this method.
local function setContainerProperties(itemName, properties)
	local blacklist, whitelist = properties.blacklist, properties.whitelist

	if blacklist then
		local tableType = table.type(blacklist)

		if tableType == 'array' then
			blacklist = arrayToSet(blacklist)
		elseif tableType ~= 'hash' then
			TypeError('blacklist', 'table', type(blacklist))
		end
	end

	if whitelist then
		local tableType = table.type(whitelist)

		if tableType == 'array' then
			whitelist = arrayToSet(whitelist)
		elseif tableType ~= 'hash' then
			TypeError('whitelist', 'table', type(whitelist))
		end
	end

	containers[itemName] = {
		size = { properties.slots, properties.maxWeight },
		blacklist = blacklist,
		whitelist = whitelist,
	}
end

setContainerProperties('paperbag', {
	slots = 10,
	maxWeight = 5000,
	whitelist = { 'garbage', 'can', 'printer_paper' }
})

setContainerProperties('backpack1', {
	slots = 10,
	maxWeight = 20000,
	blacklist = { 'bau', 'tire', 'model_generator_small', 'model_generator_medium', 'model_generator_big', 
	'model_door_wood', 'model_window_wood', 'model_windowway_wood', 'model_wall_wood', 'model_doorway_wood',
    'model_gateway_wood', 'model_base_wood', 'model_ceiling_wood', 'model_ceilingstairs_wood',
    'model_pillar_wood', 'model_gate_wood', 'model_bigwall_wood', 'model_biggateway_wood',
    'model_biggate_wood', 'model_base_wood_triangle', 'model_ceiling_wood_triangle',
    'model_wall_wood_roof', 'model_wall_wood_roof_triangle', 'model_wall_wood_small',
    'model_wall_wood_triangle', 'model_ceilingladder_wood_triangle', 'model_stairs_wood', 'model_door_stone', 'model_window_stone', 'model_windowway_stone', 'model_wall_stone', 'model_doorway_stone',
    'model_gateway_stone', 'model_base_stone', 'model_ceiling_stone', 'model_ceilingstairs_stone',
    'model_pillar_stone', 'model_gate_stone', 'model_base_stone_triangle', 'model_ceiling_stone_triangle',
    'model_wall_stone_roof', 'model_wall_stone_roof_triangle', 'model_wall_stone_small',
    'model_wall_stone_triangle', 'model_ceilingladder_stone_triangle', 'model_stairs_stone', 'model_door_metal', 'model_window_metal', 'model_windowway_metal', 'model_wall_metal', 'model_doorway_metal',
    'model_gateway_metal', 'model_base_metal', 'model_ceiling_metal', 'model_ceilingstairs_metal',
    'model_pillar_metal', 'model_gate_metal', 'model_base_metal_triangle', 'model_ceiling_metal_triangle',
    'model_wall_metal_roof', 'model_wall_metal_roof_triangle', 'model_wall_metal_small',
    'model_wall_metal_triangle', 'model_ceilingladder_metal_triangle', 'model_stairs_metal', 'bkr_prop_biker_campbed_01', 'v_tre_sofa_mess_b_s', 'imp_prop_impexp_boxwood_01',
    'gr_prop_gr_gunlocker_01a', 'p_v_43_safe_s',
    'prop_tool_bench02_ld', 'bkr_prop_meth_table01a', 'gr_prop_gr_bench_02a', 
    'imp_prop_impexp_mechbench', 'gr_prop_gr_bench_04b', 'prop_planer_01', 'ex_prop_crate_expl_sc',
    'model_oldlight_ext', 'model_worklight_1', 'model_biglight_1',
    'prop_solarpanel_02', 'prop_solarpanel_03', 'prop_rural_windmill'}
})
setContainerProperties('backpack2', {
	slots = 20,
	maxWeight = 35000,
	blacklist = { 'bau', 'tire', 'model_generator_small', 'model_generator_medium', 'model_generator_big',
	'model_door_wood', 'model_window_wood', 'model_windowway_wood', 'model_wall_wood', 'model_doorway_wood',
    'model_gateway_wood', 'model_base_wood', 'model_ceiling_wood', 'model_ceilingstairs_wood',
    'model_pillar_wood', 'model_gate_wood', 'model_bigwall_wood', 'model_biggateway_wood',
    'model_biggate_wood', 'model_base_wood_triangle', 'model_ceiling_wood_triangle',
    'model_wall_wood_roof', 'model_wall_wood_roof_triangle', 'model_wall_wood_small',
    'model_wall_wood_triangle', 'model_ceilingladder_wood_triangle', 'model_stairs_wood', 'model_door_stone', 'model_window_stone', 'model_windowway_stone', 'model_wall_stone', 'model_doorway_stone',
    'model_gateway_stone', 'model_base_stone', 'model_ceiling_stone', 'model_ceilingstairs_stone',
    'model_pillar_stone', 'model_gate_stone', 'model_base_stone_triangle', 'model_ceiling_stone_triangle',
    'model_wall_stone_roof', 'model_wall_stone_roof_triangle', 'model_wall_stone_small',
    'model_wall_stone_triangle', 'model_ceilingladder_stone_triangle', 'model_stairs_stone', 'model_door_metal', 'model_window_metal', 'model_windowway_metal', 'model_wall_metal', 'model_doorway_metal',
    'model_gateway_metal', 'model_base_metal', 'model_ceiling_metal', 'model_ceilingstairs_metal',
    'model_pillar_metal', 'model_gate_metal', 'model_base_metal_triangle', 'model_ceiling_metal_triangle',
    'model_wall_metal_roof', 'model_wall_metal_roof_triangle', 'model_wall_metal_small',
    'model_wall_metal_triangle', 'model_ceilingladder_metal_triangle', 'model_stairs_metal', 'bkr_prop_biker_campbed_01', 'v_tre_sofa_mess_b_s', 'imp_prop_impexp_boxwood_01',
    'gr_prop_gr_gunlocker_01a', 'p_v_43_safe_s',
    'prop_tool_bench02_ld', 'bkr_prop_meth_table01a', 'gr_prop_gr_bench_02a', 
    'imp_prop_impexp_mechbench', 'gr_prop_gr_bench_04b', 'prop_planer_01', 'ex_prop_crate_expl_sc',
    'model_oldlight_ext', 'model_worklight_1', 'model_biglight_1',
    'prop_solarpanel_02', 'prop_solarpanel_03', 'prop_rural_windmill'}
})
setContainerProperties('backpack3', {
	slots = 50,
	maxWeight = 100000,
	blacklist = { 'bau', 'tire', 'model_generator_small', 'model_generator_medium', 'model_generator_big', 
	'model_door_wood', 'model_window_wood', 'model_windowway_wood', 'model_wall_wood', 'model_doorway_wood',
    'model_gateway_wood', 'model_base_wood', 'model_ceiling_wood', 'model_ceilingstairs_wood',
    'model_pillar_wood', 'model_gate_wood', 'model_bigwall_wood', 'model_biggateway_wood',
    'model_biggate_wood', 'model_base_wood_triangle', 'model_ceiling_wood_triangle',
    'model_wall_wood_roof', 'model_wall_wood_roof_triangle', 'model_wall_wood_small',
    'model_wall_wood_triangle', 'model_ceilingladder_wood_triangle', 'model_stairs_wood', 'model_door_stone', 'model_window_stone', 'model_windowway_stone', 'model_wall_stone', 'model_doorway_stone',
    'model_gateway_stone', 'model_base_stone', 'model_ceiling_stone', 'model_ceilingstairs_stone',
    'model_pillar_stone', 'model_gate_stone', 'model_base_stone_triangle', 'model_ceiling_stone_triangle',
    'model_wall_stone_roof', 'model_wall_stone_roof_triangle', 'model_wall_stone_small',
    'model_wall_stone_triangle', 'model_ceilingladder_stone_triangle', 'model_stairs_stone', 'model_door_metal', 'model_window_metal', 'model_windowway_metal', 'model_wall_metal', 'model_doorway_metal',
    'model_gateway_metal', 'model_base_metal', 'model_ceiling_metal', 'model_ceilingstairs_metal',
    'model_pillar_metal', 'model_gate_metal', 'model_base_metal_triangle', 'model_ceiling_metal_triangle',
    'model_wall_metal_roof', 'model_wall_metal_roof_triangle', 'model_wall_metal_small',
    'model_wall_metal_triangle', 'model_ceilingladder_metal_triangle', 'model_stairs_metal', 'bkr_prop_biker_campbed_01', 'v_tre_sofa_mess_b_s', 'imp_prop_impexp_boxwood_01',
    'gr_prop_gr_gunlocker_01a', 'p_v_43_safe_s',
    'prop_tool_bench02_ld', 'bkr_prop_meth_table01a', 'gr_prop_gr_bench_02a', 
    'imp_prop_impexp_mechbench', 'gr_prop_gr_bench_04b', 'prop_planer_01', 'ex_prop_crate_expl_sc',
    'model_oldlight_ext', 'model_worklight_1', 'model_biglight_1',
    'prop_solarpanel_02', 'prop_solarpanel_03', 'prop_rural_windmill'}
})

setContainerProperties('outfit', {
	slots = 8,
	maxWeight = 5000,
	whitelist = { 'cloth_mask', 'cloth_torso', 'cloth_shirt', 'cloth_gloves', 'cloth_pants', 'cloth_shoes', 'cloth_hat', 'cloth_glass' }
})

setContainerProperties('pizzabox', {
	slots = 5,
	maxWeight = 1000,
	whitelist = { 'pizza' }
})

setContainerProperties('keyring', {
	slots = 10,
	maxWeight = 100,
	whitelist = { 'vehiclekey'}
})

return containers
