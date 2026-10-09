local function createLog(type, log, player1, player2, coords, item, count)
    exports.oxmysql:insert('INSERT INTO logs (type, log, player1, player2, coords, item, count) VALUES (?, ?, ?, ?, ?, ?, ?)',
    { type, log, player1, player2, coords, item, count }, function(insertId)
    end)
end

exports('CreateLog', createLog)