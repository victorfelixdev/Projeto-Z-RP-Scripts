Citizen.CreateThread(function()
  RequestIpl("v_hospital")
  -- Opcional: Remove a versão padrão (fixa) do interior, se ela estiver carregada
  RemoveIpl("RC12B_Fixed")
  RemoveIpl("RC12B_Default")
  -- Solicita a IPL do interior destruído
  RequestIpl("RC12B_Destroyed")
  RequestIpl("RC12B_HospitalInterior")
  
  
  -- (Opcional) Obtenha o ID do interior com base nas coordenadas do hospital.
  -- Atenção: as coordenadas podem variar conforme o mapa. Ajuste se necessário.
  local interior = GetInteriorAtCoords(308.0, -592.0, 43.0)
  
  if IsValidInterior(interior) then
      -- (Opcional) Ativa o conjunto de entidades referente ao interior destruído
      ActivateInteriorEntitySet(interior, "RC12B_Destroyed")
      -- Atualiza o interior para aplicar as mudanças
      RefreshInterior(interior)
  end
end)
