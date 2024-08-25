ESX = exports['es_extended']:getSharedObject()

local IsPlayerNearMetro = false
local IsPlayerInMetro = false
local PlayerHasMetroTicket = false
local IsPlayerUsingTicketMachine = false

local TicketMachines = {'prop_train_ticket_02', 'prop_train_ticket_02_tu', 'v_serv_tu_statio3_'}
local anim = "mini@atmenter"

local MetroStopBlips = {
	Config.Blips
}

local symbol = Config.MoneySymbol
local price = Config.TicketPrice
function setPrice(price)
    SendNUIMessage({
        type = "setPrice",
		symbol = symbol,
        price = price,
    })
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		setPrice(price)
	end
end)

function buyMetroTicket()
	ESX.TriggerServerCallback(Config.Banking .. ':metroPay', function(isPay)
		if isPay == false then
			exit()
			if Config.Notify == 'qb' then
				QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"], 'error', 5000)
			elseif Config.Notify == 'okok' then
				exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["title"], Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"], 5000, 'error', playSound)
			elseif Config.Notify == 'ox' then
				lib.notify({
					title = Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["title"],
					description = Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"],
					type = 'error'
				})
			elseif Config.Notify == 'cs' then
				exports['cs-notify']:Notify("error", Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["title"], Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"], 5000)
			elseif Config.Notify == 'esx' then 
				ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"], "error", 5000)
			elseif Config.Notify == 'ps-ui' then 
				exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["notEnoughMoney"]["description"], "error", 5000)
			end
		else
			exit()
			if Config.PhoneSystem == 'qb' then 
				TriggerServerEvent('qb-phone:server:sendNewMail', {
					sender = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["sender"],
					subject = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["title"],
					message = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["message"],
					button = {}
				})
			elseif Config.PhoneSystem == 'qs' then 
				TriggerServerEvent('qs-smartphone:server:sendNewMail', {
					sender = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["sender"],
					subject = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["title"],
					message = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["message"],
					button = {}
				})
			elseif Config.PhoneSystem == 'jpr' then 
				TriggerServerEvent('jpr-phonesystem:server:sendEmail', {
					Assunto = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["title"], -- Subject
					Conteudo = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["message"], -- Content
					Enviado = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["sender"], -- Submitted by
					Destinatario = QBCore.Functions.GetPlayerData().citizenid, -- Target
					Event = {}, -- Optional 
				})
			elseif Config.PhoneSystem == 'yflip' then 
				local insertId, received = exports["yflip-phone"]:SendMail({
					title = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["title"],
					sender = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["sender"],
					senderDisplayName = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["senderName"],
					content = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["message"],
					attachments = {
						{
							photo = Config.Locales[Config.SelectedLocale]["PhoneMessage"]["image"]
						},
						{
							location = { x = 10, y = 10 },
						}
					}
				}, 'source', GetPlayerServerId(PlayerId()))
			end
			ShowedLeaveMetroHelper = false
			TicketInvalidated = false
			PlayerHasMetroTicket = true
		end
	end)
end

Citizen.CreateThread(function()
	for _, info in pairs(Config.Blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.4)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	  end

	ShowedBuyTicketHelper = false
	ShowedLeaveMetroHelper = false
	TicketInvalidated = false
	while true do
		Wait(10)

		if IsPlayerNearTicketMachine then
			if (not IsPlayerUsingTicketMachine and not PlayerHasMetroTicket) then
				if not ShowedBuyTicketHelper then
					if Config.TextUI == 'ox' then
						lib.showTextUI(Config.Locales[Config.SelectedLocale]["TextUI"]["all"])
					elseif Config.TextUI == 'gta' then
						DisplayHelpText(Config.Locales[Config.SelectedLocale]["TextUI"]["gta"])
					elseif Config.TextUI == 'okok' then
						exports['okokTextUI']:Open(Config.Locales[Config.SelectedLocale]["TextUI"]["all"], 'lightblue', 'left')
					elseif Config.TextUI == 'esx' then 
						ESX.TextUI(Config.Locales[Config.SelectedLocale]["TextUI"]["all"], "info")
					elseif Config.TextUI == 'ps' then 
						exports['ps-ui']:DisplayText(Config.Locales[Config.SelectedLocale]["TextUI"]["all"], "info")
					end
					ShowedBuyTicketHelper = true
				end
			else
				if not ShowedBuyTicketHelper then
					if Config.Notify == 'qb' then
						QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 'error', 5000)
					elseif Config.Notify == 'okok' then
						exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 5000, 'error', playSound)
					elseif Config.Notify == 'ox' then
						lib.notify({
							title = Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"],
							description = Config.Locales[Config.SelectedLocale]["Notifications"]["already"],
							type = 'error'
						})
					elseif Config.Notify == 'cs' then
						exports['cs-notify']:Notify("warning", Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 5000)
					elseif Config.Notify == 'esx' then 
						ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], "error", 5000)
					elseif Config.Notify == 'ps-ui' then 
						exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], "error", 5000)
					end
					ShowedBuyTicketHelper = true
				end
				if Config.TextUI == 'ox' then
					lib.hideTextUI()
				elseif Config.TextUI == 'okok' then
					exports['okokTextUI']:Close()
				elseif Config.TextUI == 'gta' then
					DisplayHelpText('')
				elseif Config.TextUI == 'esx' then 
					ESX.HideUI()
				elseif Config.TextUI == 'ps' then 
					exports['ps-ui']:HideText()
				end
				DisableControlAction(0, 201, true)
				DisableControlAction(1, 201, true)
			end

			if IsControlJustPressed(0, 51) and PlayerHasMetroTicket then
				if Config.Notify == 'qb' then
					QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 'error', 5000)
				elseif Config.Notify == 'okok' then
					exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 5000, 'error', playSound)
				elseif Config.Notify == 'ox' then
					lib.notify({
						title = Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"],
						description = Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"],
						type = 'error'
					})
				elseif Config.Notify == 'cs' then
					exports['cs-notify']:Notify("warning", Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], 5000)
				elseif Config.Notify == 'esx' then 
					ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], "error", 5000)
				elseif Config.Notify == 'ps-ui' then 
					exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["already"]["description"], "error", 5000)
				end
				Wait(3500)
			end

			if IsControlJustPressed(0, 51) and not PlayerHasMetroTicket then
				IsPlayerUsingTicketMachine = true
				RequestAnimDict("mini@atmbase")
				RequestAnimDict(anim)
				while not HasAnimDictLoaded(anim) do
					Wait(1)
				end
				SetCurrentPedWeapon(playerPed, GetHashKey("weapon_unarmed"), true)
				TaskLookAtEntity(playerPed, currentTicketMachine, 2000, 2048, 2)
				Wait(500)
				TaskGoStraightToCoord(playerPed, TicketMX, TicketMY, TicketMZ, 0.1, 4000, GetEntityHeading(currentTicketMachine), 0.5)
				Wait(2000)
				TaskPlayAnim(playerPed, anim, "enter", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict(animDict)
				Wait(4000)
				TaskPlayAnim(playerPed, "mini@atmbase", "base", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict("mini@atmbase")
				Wait(500)
				openTicketUI() -- opens ticket UI
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				RequestAnimDict("mini@atmexit")
				while not HasAnimDictLoaded("mini@atmexit") do
					Wait(1)
				end
				TaskPlayAnim(playerPed, "mini@atmexit", "exit", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict("mini@atmexit")
				Wait(500)
				if not ticketUI then
					openTicketUI()
				end
				IsPlayerUsingTicketMachine = false
			end
		else
			ShowedBuyTicketHelper = false
			if Config.TextUI == 'ox' then
				lib.hideTextUI()
			elseif Config.TextUI == 'okok' then
				exports['okokTextUI']:Close()
			elseif Config.TextUI == 'gta' then
				DisplayHelpText('')
			elseif Config.TextUI == 'esx' then
				ESX.HideUI()
			elseif Config.TextUI == 'ps' then 
				exports['ps-ui']:HideText()
			end
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Wait(550)
		playerPed = PlayerPedId()
		IsPlayerInMetro = IsPedInAnyTrain( playerPed )
		if not IsPlayerInMetro then
			TicketInvalidated = false
			ShowedLeaveMetroHelper = false
			IsPlayerInVehicle = IsPedInAnyVehicle(playerPed, true)
			if not IsPlayerInVehicle then
				if PlayerHasMetroTicket then
					if not ShowedEToEnterMetro then
						if Config.Notify == 'qb' then
							QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"], 'success', 5000)
						elseif Config.Notify == 'okok' then
							exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"], 5000, 'success', playSound)
						elseif Config.Notify == 'ox' then
							lib.notify({
								title = Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["title"],
								description = Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"],
								type = 'success'
							})
						elseif Config.Notify == 'cs' then
							exports['cs-notify']:Notify("success", Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"], 5000)
						elseif Config.Notify == 'esx' then 
							ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"], "success", 5000)
						elseif Config.Notify == 'ps-ui' then 
							exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["recieved"]["description"], "success", 5000)
						end
						ShowedEToEnterMetro = true
					end
				end

				x,y,z = table.unpack(GetEntityCoords(playerPed, true))
				if not IsPlayerNearTicketMachine then
					for k,v in pairs(TicketMachines) do
						TicketMachine = GetClosestObjectOfType(x, y, z, 0.75, GetHashKey(v), false)
						if DoesEntityExist(TicketMachine) then
							currentTicketMachine = TicketMachine
							TicketMX, TicketMY, TicketMZ = table.unpack(GetOffsetFromEntityInWorldCoords(TicketMachine, 0.0, -.85, 0.0))
							IsPlayerNearTicketMachine = true
						end
					end
				else
					if not DoesEntityExist(currentTicketMachine) then
						IsPlayerNearTicketMachine = false
					else
						if GetDistanceBetweenCoords(x,y,z, TicketMX, TicketMY, TicketMZ, true) > 2.0 then
							IsPlayerNearTicketMachine = false
						end
					end
				end
			end
		else
			if PlayerHasMetroTicket then
				if ShowedLeaveMetroHelper == false then
					Wait(500)
					if Config.Notify == 'qb' then
						QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"], 'error', 5000)
					elseif Config.Notify == 'okok' then
						exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"], 5000, 'error', playSound)
					elseif Config.Notify == 'ox' then
						lib.notify({
							title = Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["title"],
							description = Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"],
							type = 'error'
						})
					elseif Config.Notify == 'cs' then
						exports['cs-notify']:Notify("warning", Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"], 5000)
					elseif Config.Notify == 'esx' then 
						ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"], "error", 5000)
					elseif Config.Notify == 'ps-ui' then
						exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["voidticket"]["description"], "error", 5000)
					end
					ShowedLeaveMetroHelper = true
					TicketInvalidated = true
					PlayerHasMetroTicket = false
				end
			else
				if TicketInvalidated == false then
					if Config.Notify == 'qb' then
						QBCore.Functions.Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"], 'error', 5000)
					elseif Config.Notify == 'okok' then
						exports['okokNotify']:Alert(Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"], 5000, 'error', playSound)
					elseif Config.Notify == 'ox' then
						lib.notify({
							title = Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["title"],
							description = Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"],
							type = 'error'
						})
					elseif Config.Notify == 'cs' then
						exports['cs-notify']:Notify("error", Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["title"], Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"], 5000)
					elseif Config.Notify == 'esx' then 
						ESX.ShowNotification(Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"], "error", 5000)
					elseif Config.Notify == 'ps-ui' then
						exports['ps-ui']:Notify(Config.Locales[Config.SelectedLocale]["Notifications"]["noticket"]["description"], "error", 5000)
					end
					Wait(Config.PoliceAlert)
					if Config.CallPolice == true and IsPedInAnyTrain( playerPed ) then
						if Config.Dispatch == 'ps' then
							exports['ps-dispatch']:Metro()
						elseif Config.Dispatch == 'qs' then
							exports['qs-dispatch']:Metro()
						elseif Config.Dispatch == 'qb' then
							TriggerServerEvent('police:server:policeAlert', Config.Locales[Config.SelectedLocale]["PoliceAlerts"]["qb-alert"], GetEntityCoords(PlayerPedId()), false)
						elseif Config.Dispatch == 'core' then 
							local data = exports['cd_dispatch']:GetPlayerInfo()
							TriggerServerEvent('cd_dispatch:AddNotification', {
								job_table = Config.PoliceJob, 
								coords = data.coords,
								title = Config.Locales[Config.SelectedLocale]["PoliceAlerts"]["cd-alert"]["title"],
								message = Config.Locales[Config.SelectedLocale]["PoliceAlerts"]["cd-alert"]["description"],
								flash = 0,
								unique_id = data.unique_id,
								sound = 1,
								blip = {
									sprite = 431, 
									scale = 1.2, 
									colour = 3,
									flashes = false, 
									text = Config.Locales[Config.SelectedLocale]["PoliceAlerts"]["cd-alert"]["blip"],
									time = 5,
									radius = 0,
								}
							})
						end
					end
					Wait(3500) 
				end
			end
		end
	end
end)

local ticketUI = false

function openTicketUI()
    ticketUI = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openUI",
    })
end

function exit()
    ticketUI = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "closeUI",
    })
end

RegisterNUICallback("exit",function (data)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('NUIFocusOff', function()
	ticketUI = false
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "closeUI"
	})
end)

RegisterNUICallback('openTicketUI', function(data, cb)
    openTicketUI()
    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
    buyMetroTicket()
    cb('ok')
end)

RegisterNUICallback('exit', function()
	exit()
end)


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	EndTextCommandDisplayHelp(0, 0, true, 2000)
end


