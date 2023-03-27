function StartSearchAndRescue()
    local model = {
        "mp_m_fibsec_01",
        "s_f_y_cop_01",
        "s_f_y_sheriff_01",
        "s_m_m_fiboffice_01",
        "s_m_m_ciasec_01",
        "s_m_y_hwaycop_01",
        "s_m_y_ranger_01",
        "s_m_y_sheriff_01",
        "s_m_y_swat_01",
        "ig_karen_daniels",
        "u_m_m_fibarchitect"
    } 

    local weaponHashPistol = {
        "weapon_pistol",
        "weapon_combatpistol",
        "weapon_revolver"
    }

    local weaponHashMelee = {
        "weapon_nightstick",
        "weapon_flashlight",
        "weapon_bottle"
    }

    local vehicleHashPolice = {
        "fbi",
        "fbi2",
        "police",
        "police2",
        "police3",
        "police4",
        "policeb",
        "pranger",
        "sheriff",
        "sheriff2",
        "policeold2",
    }

    for _, PlayerId in ipairs(GetPlayers()) do
        if PlayerId ~= id then
            local ped = GetPlayerPed(PlayerId())
            SetPlayerModel(PlayerId(), model[math.random(#model)])
            
            GiveWeaponToPed(ped, "GADGET_PARACHUTE", 1, false, false)
            GiveWeaponToPed(ped, GetHashKey(weaponHashMelee[math.random(#weaponHashMelee)]), 1, false, false)
            GiveWeaponToPed(ped, GetHashKey(weaponHashPistol[math.random(#weaponHashPistol)]), 100, false, false)
            
            StartPlayerTeleport(PlayerId(), Config.coords.x[math.random(#coords.x)], coords.y[math.random(#Config.coords.y)], Config.coords.z[math.random(#Config.coords.z)], 0.0, false, true, true)
            while IsPlayerTeleportActive() do
                    Citizen.Wait(0)
                end
            CreateVehicle(vehicleHashPolice[math.random(#vehicleHashPolice)], Config.coordsVeh.x[math.random(#Config.coordsVeh.x)], Config.coordsVeh.y[math.random(#Config.coordsVeh.y)], Config.coordsVeh.z[math.random(#Config.coordsVeh.z)], 0.0, true, true)
        end

        CreateVehicle("polmav", 150.0, 100.0, 50.0, 0.0, true, true)
    end

    while true do

    end
end