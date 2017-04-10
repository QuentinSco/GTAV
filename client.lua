RegisterNetEvent("turnengine")


AddEventHandler('turnengine', function()
	local lastCar = nil
	local engineStatus = nil
	local car = GetVehiclePedIsUsing(GetPlayerPed(-1))
	
	if not car and lastCar == nil then
		TriggerEvent("chatMessage", "ERREUR", {255, 0, 0}, "Vous devez être dans un véhicule.")
		return
	elseif car then
		lastCar = car
	end
	
	if IsVehicleEngineOn(lastCar) == 1 or IsVehicleEngineOn(lastCar) ==  0 then
		SetVehicleEngineOn(lastCar, false, false, true)
		TriggerEvent("chatMessage", "INFO", {255, 255, 0}, "Moteur coupé.")
		SetVehicleUndriveable(lastCar, true)
	else
		SetVehicleUndriveable(lastCar, false)
		SetVehicleEngineOn(lastCar, true, true, true)
		TriggerEvent("chatMessage", "INFO", {255, 255, 0}, "Moteur démarré.")
	end
end)