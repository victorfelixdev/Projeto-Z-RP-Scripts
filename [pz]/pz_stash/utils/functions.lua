function DebugLog(msg)
  if Config.Debug then
      print("[DEBUG] " .. msg)
  end
end

function DebugObject(objName, obj)
  if Config.Debug then
      print("[DEBUG] (" .. objName .. "): " .. json.encode(obj))
  end
end

function GenerateRandomCode(length)
  local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  local code = ''
  for i = 1, length do
      local randomIndex = math.random(1, #chars)
      code = code .. chars:sub(randomIndex, randomIndex)
  end
  return code
end