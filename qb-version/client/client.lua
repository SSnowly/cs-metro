local trains = {}
local inTram = false
local currentNode = nil

local stations <const> = {
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

local defaultStationText <const> = Config.NextStation

Citizen.CreateThread(function()
    if not Config.UseFreight then 
        SwitchTrainTrack(0, false)
        SwitchTrainTrack(3, true)
        SetTrainTrackSpawnFrequency(0, 0)
        SetRandomTrains(1)
        SetTrainsForceDoorsOpen(false)
    else
        SwitchTrainTrack(0, true)
        SwitchTrainTrack(3, true)
        SetTrainTrackSpawnFrequency(0, 120000)
        SetRandomTrains(1)
        SetTrainsForceDoorsOpen(false)
    end


    local text = GetConvar("trams_station_text", defaultStationText)
    AddTextEntry("NEXT_STATION_NOTIFICATION", text)
end)

CreateThread(function()
    while true do
        Wait(1000)

        local player = PlayerPedId()
        local coords = GetEntityCoords(player)

        trains = GetTrams(coords)

        if #trains >= 1 then
            local train = trains[1][1]

            if train ~= nil then
                currentNode = GetTrainCurrentTrackNode(train)
            else
                currentNode = nil
            end
        end

        inTram = IsPedInAnyTrain(player)
    end
end)


function findNearestStation(node)
    local nearestStation = Config.Locales[Config.SelectedLocale]["unknown"]
    local closestDistance = math.huge

    for _, station in ipairs(stations) do
        local stationNode = station.node
        local distanceToStation = math.abs(node - stationNode)

        if distanceToStation < closestDistance then
            closestDistance = distanceToStation
            nearestStation = station.name
        end
    end

    return nearestStation
end


CreateThread(function()
    while true do
        Wait(0)

        if inTram and currentNode ~= nil then
            local closestDistance = math.huge
            local closestStation = Config.Locales[Config.SelectedLocale]["unknown"]

            for _, station in ipairs(stations) do
                local stationNode = station.node
                local distanceToStation = math.abs(currentNode - stationNode)

                if distanceToStation < closestDistance then
                    closestDistance = distanceToStation
                    closestStation = station.name
                end
            end

            local nextst = Config.Locales[Config.SelectedLocale]["unknown"]

            for _, station in ipairs(stations) do
                if currentNode < station.node then
                    nextst = station.name
                    break
                end
            end
            BeginTextCommandDisplayHelp("NEXT_STATION_NOTIFICATION")
            AddTextComponentSubstringPlayerName(closestStation)
            EndTextCommandDisplayHelp(0, 0, 0, -1)
        end
    end
end)


CreateThread(function()
    while true do
        Wait(0)

        if inTram and currentNode ~= nil then
            local nextStation = Config.Locales[Config.SelectedLocale]["unknown"]

            for _, station in ipairs(stations) do
                if currentNode < station.node then
                    nextStation = station.name
                    break
                end
            end

            -- Draw text on the player's screen
            SetTextFont(4)
            SetTextScale(0.5, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextOutline()

            local screenWidth, screenHeight = GetScreenResolution()
            local x = screenWidth / 2.0
            local y = 20.0

            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(Config.Locales[Config.SelectedLocale]["nextStation"] .. nextStation)
            EndTextCommandDisplayText(x, y)
        end
    end
end)



function compareCoords(a, b) return a[2] < b[2] end

function GetTrams(coords)
    local trams = {}

    local vehiclePool = GetGamePool("CVehicle");
    for k, vehicle in pairs(vehiclePool) do
        local distance = #(GetEntityCoords(vehicle) - coords)

        if distance <= 200 and GetEntityModel(vehicle) == `metrotrain` then
            table.insert(trams, {vehicle, distance, GetEntitySpeed(vehicle)})
        end
    end

    table.sort(trams, compareCoords)

    return trams
end