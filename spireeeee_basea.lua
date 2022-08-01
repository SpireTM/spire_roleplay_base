local kyykky = false

-- Dispatch pois

Citizen.CreateThread(function()

    Citizen.Wait(2500)

	for i = 1, 12 do

		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)

	end

end)

-- Deletoidaan tulevat dropit

Citizen.CreateThread(function()

    local ped = GetPlayerPed(-1)

    while true do

        Citizen.Wait(50)

        local ped = GetPlayerPed(-1)

        local myCoords = GetEntityCoords(GetPlayerPed(-1))

        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)

        DisablePlayerVehicleRewards(PlayerId())    

        SetCanAttackFriendly(ped, true, false)

        NetworkSetFriendlyFireOption(true)

            RemoveAllPickupsOfType(0xDF711959) -- M4-16

            RemoveAllPickupsOfType(0xF9AFB48F) -- 9MM Pistooli

            RemoveAllPickupsOfType(0xA9355DCD) -- Haulikko	

            RemoveAllPickupsOfType(0x88EAACA7) -- Golffi maila

            RemoveAllPickupsOfType(0xFE2A352C) -- Sniper rifle

            RemoveAllPickupsOfType(0x3A4C2AD2) -- MP5

            RemoveAllPickupsOfType(0x6DFF6B70) -- MicroSMG (Veneistä)

            RemoveAllPickupsOfType(0xD919B569) -- AK-47 (Swat)

            RemoveAllPickupsOfType(0xD975F9BA) -- APPISTOL (Swat)

            RemoveAllPickupsOfType(0xAC581E2E) -- RPG (Swat)
    end

end)

-- GPS 
Citizen.CreateThread(function()

    while true do

	Citizen.Wait(1)

	

		local playerPed = GetPlayerPed(-1)

		local playerVeh = GetVehiclePedIsIn(playerPed, false)



		if (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then

            DisplayRadar(true)
            SetPlayerCanDoDriveBy(PlayerId(), false)

		else

			DisplayRadar(false)

		end

    end

end)

-- Friendly gangsters ;DD JOU MOTHER FUCKER LOL xDDDD
local meikalaisengangsterit = {
	"GANG_1",

	"GANG_2",

	"GANG_9",

	"GANG_10",

	"AMBIENT_GANG_LOST",

	"AMBIENT_GANG_MEXICAN",

	"AMBIENT_GANG_FAMILY",

	"AMBIENT_GANG_BALLAS",

	"AMBIENT_GANG_MARABUNTE",

	"AMBIENT_GANG_CULT",

	"AMBIENT_GANG_SALVA",

	"AMBIENT_GANG_WEICHENG",

	"AMBIENT_GANG_HILLBILLY",

	"DEALER",

	"HATES_PLAYER",

	"NO_RELATIONSHIP",

	"SPECIAL",

	"MISSION2",

	"MISSION3",

	"MISSION4",

	"MISSION5",

	"MISSION6",

	"MISSION7",

	"MISSION8",

}

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(5000)

		for _, grouppi in ipairs(meikalaisengangsterit) do

			SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(grouppi))

			SetRelationshipBetweenGroups(1, GetHashKey(grouppi), GetHashKey('PLAYER'))

		end

	end

end)

-- Siltapoies
local silta = false

AddEventHandler("playerSpawned", function ()
    if not silta then
        ShutdownLoadingScreenNui()
        silta = true
    end
end)