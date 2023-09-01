TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_topless_01"))

	while not HasModelLoaded(GetHashKey("a_f_y_topless_01")) do
    Wait(10)
	end


		for _, item in pairs(Config.Locations24) do
			local npc = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
			local npc2 = CreatePed(1, 0x9CF26183, item.x, item.y, item.z, item.heading, false, true)
			local ad = "mini@strip_club@lap_dance_2g@ld_2g_p1"
		
			RequestAnimDict(ad)
			while not HasAnimDictLoaded(ad) do
			Citizen.Wait(1000)
			end
			
			local netScene = CreateSynchronizedScene(item.x, item.y, item.z, vec3(0.0, 0.0, 0.0), 2)
			TaskSynchronizedScene(npc, netScene, ad, "ld_2g_p1_s1", 1.0, -4.0, 261, 0, 0)
			TaskSynchronizedScene(npc2, netScene, ad, "ld_2g_p1_s2", 1.0, -4.0, 261, 0, 0)
			FreezeEntityPosition(npc, true)	
			FreezeEntityPosition(npc2, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityHeading(npc2, item.heading)
			SetEntityInvincible(npc, true)
			SetEntityInvincible(npc2, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			SetBlockingOfNonTemporaryEvents(npc2, true)
			SetSynchronizedSceneLooped(netScene, 1)
			SetModelAsNoLongerNeeded(model)
		end

end)

