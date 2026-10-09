CreateThread(function()
  GetUnpaidCars()
end)

lib.callback.register('pz_vehicles:SV:GetCars', function(source)
  local unpaidCars = GetUnpaidCars()
  return unpaidCars
end)

function GetUnpaidCars()
  local currentDate = os.date("%Y-%m-%d %H:%M:%S")
  
  local results = MySQL.query.await([[
      SELECT * FROM player_vehicles
      WHERE plate LIKE 'PJZ%%' AND next_payment < ?
  ]], { currentDate })

  if results and #results > 0 then
      for _, row in pairs(results) do
          
          GlobalState[row.plate] = true
          local date = os.date("%d/%m/%Y %H:%M:%S", math.floor(row.next_payment / 1000))
          row.next_payment = date
          print(("Placa: %s | Vencimento: %s"):format(row.plate, date))
      end
  else
      print("Nenhum veículo vencido encontrado com placa começando por 'PJZ'.")
      return nil
  end
  return results
end
