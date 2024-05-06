-- Dispatch off

CreateThread(function()

    Wait(2500)

	for i = 1, 12 do

		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)

	end

end)

-- Incoming drops will be deleted.

CreateThread(function()

    local ped = GetPlayerPed(-1)

    while true do

        Wait(50)

        local ped = GetPlayerPed(-1)

        local myCoords = GetEntityCoords(GetPlayerPed(-1))

        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)

        DisablePlayerVehicleRewards(PlayerId())    

        SetCanAttackFriendly(ped, true, false)

        NetworkSetFriendlyFireOption(true)

            RemoveAllPickupsOfType(0xDF711959) -- M4-16

            RemoveAllPickupsOfType(0xF9AFB48F) -- 9MM Pistol

            RemoveAllPickupsOfType(0xA9355DCD) -- Shotgun	

            RemoveAllPickupsOfType(0x88EAACA7) --  golf

            RemoveAllPickupsOfType(0xFE2A352C) -- Sniper rifle

            RemoveAllPickupsOfType(0x3A4C2AD2) -- MP5

            RemoveAllPickupsOfType(0x6DFF6B70) -- MicroSMG (boat)

            RemoveAllPickupsOfType(0xD919B569) -- AK-47 (Swat)

            RemoveAllPickupsOfType(0xD975F9BA) -- APPISTOL (Swat)

            RemoveAllPickupsOfType(0xAC581E2E) -- RPG (Swat)
    end

end)

-- GPS 
CreateThread(function()

    while true do

	Wait(1)

	

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

-- Friendly gangsters
local fg = {
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

CreateThread(function()

	while true do

		Wait(5000)

		for _, group in ipairs(fg) do

			SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(group))

			SetRelationshipBetweenGroups(1, GetHashKey(group), GetHashKey('PLAYER'))

		end

	end

end)
