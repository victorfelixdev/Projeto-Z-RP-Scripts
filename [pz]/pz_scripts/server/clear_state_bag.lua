local debugActive = false
local STATEBAG_SET = {
    player = function(bagName, key)
        local source = GetPlayerFromStateBagName(bagName)
        if (source == 0) then return end

        Player(source).state:set(key, nil, true)
    end,
    global = function(bagName, key)
        GlobalState[key] = nil
    end,
    entity = function(bagName, key)
        local handler = GetEntityFromStateBagName(bagName)
        if (handler == 0) then return end

        Entity(handler).state:set(key, nil, true)
    end
}

local function findStateMode(bagName)
    for mode in pairs(STATEBAG_SET) do 
        if bagName:find(mode) or (bagName == mode) then 
            return mode
        end
    end
end

AddStateBagChangeHandler(nil, nil, function(bagName, key, value) 
    if not value and (type(value) == 'boolean') then 
        local mode = findStateMode(bagName)
        if debugActive then
            print(('Trocar para nil: %s %s %s'):format(bagName, key, value))
        end
        STATEBAG_SET[mode](bagName, key)
    end
end)