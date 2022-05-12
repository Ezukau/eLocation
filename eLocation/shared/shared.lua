Config = {}

Config = {

    Vehicule = {
        {vehiculename = "Panto", vehiculelabel = "panto", hash = -431692672, description = "Vehicule 2 places, avec un large coffre !", price = 300, caution = 50, spawnzone = vector3(4440.85, -4485.72, 3.64), headingspawn = 196.95},
        {vehiculename = "Sultan", vehiculelabel = "sultan", hash = 970598228, description = "Avec ses 4 places ce véhicule est parfait pour les sorties entre amis", caution = 50, price = 500, spawnzone = vector3(4440.85, -4485.72, 3.64), headingspawn = 196.95},
    },

    Menu = {
        CouleurMenu = "y",  --"r" = rouge, "b" = bleu, "g" = vert, "y" = jaune, "p" = violet, "c" = gris, "m" = gris foncé, "u" = noir, "o" = orange
        Banner ="img_jaune", --Couleur de la banière : img_red, img_bleu, img_vert, img_jaune, img_violet, img_gris, img_grisf, img_orange
        NomMenu = "Location", --Nom du menu 
        DescriptionMenu = "Interaction", --Nom de la Description du menu
    },

    Location = {
        Texte = "Appuyez sur ~y~[E] ~s~pour accèder a la ~y~Location ~s~!",  -- Texte
        Position = {vector3(4443.70, -4482.88, 4.27)}, -- Position du menu

        Texte2 = "Appuyez sur ~y~[E] ~s~pour rendre la ~y~Location ~s~!",  -- Texte
        Position2 = {vector3(4448.41, -4480.88, 4.27)}, -- Position pour rendre le vehicule
    },

    Blips = {
        Couleur = 5, -- https://docs.fivem.net/docs/game-references/blips/
        Model = 409, -- https://docs.fivem.net/docs/game-references/blips/
        Taille = 0.7,
        Name = "Location",
    },

    Ped = {
        {pos = vector3(4443.70, -4482.88, 3.27), heading = 196.95, 
        Type = "a_m_m_golfer_01", -- https://docs.fivem.net/docs/game-references/ped-models/
        },
    },

    --Marker location
    MarkerType = 21, -- https://docs.fivem.net/docs/game-references/markers/
    MarkerColorR = 255, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 202, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 50, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, 
    MarkerSizeLargeur = 0.3,
    MarkerSizeEpaisseur = 0.3,
    MarkerSizeHauteur = 0.3,
    MarkerDistance = 25,
    MarkerSaute = false, 
    MarkerTourne = false, 

    -- Marker rendre le vehicule
    MarkerType2 = 21, -- https://docs.fivem.net/docs/game-references/markers/
    MarkerColorR2 = 255, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG2 = 202, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB2 = 50,  -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerDistance2 = 25,
    MarkerSizeLargeur2 = 0.3, 
    MarkerSizeEpaisseur2 = 0.3, 
    MarkerSizeHauteur2 = 0.3, 
    MarkerOpacite2 = 180, 
    MarkerSaute2 = false,
    MarkerTourne2 = false,
}

--- Ezuko#1144