local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback(Config.Banking ..':server:metroPay', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney(Config.PayType, Config.TicketPrice) then
        cb(true)
    else
        print("false")
        cb(false)
    end
end)