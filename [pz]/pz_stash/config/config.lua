Config = {}
Config.Debug = true
Config.StorageModel = 'bau'
Config.StorageItem = 'bau'
Config.LockItem = 'cadeado'
Config.StorageScene = 7
Config.AccessItem = 'chave_bau'
Config.Stash = {
  name = 'Baú',
  slotSize = 25,
  weight = 80000,
  targetlabel = 'Abrir baú',
  webhookURL = 'https://discord.com/api/webhooks/1352199854713081966/dTYmpPtNJulw8codC0HeDYaflxyB9bSK1ekPE0kRP-Cvpw_klrhaQN5JKZPu4gO0kWIi',
}
Config.StashUpgrades = {
  item = 'upgrade_stash',
  weight = 5000,
  slots = 5,
}
Config.StashTemplate = {
  [1] = 'Baú', -- name
  [2] = nil, -- job
  [3] = nil, --gang
  [4] = nil, -- rank
  [5] = nil, -- item
  [6] = 30, -- slot size
  [7] = 500, -- weight
  [8] = nil, -- password
  [9] = nil, -- citizenID
  [10] = 'Abrir baú', -- Label
  [11] = 'https://discord.com/api/webhooks/1352199854713081966/dTYmpPtNJulw8codC0HeDYaflxyB9bSK1ekPE0kRP-Cvpw_klrhaQN5JKZPu4gO0kWIi', -- webhook
}