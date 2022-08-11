ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print('^0[^4ARtuRO Mecanico^0] ^2Starteado^0')
TriggerEvent('esx_society:registerSociety', 'mechanic', 'Mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})


RegisterNetEvent('a-mechanicjob:getStockItem')
AddEventHandler('a-mechanicjob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification("You taken out ", count, inventoryItem.label)
			else
				xPlayer.showNotification("Invalid quantity")
			end
		else
			xPlayer.showNotification("Invalid quantity")
		end
	end)
end)

RegisterNetEvent('a-mechanicjob:putStockItems')
AddEventHandler('a-mechanicjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification("You taken out ", count, inventoryItem.label)
		else
			xPlayer.showNotification("Invalid quantity")
		end
	end)
end)

ESX.RegisterServerCallback('a-mechanicjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('a-mechanicjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)
