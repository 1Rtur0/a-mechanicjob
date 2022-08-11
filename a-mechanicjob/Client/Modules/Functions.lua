OpenProps = function()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu', {
		title = "Props",
		align = Config.Align,
		elements = {
			{label ="Wheel", value = "llanta"},
			{label ="Door", value = "puerta"},
			{label ="Seat", value = "seat"}, 
			{label ="Hood", value = "capot"},
			{label ="Bumper", value = "paragolpe"}, 
			{label ="Tailpipe", value = "escape"}, 
			{label ="Small Engine", value = "motorc"}, 
			{label ="Big Engine", value = "motorg"}, 
			{label ="Caliper", value = "caliper"},
			{label ="Transmission", value = "transmision"},  
			{label ="Carburetor", value = "carburador"},  
			{label ="Wheel Cover", value = "cubrerueda"}, 
			{label ="Battery", value = "bateria"}, 
			{label ="Deck", value = "Cubierta"}, 
		}
	}, function(data,menu)
		local c = data.current
		if data.current.value == "puerta" then
			TriggerEvent('mecanico:prop', {prop = "door"})
		elseif data.current.value == "llanta" then
			TriggerEvent('mecanico:prop', {prop = "tire"})
		elseif data.current.value == "seat" then
			TriggerEvent('mecanico:prop', {prop = "asiento"})
		elseif data.current.value == "capot" then
			TriggerEvent('mecanico:prop', {prop = "capot"})
		elseif data.current.value == "paragolpe" then
			TriggerEvent('mecanico:prop', {prop = "paragolpe"})
		elseif data.current.value == "escape" then
			TriggerEvent('mecanico:prop', {prop = "escape"})
		elseif data.current.value == "motorc" then
			TriggerEvent('mecanico:prop', {prop = "motorc"})
		elseif data.current.value == "motorg" then
			TriggerEvent('mecanico:prop', {prop = "motorg"})
		elseif data.current.value == "caliper" then
			TriggerEvent('mecanico:prop', {prop = "caliper"})
		elseif data.current.value == "transmision" then
			TriggerEvent('mecanico:prop', {prop = "transmision"})
		elseif data.current.value == "carburador" then
			TriggerEvent('mecanico:prop', {prop = "carburador"})
		elseif data.current.value == "cubrerueda" then
			TriggerEvent('mecanico:prop', {prop = "cubrerueda"})
		elseif data.current.value == "bateria" then
			TriggerEvent('mecanico:prop', {prop = "bateria"})
		elseif data.current.value == "Cubierta" then
			TriggerEvent('mecanico:prop', {prop = "Cubierta"})
		end

	end, function(data,menu)
		menu.close()
	end)
end

RegisterNetEvent('mecanico:prop')
AddEventHandler('mecanico:prop', function(data)
    local prop = data.prop
    local player = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)

	-- Puerta

    if prop == "door" then

        CargarAnim("anim@heists@narcotics@trash")

        if not DoesEntityExist(CargarObjeto) then
            ESX.Game.SpawnObject("prop_car_door_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
                CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
                AttachEntityToEntity(CargarObjeto, player, GetPedBoneIndex(player, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
            end)
        end

        while true do 
            Citizen.Wait(1)
            
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 3) then
                TaskPlayAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 8.0, 8.0, -1, 50, 0, false, false, false)
            end
            
            if IsControlJustReleased(0, 73) then                           
                DetachEntity(CargarObjeto, 1, 0)
                ESX.Game.DeleteObject(CargarObjeto)
                CargarObjeto = nil
                ClearPedTasksImmediately(player)
                Citizen.Wait(100)
                TaskStartScenarioInPlace(player, "WORLD_HUMAN_WELDING", 0, true)
                Citizen.Wait(10000)
                ClearPedTasksImmediately(player)
                Citizen.Wait(100)
                break
            end
        end	


-- Llanta

    elseif prop == "tire" then
        CargarAnim("anim@heists@box_carry@")

        if not DoesEntityExist(CargarObjeto) then 
            ESX.Game.SpawnObject("prop_wheel_rim_04", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
                CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
        --		local boneIndex = GetPedBoneIndex(player, 28422)
                AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 60.0, 100.0, 10.0, true, true, false, true, 1, true)
                TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
            end)
        end
        while true do 
            Citizen.Wait(1)
                    
            if IsControlJustReleased(0, 73) then                           
                DetachEntity(CargarObjeto, 1, 0)
                ESX.Game.DeleteObject(CargarObjeto)
                CargarObjeto = nil
                ClearPedTasksImmediately(player)
                Citizen.Wait(100)
                break
            end
        end	 

-- Asiento

elseif prop == "asiento" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("prop_car_seat", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')

				AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 60.0, 100.0, 10.0, true, true, false, true, 1, true)
                TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)

			end)
        end

        while true do 
            Citizen.Wait(1)
            
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 3) then
                TaskPlayAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 8.0, 8.0, -1, 50, 0, false, false, false)
            end
				
		
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end

	end


-- capot

elseif prop == "capot" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_bonnet_01a", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 60.0, 100.0, 10.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

-- paragolpe

elseif prop == "paragolpe" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_rear_bumper_03a", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 120.0, 100.0, 10.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

-- Caño de escape

elseif prop == "escape" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_exhaust_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 120.0, 100.0, 10.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end


-- Motor chico

elseif prop == "motorc" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_engine_part_01a", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

	-- motor grande

elseif prop == "motorg" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("prop_car_engine_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

	-- caliper

elseif prop == "caliper" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_brake_caliper_01a", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

	-- transmision

	
elseif prop == "transmision" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_gearbox_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

-- carburador

elseif prop == "carburador" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("lr_prop_carburettor_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

---- cubrerueda

elseif prop == "cubrerueda" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("imp_prop_impexp_car_panel_01a", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

-- Bateria


elseif prop == "bateria" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("prop_car_battery_01", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, 0.0, 100.0, 120.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end

-- Sistema de ignición


elseif prop == "Cubierta" then
	CargarAnim("anim@heists@box_carry@")

	if not DoesEntityExist(CargarObjeto) then 
		ESX.Game.SpawnObject("prop_wheel_tyre", {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
			CargarObjeto = spawnObj
                ESX.ShowNotification('To release the object press X')
	--		local boneIndex = GetPedBoneIndex(player, 28422)
			AttachEntityToEntity(CargarObjeto, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.0, 0.23, -50.0, -50.0, 0.0, true, true, false, true, 1, true)
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end)
	end
	while true do 
		Citizen.Wait(1)
				
		if IsControlJustReleased(0, 73) then                           
			DetachEntity(CargarObjeto, 1, 0)
			ESX.Game.DeleteObject(CargarObjeto)
			CargarObjeto = nil
			ClearPedTasksImmediately(player)
			Citizen.Wait(100)
			break
		end
	end




	--------------------------------- end ---------------------------
end
end)


OpenGarageMenu = function(model)
    ESX.UI.Menu.CloseAll()

    for k,v in pairs(Config.Mecanicos) do
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_', {
        title = 'Garaje',
        align = Config.Align,
        elements = v.Vehiculos
    }, function(data, menu)
        menu.close()

        if ESX.Game.IsSpawnPointClear(v.SpawnVehicle, 5) then
            ESX.Game.SpawnVehicle(data.current.model, v.SpawnVehicle, v.Heading, function(veh)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                ESX.ShowNotification('Has sacado un ~g~'..data.current.model..'~s~ del ~g~garaje')
            end)
        else
            ESX.ShowNotification('~r~Vehiculo bloqueando la salida')
        end
    end, function(data, menu)
        menu.close()
        end)
    end
end



MechanicActions = function()

					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_mechanic_actions', {
		title    = "Mechanic Actions",
        align = Config.Align,
		elements = {
			{label = "Billings",       value = 'billing'},
			{label = "Unlock",        value = 'hijack_vehicle'},
			{label = "Repair",        value = 'fix_vehicle'},
			{label = "Clean",         value = 'clean_vehicle'},
			{label = "Confiscate",       value = 'del_vehicle'},
			
	}}, function(data, menu)
		if isBusy then return end

		
		if data.current.value == 'billing' then

			ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'billing',
							{
								title = "Amount"
							},
								function(data, menu)
									local amount = tonumber(data.value)
										if amount == nil then
											ESX.ShowNotification("Invalid amount")
										else
											menu.close()
											local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
												if closestPlayer == -1 or closestDistance > 3.0 then
													ESX.ShowNotification("There are no players nearby")
												else
													TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mechanic', 'Factura de Mecanico', amount)
													ESX.ShowNotification("You have sent an invoice")
												end
										end
								end,
							function(data, menu)
								menu.close()
							end)

		elseif data.current.value == 'hijack_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()
			local coords = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification("You cannot do this from inside the vehicle")
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
					Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification("Vehicle unlocked successfully")
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif data.current.value == 'fix_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification("You cannot do this from inside the vehicle")
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				Citizen.CreateThread(function()
					Wait(20000)

					SetVehicleFixed(vehicle)
					SetVehicleDeformationFixed(vehicle)
					SetVehicleUndriveable(vehicle, false)
					SetVehicleEngineOn(vehicle, true, true)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification("Successfully repaired vehicle")
					isBusy = false
				end)
			else
				ESX.ShowNotification("There is no vehicle nearby")
			end
		elseif data.current.value == 'clean_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification("You cannot do this from inside the vehicle")
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				Citizen.CreateThread(function()
					Wait(10000)

					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification("The vehicle has been ~g~cleaned")
					isBusy = false
				end)
			else
				ESX.ShowNotification("There is no vehicle nearby")
			end
		elseif data.current.value == 'del_vehicle' then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					ESX.ShowNotification("The vehicle has been ~r~seized")
					ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowNotification("You must be in the driver's seat")
				end
			else
				local vehicle = ESX.Game.GetVehicleInDirection()

				if DoesEntityExist(vehicle) then
					ESX.ShowNotification("The vehicle has been ~r~seized")
					ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowNotification("There is no vehicle nearby")
				end
			end
        end
		
	end, function(data, menu)
		menu.close()
	end)
end

ClothesMenu = function()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'indocumentaria', {
		title    = 'Clothes',
		align    = 'bottom-right',
		elements = {
			{label = 'Civilian Wear', value = 'citizen_wear'},
			{label = 'EUP', value = 'ambulance_wear'},
	}}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'ambulance_wear' then
			ESX.TriggerServerCallback(
				"esx_skin:getPlayerSkin",
				function(skin, jobSkin)
					OpenEUPClothesMenu(masterJob, skin.sex)
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end


ArmarioMenu = function()
	local elements = {
		{label = "Deposit object", value = 'put_armario'},		
		{label = "Remove object",  value = 'get_armario'}	
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'arnario', {
		title    = 'Wardrobe',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'put_armario' then
			PonerObjeto()
		elseif data.current.value == 'get_armario' then
			SacarObjeto()
		end

	end, function(data, menu)
		menu.close()
	end)
end

PonerObjeto = function()
	ESX.TriggerServerCallback('a-mechanicjob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name,
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armario_menu', {
			title    = "Inventory",
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'meter_items', {
				title = "Quantity"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification("Invalid Quantity")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('a-mechanicjob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutArmarioMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

SacarObjeto = function()
	ESX.TriggerServerCallback('a-mechanicjob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = items[i].label .. ' x' .. items[i].count,
				type = 'item_standard',
				value = items[i].name,
				haveImage = true
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armario2_menu', {
			title    = "Inventory",
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sacar_items', {
				title = "Quantity"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification("Invalid Quantity")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('a-mechanicjob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetArmarioMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end



-- props

function CargarAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(10)
	end
end

function CargarModelo(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(10)
	end
end
