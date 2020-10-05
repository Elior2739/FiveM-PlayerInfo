-- © This Resource Coded By Elior#0590 And Mr.Itchy#2223 © --
-- © This Resource Protected By Apache-2.0 License © --

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('job', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "עבודתך היא : " .. xPlayer.job.label .. " - " .. xPlayer.job.grade_label })
end, false)

RegisterCommand('cash', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getMoney() .. ' : סכום הכסף שעליך הוא'})
end, false)

RegisterCommand('bank', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getAccount("bank")["money"] .. ' : סכום הכסף המופקד אצלך בבנק הוא'})
end, false)

RegisterCommand('dirty', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getAccount("black_money")["money"] .. ' : סכום הכסף המלוכלך שעליך הוא'})
end, false)

RegisterCommand('salary', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.job.grade_salary .. ' : המשכורת שלך היא'})
end, false)


RegisterCommand('id', function(source)
	if consoleCheck(source) then
	    print("You're ID Is Zero Because You Are The Console")
	    return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = source .. ' : האיידי שלך במשחק הוא'})
end, false)

RegisterCommand('ping', function(source)
	local xPlayer = ESX.GetPlayerFromId(sourcTriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text =GetPlayerPing(source) .. "ms" .. ' : הפינג שלך הוא'})
end, false)

RegisterCommand('society', function(source)
	if consoleCheck(source) then
	    print("Console Can't Use This Command")
	    return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.grade_name == 'boss' then
	    TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
		    TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. account.money .. ' : סכום הכסף שבחברה שלך הוא'})
	        end)
	    end)
	else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'תצטרך להיות מנהל החברה/עבודה שלך'})
	end
end, false)

RegisterCommand('pinfo', function(source)
	if consoleCheck(source) then
	    print("Console Can't Use This Command")
	    return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getMoney() .. ' : סכום הכסף שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getAccount("bank")["money"] .. ' : סכום הכסף המופקד אצלך בבנק הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.getAccount("black_money")["money"] .. ' : סכום הכסף השחור שעליך הוא'})
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "עבודתך היא : " .. xPlayer.job.label .. " - " .. xPlayer.job.grade_label })
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. xPlayer.job.grade_salary .. ' : המשכורת שלך היא'})
	Citizen.Wait(3000)
	if xPlayer.job.grade_name == 'boss' then
		TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
		    TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. account.money .. ' : סכום הכסף שבחברה שלך הוא'})
	        end)
	    end)
	end
	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = source .. ' : האיידי שלך במשחק הוא'})
  	Citizen.Wait(3000)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = GetPlayerPing(source) .. ' : הפינג שלך הוא'})
end, false)

function consoleCheck(id)
   if id == 0 then
      return true
   else
      return false
   end
end
