-- © Script Coded By Elior#2913 To MyLifeRP (Server) © --

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

RegisterCommand('salary', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobsalary = xPlayer.job.grade_salary
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. jobsalary .. ' : המשכורת שלך היא'})
end, false)


RegisterCommand('id', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = source .. ' : האיידי שלך במשחק הוא'})
end, false)

RegisterCommand('ping', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ping = GetPlayerPing(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = ping .. ' : הפינג שלך הוא'})
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

RegisterCommand('givecash', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if args[0] == '' or ' ' or nill or null then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'האיידי של השחקן שאתה רוצה להעביר לו את הכסף אינו קיים'})		
	end
		
	if args[1] == '' or ' ' or 0 or nill or null then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'שכחת להשים את כמות הכסף שאתה רוצה להעביר'})
	end
		
	local xPlayer2 = ESX.GetPlayerFromId(args[0])
	if xPlayer2 == nill or null then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'האיידי של השחקן שאתה רוצה להעביר לו את הכסף אינו קיים'})
	end
		
	if xPlayer.getAccount("bank")["money"] <= args[1] then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'אין לך מספיק כסף בישביל להעביר את סכום זה'})
	end
		
	xPlayer.removeAccountMoney('bank', args[1])
	xPlayer2.addAccountMoney('bank', args[1])
	player_name = GetPlayerName(args[0])
		
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '₪' .. args[1] .. player_name .. ' העברת ל'})
	TriggerClientEvent('mythic_notify:client:SendAlert', args[0], { type = 'success', text = '₪' .. args[1] " העביר לך" .. player_name})
end, false)

RegisterCommand('pinfo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobsalary = xPlayer.job.grade_salary
	local job = xPlayer.job.grade_name
   	local joblabel = xPlayer.job.label
	local jobgradelabel = xPlayer.job.grade_label
	local money = xPlayer.getMoney()
	local bank = xPlayer.getAccount("bank")["money"]
	local dirty = xPlayer.getAccount("black_money")["money"]
	local result = "עבודתך היא : " .. joblabel .. " - " .. jobgradelabel
	local ping = GetPlayerPing(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. money .. ' : סכום הכסף שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. bank .. ' : סכום הכסף המופקד אצלך בבנק הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. dirty .. ' : סכום הכסף המלוכלך שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = result })
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. jobsalary .. ' : המשכורת שלך היא'})
	Citizen.Wait(3000)
	if job == 'boss' then
		TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. account.money .. ' : סכום הכסף שבחברה שלך הוא'})
	     end)
	  end)
	end
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = source .. ' : האיידי שלך במשחק הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = ping .. ' : הפינג שלך הוא'})
end, false)
