ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end

    Wait(1000)

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded') 
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:playerLogout') 
AddEventHandler('esx:playerLogout', function(xPlayer, isNew)
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- Markers
CreateThread(function()
    Wait(2000)
    while true do
        Wait(0)

        local _sleep = true

            for k,v in pairs(Config.Mechanic) do

                if ESX.PlayerData.job and ESX.PlayerData.job.name == "mechanic" then  
                
                    local _coords = GetEntityCoords(PlayerPedId())
                    local _dist = #(_coords - v.Wardrobe) < 1
                    local _pid = PlayerPedId()

                    if _dist then
                        _sleep = false
                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to open the Wardrobe', v.Wardrobe)
                        if IsControlJustPressed(0, 38) then
                            ArmarioMenu()
                        end
                    end
                    local _marker = #(_coords - v.Wardrobe) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        DrawMarker(20, v.Wardrobe, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end

                    local _dist = #(_coords - v.SpawnCars) < 3
                    if _dist then
                        _sleep = false

                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to open the Garage', v.SpawnCars)

                        if IsControlJustPressed(0, 38) then
                            OpenGarajeMenu()
                        end
                    end
                    local _marker = #(_coords - v.SpawnCars) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
		                DrawMarker(20, v.SpawnCars, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end



                    local _dist = #(_coords - v.DeleteCars) < 3
                    if _dist then
                        _sleep = false
                        if IsPedInAnyVehicle(PlayerPedId()) then

                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to delete the vehicle', v.DeleteCars)

                            if IsControlJustPressed(0, 38) then
                                local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
                                TaskLeaveVehicle(PlayerPedId(), veh, 0)
                                Wait(3000)
                                NetworkFadeOutEntity(veh, false, true)
                                Wait(1000)
                                DeleteVehicle(GetVehiclePedIsIn(_pid))
                                ESX.ShowNotification('Has ~r~guardado~w~ el ~g~vehiculo~s~ en el ~g~garaje')
                            
                            end
                        end
                    end
                    local _marker = #(_coords - v.DeleteCars) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
		                DrawMarker(20, v.DeleteCars, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end


                    local _dist = #(_coords - v.Boss) < 1
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        if _dist then
                            _sleep = false
                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to open the boss menu', v.Boss)
                            if IsControlJustPressed(0, 38) then
                                TriggerEvent('esx_society:openBossMenu', 'mechanic', function(data, menu)
                                    menu.close()
                                end)
                            end
                        end
                    end
                    local _marker = #(_coords - v.Boss) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        DrawMarker(20, v.Boss, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end


                    local _dist = #(_coords - v.Cloakrooms) < 1
                    if _dist then
                            _sleep = false
                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to open the Locker', v.Cloakrooms)
                            if IsControlJustPressed(0, 38) then
                                IndocumentarioMenu()
                            end
                    end
                    local _marker = #(_coords - v.Cloakrooms) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        DrawMarker(20, v.Cloakrooms, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end


                    local _dist = #(_coords - v.Props) < 1
                    if _dist then
                        if Config.HabilitarProps then
                            _sleep = false
                        ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to open the props menu', v.Props)
                            if IsControlJustPressed(0, 38) then
                                OpenProps()
                            end

                        end
                    end
                    local _marker = #(_coords - v.Props) < 10
                    if _marker then
                        _sleep = false
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        DrawMarker(20, v.Props, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 1, 1, 1, 250, false, true, 2, nil, nil, false)
                    end


                end
        end
        if _sleep then Wait(1000) end
    end
end)


-- Blips
CreateThread(function()
    local blip = AddBlipForCoord(1148.22, -785.79, 57.6)

	SetBlipSprite (blip, 446)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.6)
	SetBlipColour (blip, 0) -- Color Rojo
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("Mirror Park Mechanic")
	EndTextCommandSetBlipName(blip)
end)

-- Action Menu
RegisterKeyMapping('z12c12xMechanicActions', 'Actions Menu (Mechanic).', 'keyboard', 'F6')
RegisterCommand('z12c12xMechanicActions', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' and not isDead then
    MechanicActions()
    else
        Wait(500)
    end
end)

