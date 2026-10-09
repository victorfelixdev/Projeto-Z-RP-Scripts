Config = {}
Config.allowedVehicles = {
    ["RHINO"] = { maxAmmo = 1, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true },
    ["APC"] = { maxAmmo = 3, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true },
    ["KHANJALI"] = { maxAmmo = 1, ammoType = "ammo-laser", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true },
    ["INSURGENT3"] = { maxAmmo = 100, ammoType = "ammo-heavysniper", reloadTime = 12000, firerate = 5, canReloadWhileRunning = true },
    ["tampa3"] = { maxAmmo = 100, ammoType = "ammo-heavysniper", reloadTime = 12000, firerate = 5, canReloadWhileRunning = true },
    ["BUZZARD"] = { maxAmmo = 2, ammoType = "ammo-rocket", reloadTime = 12000, firerate = 1, canReloadWhileRunning = false },
    ["ANNIHL"] = { maxAmmo = 400, ammoType = "ammo-heavysniper", reloadTime = 12000, firerate = 2, canReloadWhileRunning = false },
    ["BOXVILLE5"] = { maxAmmo = 80, ammoType = "ammo-heavysniper", reloadTime = 12000, firerate = 5, canReloadWhileRunning = false },
    -- Adicione outros veículos conforme necessário
}

Config.VehicleWeaponHash = {
    Invalid = -1,
    Unarmed = 0,
    Tank = 1945616459,
    SpaceRocket = -123497569,
    PlaneRocket = -821520672,
    PlayerLaser = -268631733,
    PlayerBullet = 1259576109,
    PlayerBuzzard = 1186503822,
    PlayerHunter = -1625648674,
    PlayerLazer = -494786007,
    EnemyLaser = 1566990507,
    SearchLight = -844344963,
    Radar = -764006018,
    Insurgent = 1155224728,
    Raiju = -1155745516,
    BoxVille5 = -1253095144,
    Kanjali = 507170720,
    APC = 328167896,
    Raiju2 = 999645094
}
Config.AmmoType = {
    ["0"] = { name = 'UNARMED', maxAmmo = 0, ammoType = "", reloadTime = 15000, firerate = 500, canReloadWhileRunning = false, disabled = true },
    ["1186503822"] = { name = 'VEHICLE_WEAPON_PLAYER_BUZZARD', maxAmmo = 250, ammoType = "ammo-heavysniper", reloadTime = 15000, firerate = 5, canReloadWhileRunning = true, disabled = false },
    ["1155224728"] = { name = 'VEHICLE_WEAPON_TURRET_INSURGENT', maxAmmo = 100, ammoType = "ammo-heavysniper", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["-1253095144"] = { name = 'VEHICLE_WEAPON_TURRET_INSURGENT', maxAmmo = 100, ammoType = "ammo-heavysniper", reloadTime = 15000, firerate = 5, canReloadWhileRunning = true, disabled = false },
    ["-494786007"] = { name = 'VEHICLE_WEAPON_PLAYER_RAIJU', maxAmmo = 1000, ammoType = "ammo-heavysniper", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["-1155745516"] = { name = 'VEHICLE_WEAPON_PLAYER_RAIJU_GUN', maxAmmo = 1000, ammoType = "ammo-heavysniper", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["999645094"] = { name = 'VEHICLE_WEAPON_PLAYER_RAIJU_2', maxAmmo = 4, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = false, disabled = false },
    ["-123497569"] = { name = 'VEHICLE_WEAPON_SPACE_ROCKET', maxAmmo = 2, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["-821520672"] = { name = 'VEHICLE_WEAPON_PLANE_ROCKET', maxAmmo = 2, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["-268631733"] = { name = 'VEHICLE_WEAPON_PLAYER_LASER', maxAmmo = 1, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["1945616459"] = { name = 'VEHICLE_WEAPON_PLAYER_RHINO', maxAmmo = 1, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["328167896"] = { name = 'VEHICLE_WEAPON_PLAYER_APC', maxAmmo = 1, ammoType = "ammo-rocket", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
    ["507170720"] = { name = 'VEHICLE_WEAPON_PLAYER_KANJALI', maxAmmo = 1, ammoType = "ammo-laser", reloadTime = 15000, firerate = 1, canReloadWhileRunning = true, disabled = false },
}