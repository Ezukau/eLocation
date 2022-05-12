ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('e:locationbancaire')
AddEventHandler('e:locationbancaire', function(prix, model)
	local xPlayer = ESX.GetPlayerFromId(source)
  local playerMoney = xPlayer.getAccount('bank').money

	if playerMoney >= prix then
		xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement accepté d\'un montant de '..prix..'~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)
    TriggerClientEvent("e:spawnvehicule", source, model)
  else 
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement ~r~refusé, ~s~solde insuffisant !', 'CHAR_BANK_FLEECA', 2)
	end
end)

RegisterNetEvent('e:locationespece')
AddEventHandler('e:locationespece', function(prix, model)
	local xPlayer = ESX.GetPlayerFromId(source)
  local playerMoney = xPlayer.getMoney()

	if playerMoney >= prix then
		xPlayer.removeMoney(prix)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Loueur', 'Romuald', 'Merci pour votre location, bonne route et a bientot', 'CHAR_CHEF', 9)
    TriggerClientEvent("e:spawnvehicule", source, model)
  else 
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Loueur', 'Romuald', 'Vous n\'avez pas assez d\'argent pour louer ce véhicule~s~ !', 'CHAR_CHEF', 9)
	end
end)

RegisterNetEvent('e:rendrelocation')
AddEventHandler('e:rendrelocation', function(caution, locap)
	local xPlayer = ESX.GetPlayerFromId(source)

  if locap == 2000 then
    xPlayer.addAccountMoney('bank', caution)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Virement recu d\'un montant de '..caution..'~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)
  elseif locap <= 1000 and locap >= 501 then 
    caution = caution / 2
    xPlayer.addmoney(caution)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Virement recu d\'un montant de '..caution..'~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)
  elseif locap <= 500 then

  end
end)

--- Ezuko#1144