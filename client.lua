local radiation = 0
local maxRadiation = Config.MaxRadiation
local wearingMask = false

RegisterNetEvent("radiation:updateUI", function(val)
    SendNUIMessage({ action = "radiation", value = val })
end)

-- Tick เพิ่มค่ารังสี
CreateThread(function()
    while true do
        Wait(Config.RadiationTick * 1000)

        if wearingMask then goto continue end

        radiation = math.min(radiation + Config.RadiationIncrease, maxRadiation)
        TriggerServerEvent("radiation:update", radiation)

        if radiation >= maxRadiation then
            TriggerServerEvent("radiation:damage")
            SendNUIMessage({ action = "radiation_alert" })
            PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        end

        ::continue::
    end
end)

RegisterNetEvent("radiation:checkMask", function(mask)
    wearingMask = mask
end)

RegisterCommand("radiation_ui", function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "show" })
end)
