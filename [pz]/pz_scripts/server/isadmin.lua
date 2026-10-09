RegisterNetEvent('pz_scripts:SV:isAdmin', function()
    local isAdmin = exports.zdiscord:isRolePresent(source,"1356307312444444713")
    Player(source).state.isAdmin = isAdmin
end)