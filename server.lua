-- © Script Coded By Elior#2913 To MyLifeRP (MyLife RolePlay) Server ©

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('job', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local joblabel = xPlayer.job.label
	local jobgradelabel = xPlayer.job.grade_label
	local result = "עבודתך היא : " .. joblabel .. " - " .. jobgradelabel
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = result })
end, false)

RegisterCommand('cash', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. money .. ' : סכום הכסף שעליך הוא'})
end, false)

RegisterCommand('bank', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bank = xPlayer.getAccount("bank")["money"]
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. bank .. ' : סכום הכסף המופקד אצלך בבנק הוא'})
end, false)

RegisterCommand('dirty', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local dirty = xPlayer.getAccount("black_money")["money"]
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. dirty .. ' : סכום הכסף המלוכלך שעליך הוא'})
end, false)

RegisterCommand('society', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.grade_name
	if job == 'boss' then
		TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. account.money .. ' : סכום הכסף שבחברה שלך הוא'})
	      end)
	   end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'תצטרך להיות מנהל החברה/עבודה שלך'})
	end
end, false)

RegisterCommand('playerinfo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.grade_name
   	local joblabel = xPlayer.job.label
	local jobgradelabel = xPlayer.job.grade_label
	local money = xPlayer.getMoney()
	local bank = xPlayer.getAccount("bank")["money"]
	local dirty = xPlayer.getAccount("black_money")["money"]
	local result = "עבודתך היא : " .. joblabel .. " - " .. jobgradelabel
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. money .. ' : סכום הכסף שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. bank .. ' : סכום הכסף המופקד אצלך בבנק הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. dirty .. ' : סכום הכסף המלוכלך שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = result })
	Citizen.Wait(3000)
	if job == 'boss' then
		TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. account.money .. ' : סכום הכסף שבחברה שלך הוא'})
	     end)
	end)
    end
end, false)
