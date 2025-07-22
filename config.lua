Config = {}

-- Radiation zones (example)
Config.Zones = {
    {
        name = "Nuclear Site",
        coords = vector3(123.4, 456.7, 78.9),
        radius = 50.0,
        radiationLevel = 5 -- per second
    }
}

-- Gas mask item name and filter duration
Config.GasMaskItem = "gasmask"
Config.FilterDuration = 600 -- in seconds
