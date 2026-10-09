local function createCarsMenuOX()
  local options = {}
  local myCars = lib.callback.await('pz_vehicles:SV:GetCars', false)
  if not myCars then
      exports.qbx_core:Notify('Nenhum veículo vencido!', 'success')
      return
  end
  for i, car in pairs(myCars) do
      -- print(json.encode(car, { indent = true }))
      options[#options + 1] = {
          title = ('%s | %s'):format(car.vehicle, car.plate),
          description = ('Vencido em: %s'):format(car.next_payment),
          icon = 'clock',
          arrow = true,
          onSelect = function()
              local confirm = lib.alertDialog({
                  header = 'Pagar Veículo',
                  content = ('Tem certeza de que deseja pagar o veículo %s de placa %s ?'):format(car.vehicle, car.plate),
                  centered = true,
                  cancel = true
              })
              if confirm == "confirm" then
                  TriggerServerEvent('qbx_vehicleshop:server:payVehicleRent', car.plate, car.vehicle)
              end
              
          end
      }
  end

  local title = 'Meus Veículos Vencidos'

  lib.registerContext({
      id = 'cars_menu',
      menu = 'menu_jogador',
      title = title,
      options = options
  })

  lib.showContext('cars_menu')
end

RegisterCommand('mycars', function()
  createCarsMenuOX()
end)
