local PlayerRadiation = {}

RegisterServerEvent("radiation:update")
AddEventHandler("radiation:update", function(val)
    local src = source
    PlayerRadiation[src] = val
    TriggerClientEvent("radiation:updateUI", src, val)
end)

RegisterServerEvent("radiation:damage")
AddEventHandler("radiation:damage", function()
    local src = source
    local ped = GetPlayerPed(src)
    local health = GetEntityHealth(ped)
    SetEntityHealth(ped, math.max(health - Config.DamagePerTick, 1))
end)
