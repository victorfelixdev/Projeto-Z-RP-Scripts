function Debug(data, title)
  if title then
    print(title)
  end
  print(json.encode(data, { indent = true }))
end