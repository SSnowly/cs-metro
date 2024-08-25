Config = {}

-- ████████╗██╗ ██████╗██╗  ██╗███████╗████████╗
-- ╚══██╔══╝██║██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
--    ██║   ██║██║     █████╔╝ █████╗     ██║   
--    ██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
--    ██║   ██║╚██████╗██║  ██╗███████╗   ██║   
--    ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
-- ==============================================
Config.TicketPrice = 100; -- Price per metro ticket
Config.MoneySymbol = '$'; -- Money symbol
Config.PayType = 'bank'; -- QB-Core: Your payment method (cash / bank)



-- ██████╗  ██████╗ ██╗     ██╗ ██████╗███████╗
-- ██╔══██╗██╔═══██╗██║     ██║██╔════╝██╔════╝
-- ██████╔╝██║   ██║██║     ██║██║     █████╗  
-- ██╔═══╝ ██║   ██║██║     ██║██║     ██╔══╝  
-- ██║     ╚██████╔╝███████╗██║╚██████╗███████╗
-- ╚═╝      ╚═════╝ ╚══════╝╚═╝ ╚═════╝╚══════╝
-- ==============================================                                        
Config.CallPolice = false; -- enable or disable the alert for the police: true / false
Config.PoliceAlert = 3500; --How often will the cops be called in ms



-- ██╗   ██╗██╗
-- ██║   ██║██║
-- ██║   ██║██║
-- ██║   ██║██║
-- ╚██████╔╝██║
--  ╚═════╝ ╚═╝
-- ==============================================    
-- IF USING OX_LIB, PLEASE UNCOMMENT '@ox_lib/init.lua' FROM YOUR FXMANIFEST.LUA
Config.Notify = 'qb' -- qb / okok / ox / cs 
Config.TextUI = 'gta' -- okok / DisplayHelpText (gta) / ox / ps



-- ███████╗██╗  ██╗████████╗██████╗  █████╗ ███████╗
-- ██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
-- █████╗   ╚███╔╝    ██║   ██████╔╝███████║███████╗
-- ██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║╚════██║
-- ███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║███████║
-- ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
-- ==================================================                                                  
Config.Banking = 'qb-banking' -- Your resource name for your banking system
Config.Dispatch = 'qb' -- ps / qs / qb
Config.PoliceJob = 'police' -- Your police job name | Only if using Core Dispatch
Config.UseFreight = false -- true / false | If you are experience train cars detaching from the freight train, set this to false.



-- ███████╗████████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ███████╗   ██║   ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ╚════██║   ██║   ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ███████║   ██║   ██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
-- ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
-- =================================================================  
Config.StationNames = { -- DO NOT EDIT NODES. ONLY EDIT NAMES!!!!!
    { node = 179,  name = "Strawberry",      },
    { node = 271,  name = "Puerto Del Sol",  },
    { node = 388,  name = "LSIA Parking",    },
    { node = 434,  name = "LSIA Terminal 4", },
    { node = 530,  name = "LSIA Terminal 4", },
    { node = 578,  name = "LSIA Parking",    },
    { node = 689,  name = "Puerto Del Sol",  },
    { node = 782,  name = "Strawberry",      },
    { node = 1078, name = "Burton",          },
    { node = 1162, name = "Portola Drive",   },
    { node = 1233, name = "Del Perro",       },
    { node = 1331, name = "Little Seoul",    },
    { node = 1397, name = "Pillbox South",   },
    { node = 1522, name = "Davis",           },
    { node = 1649, name = "Davis",           },
    { node = 1791, name = "Pillbox South",   },
    { node = 1869, name = "Little Seoul",    },
    { node = 1977, name = "Del Perro",       },
    { node = 2066, name = "Portola Drive",   },
    { node = 2153, name = "Burton",          },
    { node = 2246, name = "Strawberry"       }
}
Config.Blips = {
    {title="METRO: LSIA Terminal 4", colour=1, id=78, x=-1088.627, y=-2709.362, z=-7.137033},
	{title="METRO: LSIA Parking", colour=1, id=78, x=-889.2755, y=-2311.825, z=-11.45941},
	{title="METRO: Little Seoul", colour=1, id=78, x=-545.3138, y=-1280.548, z=27.09238},
	{title="METRO: Strawberry", colour=1, id=78, x=270.2029, y=-1210.818, z=39.25398},
	{title="METRO: Burton", colour=1, id=78, x=-286.3837, y=-318.877, z=10.33625},
	{title="METRO: Portola Drive", colour=1, id=78, x=-826.3845, y=-134.7151, z=20.22362},
	{title="METRO: Del Perro", colour=1, id=78, x=-1351.282, y=-481.2916, z=15.318},
	{title="METRO: Little Seoul", colour=1, id=78, x=-496.0209, y=-681.0325, z=12.08264},
	{title="METRO: Pillbox South", colour=1, id=78, x=-218.2868, y=-1031.54, z=30.51112},
	{title="METRO: Davis", colour=1, id=78, x=112.3714, y=-1729.233, z=30.24097},
}

-- =========================================================
-- ██╗      ██████╗  ██████╗ █████╗ ██╗     ███████╗███████╗
-- ██║     ██╔═══██╗██╔════╝██╔══██╗██║     ██╔════╝██╔════╝
-- ██║     ██║   ██║██║     ███████║██║     █████╗  ███████╗
-- ██║     ██║   ██║██║     ██╔══██║██║     ██╔══╝  ╚════██║
-- ███████╗╚██████╔╝╚██████╗██║  ██║███████╗███████╗███████║
-- ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
-- =========================================================
Config.NextStation = "Next Station - ~g~~a~" -- ~what should it say, currently says: Next Station ~g~<Station Name>, ~a~ has to be there.                                                              
Config.SelectedLocale = "en" -- selected locale, overtime there will be more by default!
Config.Locales = {
    ["en"] = {
        ["nextStation"] = "Next Station: ",
        ["unknown"] = "Unknown",
        ["notEnoughMoney"] = {
          ["title"] = "Los Santos Metro",
          ["description"] = "Transaction Failed. Insufficient Funds",
        },
        ["PhoneMessage"] = {
            ["sender"] = "metro@lossantos.gov", -- Needed for all phones
            ["title"] = "Ticket Purchase",
            ["message"] = "Thank you for purchasing a Los Santos Metro ticket for. Have a great ride!",
            ["senderName"] = 'Los Santos Metro', -- Only needed for yFlip
            ["image"] = "https://pbs.twimg.com/profile_images/891779342103138304/vPaHzwXA_400x400.jpg", -- Only needed for yFlip
        },
        ["TextUI"] = {
            ["all"] = '[E] - Buy Metro Ticket ($' .. Config.TicketPrice .. ')', -- all other than default GTA....
            ["gta"] = 'Press ~INPUT_CONTEXT~ to buy a metro ticket ($' .. Config.TicketPrice .. ')', -- just GTA, not kidding
        },
        ["Notifications"] = {
            ["already"] = {
                ["title"] = "Los Santos Metro",
                ["description"] = "You already have a metro ticket!",
            },
            ["recieved"] = {
                ["title"] = "Los Santos Metro",
                ["description"] = 'You have recieved your ticket. Go get on the subway before it leaves!',
            },
            ["voidticket"] = {
                ["title"] = "Los Santos Metro",
                ["description"] = 'Your metro ticket will be void once you leave the train!',
            },
            ["noticket"] = {
                ["title"] = "Los Santos Metro",
                ["description"] = 'You dont have a metro ticket.',
            },
            ["PoliceAlert"] = {
                ["qb-alert"] = 'Metro Boarded Without Ticket', -- used for qb default alerts
                ["cd-alert"] = {
                    ["title"] = "12-22", -- code for cd-dispatch,
                    ["description"] = 'An Alarm on a Train has been activated', -- description
                    ["blip"] = "Train Alarm", -- what should the blip say
                },
            },
        },
    },
    ["es"] = {
        ["nextStation"] = "Próxima Estación: ",
        ["unknown"] = "Desconocido",
        ["notEnoughMoney"] = {
            ["title"] = "Metro de Los Santos",
            ["description"] = "Transacción fallida. Fondos insuficientes",
        },
        ["PhoneMessage"] = {
            ["sender"] = "metro@lossantos.gov", -- Necesario para todos los teléfonos
            ["title"] = "Compra de Boleto",
            ["message"] = "¡Gracias por comprar un boleto del Metro de Los Santos! ¡Que tengas un buen viaje!",
            ["senderName"] = 'Metro de Los Santos', -- Solo necesario para yFlip
            ["image"] = "https://pbs.twimg.com/profile_images/891779342103138304/vPaHzwXA_400x400.jpg", -- Solo necesario para yFlip
        },
        ["TextUI"] = {
            ["all"] = '[E] - Comprar Boleto de Metro ($' .. Config.TicketPrice .. ')', -- todo diferente al GTA por defecto....
            ["gta"] = 'Presiona ~INPUT_CONTEXT~ para comprar un boleto de metro ($' .. Config.TicketPrice .. ')', -- solo GTA, no es broma
        },
        ["Notifications"] = {
            ["already"] = {
                ["title"] = "Metro de Los Santos",
                ["description"] = "¡Ya tienes un boleto de metro!",
            },
            ["recieved"] = {
                ["title"] = "Metro de Los Santos",
                ["description"] = 'Has recibido tu boleto. ¡Ve a subir al metro antes de que se vaya!',
            },
            ["voidticket"] = {
                ["title"] = "Metro de Los Santos",
                ["description"] = 'Tu boleto de metro será anulado una vez que salgas del tren!',
            },
            ["noticket"] = {
                ["title"] = "Metro de Los Santos",
                ["description"] = 'No tienes un boleto de metro.',
            },
            ["PoliceAlert"] = {
                ["qb-alert"] = 'Ingreso al Metro Sin Boleto', -- usado para alertas predeterminadas de qb
                ["cd-alert"] = {
                    ["title"] = "12-22", -- código para cd-dispatch,
                    ["description"] = 'Se ha activado una alarma en un tren', -- descripción
                    ["blip"] = "Alarma de Tren", -- qué debería decir el blip
                },
            },
        },
    },
    ["fr"] = {
        ["nextStation"] = "Prochaine Station : ",
        ["unknown"] = "Inconnu",
        ["notEnoughMoney"] = {
            ["title"] = "Métro de Los Santos",
            ["description"] = "Transaction échouée. Fonds insuffisants",
        },
        ["PhoneMessage"] = {
            ["sender"] = "metro@lossantos.gov", -- Nécessaire pour tous les téléphones
            ["title"] = "Achat de Billet",
            ["message"] = "Merci d'avoir acheté un billet de métro de Los Santos. Bon voyage !",
            ["senderName"] = 'Métro de Los Santos', -- Nécessaire uniquement pour yFlip
            ["image"] = "https://pbs.twimg.com/profile_images/891779342103138304/vPaHzwXA_400x400.jpg", -- Nécessaire uniquement pour yFlip
        },
        ["TextUI"] = {
            ["all"] = '[E] - Acheter un Billet de Métro ($' .. Config.TicketPrice .. ')', -- tout sauf le GTA par défaut....
            ["gta"] = 'Appuyez sur ~INPUT_CONTEXT~ pour acheter un billet de métro ($' .. Config.TicketPrice .. ')', -- juste GTA, pas de blague
        },
        ["Notifications"] = {
            ["already"] = {
                ["title"] = "Métro de Los Santos",
                ["description"] = "Vous avez déjà un billet de métro !",
            },
            ["recieved"] = {
                ["title"] = "Métro de Los Santos",
                ["description"] = 'Vous avez reçu votre billet. Montez dans le métro avant qu'il ne parte !',
            },
            ["voidticket"] = {
                ["title"] = "Métro de Los Santos",
                ["description"] = 'Votre billet de métro sera annulé une fois que vous quitterez le train !',
            },
            ["noticket"] = {
                ["title"] = "Métro de Los Santos",
                ["description"] = 'Vous n\'avez pas de billet de métro.',
            },
            ["PoliceAlert"] = {
                ["qb-alert"] = 'Entrée dans le Métro Sans Billet', -- utilisé pour les alertes par défaut de qb
                ["cd-alert"] = {
                    ["title"] = "12-22", -- code pour cd-dispatch,
                    ["description"] = 'Une alarme a été activée dans un train', -- description
                    ["blip"] = "Alarme de Train", -- que devrait dire le blip
                },
            },
        },
    }        
}