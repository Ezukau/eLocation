Citizen.CreateThread(function()
  while true do 
      local wait = 750
        for k in pairs(Config.Location.Position) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.Location.Position
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= Config.MarkerDistance and not IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                wait = 0
                DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
            end

            if dist <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                wait = 0
                Visual.Subtitle(Config.Location.Texte, 1)
                if IsControlJustPressed(1,51) then
                  OpenMenu()
                end
            end
        end
  Citizen.Wait(wait)
  end
end)

Citizen.CreateThread(function()
  while true do 
      local wait = 750
        for k in pairs(Config.Location.Position2) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.Location.Position2
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
            gveh = GetVehiclePedIsIn(GetPlayerPed(-1), false) 
            plaque = GetVehicleNumberPlateText(gveh)

            if dist <= Config.MarkerDistance2 and plaque == "25BCF298" then 
                wait = 0
                DrawMarker(Config.MarkerType2, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur2, Config.MarkerSizeEpaisseur2, Config.MarkerSizeHauteur2, Config.MarkerColorR2, Config.MarkerColorG2, Config.MarkerColorB2, Config.MarkerOpacite2, Config.MarkerSaute2, true, p19, Config.MarkerTourne2)  
            end

            if dist <= 2 and plaque == "25BCF298" then
                wait = 0
                Visual.Subtitle(Config.Location.Texte2, 1)
                if IsControlJustPressed(1,51) then
                  OpenMenu2()
                end
            end
        end
  Citizen.Wait(wait)
  end
end)

--- Ezuko#1144