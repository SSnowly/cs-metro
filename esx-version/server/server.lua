ESX = exports['es_extended']:getSharedObject()

if Config.Notify == '' then
    print('^1Please set a notify type in the config.lua.')
end 
if Config.TextUI == '' then
    print('^1Please set a TextUI type in the config.lua.')
end



ESX.RegisterServerCallback(Config.Banking .. ':metroPay', function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.TicketPrice
    if Config.PayType == 'money' then
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            cb(true)
        else
            cb(false)
        end
    elseif Config.PayType == 'bank' then
        if xPlayer.getAccount('bank').money >= price then
            xPlayer.removeAccountMoney('bank', price)
            cb(true)
        else
            cb(false)
        end
    end
end)
