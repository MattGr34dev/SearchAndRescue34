RegisterCommand('startsr', function (args, name)
    local id = args[1]
    name = GetPlayerName(id)
    TriggerEvent('chat:addMessage',  {
        color = { 5, 255, 255 }, 
        multiline = false,
        args = { name, "стал целью, у вас есть 30 минут, чтоб найти его!" }  
    })
    local model = {
        'a_m_m_bevhills_01',
        'a_m_m_bevhills_02',
        'a_m_m_eastsa_01',
        'a_m_m_hillbilly_01',
        'a_m_m_genfat_01',
        'a_m_m_fatlatin_01',
        'a_m_m_farmer_01',
        'a_m_m_genfat_01',
        'a_m_m_genfat_02',
        'a_m_m_mexlabor_01',
        'a_m_m_ktown_01',
        'a_m_m_polynesian_01',
        'a_m_m_salton_02',
        'a_m_y_beachvesp_02',
        'a_m_y_genstreet_02',
        'a_m_y_mexthug_01',
        'a_m_y_salton_01',
        'a_m_y_stbla_01',
        'a_m_y_stwhi_02'
    } 
    TriggerEvent(SetPlayerModel(id, model[math.random(#model)]))
    TriggerServerEvent(StartSearchAndRescue)
end, true)

local ped = GetPlayerPed(id)
local dead = false

Citizen.CreateThread(function()
    while not dead do
        if IsEntityDead(ped) then
            dead = true
            TriggerServerEvent("chat:addMessage", -1, {
                args = { name, "проиграл! Полиция победила!" },   
                color = { 5, 255, 255 }
            })
        end
    Wait(1000)
    end
end)

TriggerEvent('chat:addSuggestion', '/startsr', 'Начать игру S&R', {{ name="id", help="Введите id игрока" }})