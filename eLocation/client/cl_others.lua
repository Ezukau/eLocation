-- Ped

local posx = nil
local posy = nil
local posz = nil
local posh = nil
local type = nil

Citizen.CreateThread(function()
    for k,v in pairs(Config.Ped) do
      posx = v.pos.x
      posy = v.pos.y
      posz = v.pos.z 
      posh = v.heading
      type = v.Type
    end
    local hash1 = GetHashKey(type)
    while not HasModelLoaded(hash1) do
    RequestModel(hash1)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", type, posx, posy, posz, posh, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

-- Blips

Citizen.CreateThread(function()
    for k,v in pairs (Config.Location.Position) do
      local loca = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(loca, Config.Blips.Model)
      SetBlipColour(loca, Config.Blips.Couleur)
      SetBlipScale(loca, Config.Blips.Taille)
      SetBlipAsShortRange(loca, true)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentString(Config.Blips.Name)
      EndTextCommandSetBlipName(loca)
    end
end)

--- Ezuko#1144 