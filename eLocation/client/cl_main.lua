ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local open = false
local Main = RageUI.CreateMenu(Config.Menu.NomMenu, Config.Menu.DescriptionMenu, nil, nil, 'root_cause5', Config.Menu.Banner)
local subMenu2 = RageUI.CreateSubMenu(Main, "", "Interaction")
Main.Closed = function()
  FreezeEntityPosition(GetPlayerPed(-1), false)
  RageUI.Visible(Main, false)
  main = false
end

local location = false
local bancaire = false
local espece = false
local prix = nil
local model = nil

function OpenMenu()
  if main then 
    main = false
    RageUI.Visible(Main, false)
    return
  else
    main = true 
    RageUI.Visible(Main, true)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    Citizen.CreateThread(function()
    while main do 
    RageUI.IsVisible(Main,function()
      for k, v in pairs(Config.Vehicule) do
          price = v.price + v.caution
          RageUI.Button("~"..Config.Menu.CouleurMenu.."~→ ~s~"..v.vehiculename, v.description, {RightLabel = price.."~g~$"}, true , {
          onSelected = function()
            location = true
            prix = v.price + v.caution
            model = v.vehiculename
          end
        })
      end

      if location == true then 
        RageUI.Separator("Vehicule selectioné : ~"..Config.Menu.CouleurMenu.."~"..model)
        RageUI.Separator("~"..Config.Menu.CouleurMenu.."~→~s~ Moyen de paiement ~"..Config.Menu.CouleurMenu.."~←")

        RageUI.Checkbox("~"..Config.Menu.CouleurMenu.."~→~s~ Carte bancaire", nil, bancaire, {}, {
          onChecked = function()
            bancaire = true
            espece = false
          end,
          onUnChecked = function()
            bancaire = false
          end
        })
        
        RageUI.Checkbox("~"..Config.Menu.CouleurMenu.."~→~s~ Espéce", nil, espece, {}, {
          onChecked = function()
            espece = true
            bancaire = false
          end,
          onUnChecked = function()
            espece = false
          end
        })

        if bancaire or espece == true then
        RageUI.Separator("~"..Config.Menu.CouleurMenu.."~_____________")
          RageUI.Button("Confirmer la location", nil, {RightBadge = RageUI.BadgeStyle.Car}, true , {
            onSelected = function()
              if bancaire == true then
                TriggerServerEvent("e:locationbancaire", prix, model)
              elseif espece == true then
                TriggerServerEvent("e:locationespece", prix, model)
              end
            end
          })
        end
      end
    end)
    Wait(0)
  end
end)
end
end    

local modelveh = nil
local namelabel = nil
local open2 = false
local Main2 = RageUI.CreateMenu(Config.Menu.NomMenu, Config.Menu.DescriptionMenu, nil, nil, 'root_cause5', Config.Menu.Banner)
Main2.Closed = function()
  veh = GetVehiclePedIsIn(PlayerPedId())
  FreezeEntityPosition(veh, false)
  RageUI.Visible(Main2, false)
  main2 = false
end
function OpenMenu2()
  if main2 then 
    main2 = false
    RageUI.Visible(Main2, false)
    return
  else
    main2 = true 
    RageUI.Visible(Main2, true)
    Citizen.CreateThread(function()
    veh = GetVehiclePedIsIn(PlayerPedId())
    FreezeEntityPosition(veh, true)
    while main2 do 
    RageUI.IsVisible(Main2,function()
      RageUI.Button("~"..Config.Menu.CouleurMenu.."~→ ~s~Rendre le vehicule","Suivant l'état de votre vehicule la caution rendu sera proportionnelle", {RightLabel = "→→"}, true , {
        onSelected = function()
          for k ,v in pairs(Config.Vehicule) do
            local Vehicule = GetVehiclePedIsIn(PlayerPedId(), false)
            local HashVehicule = GetEntityModel(Vehicule)
            local engine = GetVehicleEngineHealth(Vehicule)
            local body = GetVehicleBodyHealth(Vehicule)
            local locap = engine + body
            local caution = v.caution
            if HashVehicule == v.hash then
              TriggerServerEvent("e:rendrelocation", caution, locap)
              DeleteEntity(Vehicule)
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
            end
          end
      end
    })
  end)
    Wait(0)
  end
end)
end
end  

local coordx = nil
local coordy = nil
local coordz = nil
local coordh = nil

RegisterNetEvent("e:spawnvehicule")
AddEventHandler("e:spawnvehicule", function(model)
  for k,v in pairs(Config.Vehicule) do
    coordx = v.spawnzone.x
    coordy = v.spawnzone.y
    coordz = v.spawnzone.z 
    coordh = v.headingspawn
  end
  RequestModel(GetHashKey(model))
  while not HasModelLoaded(GetHashKey(model)) do 
    Wait(1) 
  end
  spawnveh = CreateVehicle(model, coordx, coordy, coordz, coordh, true, false)
  SetVehicleDirtLevel(spawnveh, 0)
  SetVehicleNumberPlateText(spawnveh, "25BCF298")
  RageUI.CloseAll()
  FreezeEntityPosition(GetPlayerPed(-1), false)
  bancaire = false
  espece = false 
  location = false
  prix = nil 
  model = nil 
end)

--- Ezuko#1144