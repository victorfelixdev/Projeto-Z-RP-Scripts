lib.addCommand('persistence', {
  help = "Ativar/Desativar a Persistência do Veículo (Apenas Admin)",
    params = {
      {
          name = 'type',
          type = 'number',
          help = '1 para ativar. 0 para desativar',
      },
  },
  restricted = 'group.admin'
}, function(source, args)
  if not args.type then return end
  local ped = GetPlayerPed(source)
  local currentVehicle = GetVehiclePedIsIn(ped, false)
  if currentVehicle and currentVehicle ~= 0 then
      local netId = NetworkGetNetworkIdFromEntity(currentVehicle)
      
      local isPersistent = lib.callback.await('pz_vehicles:CL:getVehiclePersistenceFromNetworkId', source, netId)
      print(isPersistent)
      if args.type == 1 then
        TriggerClientEvent('pz_vehicles:CL:setPersistenceFromNetworkId', source, netId)
        lib.notify(source, {description = 'Persistência do veículo adicionada!', type = 'success', position = 'bottom'})
      else
        TriggerClientEvent('pz_vehicles:CL:removePersistenceFromNetworkId', source, netId)
        lib.notify(source, {description = 'Persistência do veículo removida!', type = 'success', position = 'bottom'})
      end
  end
end)