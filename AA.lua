local DS = {}

function DS.GetAllMaps()
    return {
        {jjk = "Cursed Academy"},
        {magnolia = "Magic Town"},
        {hxhant = "Ant Kingdom"},
        {hueco = "Hollow World"},
        {tokyoghoul = "Ghoul City"},
        {marineford = "Marine's Ford"},
        {naruto = "Hidden Sand Village"},
        {demonslayer = "Snowy Town"},
        {aot = "Shiganshinu District"},
        {namek = "Planet Namak"}
    }   
end
function DS.GetRaids()
    return {
        {west_city_raid = "West City"},
        {demonslayer_raid = "Infinity Train"},
        {naruto_raid = "Hidden Sand Village"},
        {aot_raid = "Shiganshinu District"}
    }
end
function DS.GetTeleports()
    return {
        {["Play"] = game:GetService("Workspace")["_teleports"].play.CFrame},
        {["Dungeon"] = game:GetService("Workspace")["_LOBBIES"]["story build"].Teleporter.beamholder.CFrame + Vector3.new(0,2,0)},
        {["Summon"] = game:GetService("Workspace")["_teleports"].summon.CFrame},
        {["Challenge"] = game:GetService("Workspace")["_CHALLENGES"].shell.floor.CFrame},
        {["Raid"] = game:GetService("Workspace")["_RAID"].shell.floor.CFrame},
        {["Leaderboards"] = game:GetService("Workspace")["_LEADERBOARDS_"].shell.floor.CFrame},
        {["Gojo Domain"] = game:GetService("Workspace")["_gojodomain"].entrance.CFrame},
        {["Infinity Castle"] = game:GetService("Workspace")["_infinity_castle"].entrance.CFrame},
        {["Sukuna Domain"] = game:GetService("Workspace")["_sukunadomain"].entrance.CFrame}
    }
end

function DS.PlaceUnits(option)
    local wave = game:GetService("Workspace"):WaitForChild("_wave_num").Value
    if option == "Story" or option == "Raid" or option == "CursedWomb" or option == "Chg" or option == "InfCastle" or option == "Mission" then
        if wave < 15 and _G.Config.Story.Units["u1"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u1"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u1"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u1", i))
            end
        end
        if wave < 15 and _G.Config.Story.Units["u2"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u2"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u2"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u2", i))
            end
        end
        if wave < 15 and _G.Config.Story.Units["u3"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u3"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u3"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u3", i))
            end
        end
        if wave > 6 and _G.Config.Story.Units["u4"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u4"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u4"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u4", i))
            end
        end
        if wave > 6 and _G.Config.Story.Units["u5"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u5"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u5"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u5", i))
            end
        end
        if wave > 6 and _G.Config.Story.Units["u6"] ~= "" then
            local uID = string.split(_G.Config.Story.Units["u6"], " ")
            for i = 1, _G.Config.Story.SpawnCap["u6"] do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u6", i))
            end
        end
    elseif option == "Inf" then
        if wave < 4 then
            local uID =  string.split(_G.Config.Inf.Units["u1"], " ")
            for i = 1, 3 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u1", i))
            end
        end
        if wave < 4 then
            local uID =  string.split(_G.Config.Inf.Units["u2"], " ")
            for i = 1, 4 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u2", i))
            end
        end
        if wave > 2 and wave < 6 then
            local uID =  string.split(_G.Config.Inf.Units["u3"], " ")
            for i = 1, 4 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u3", i))
            end
        end
        if wave > 6 and wave < 15 then
            local uID =  string.split(_G.Config.Inf.Units["u4"], " ")
            for i = 1, 4 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u4", i))
            end
        end
        if wave > 10 then
            local uID =  string.split(_G.Config.Inf.Units["u5"], " ")
            for i = 1, 4 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u5", i))
            end
        end
        if wave > 10 then
            local uID =  string.split(_G.Config.Inf.Units["u6"], " ")  
            for i = 1, 5 do
                PlaceToLoc(uID[3], UnitPos(_G.Config[option].Map, "u6", i))
            end
        end
    end
end

function UnitCFrames(CFrame, UnitAmount, Queue, OtherMultiplier)
    local table = {}
    local multiplier = 0
    if Queue == "x" then
        for i = 1, UnitAmount do
            table[i] = CFrame + Vector3.new((0.85 * multiplier), 0, (0.85 * OtherMultiplier))
            multiplier = multiplier + 1
        end
    elseif Queue == "z" then
        for i = 1, UnitAmount do
            table[i] = CFrame + Vector3.new((0.85 * OtherMultiplier), 0, (0.85 * multiplier))
            multiplier = multiplier + 1
        end
    elseif Queue == "money" then
        for i = 1, UnitAmount do
            table[i] = CFrame + Vector3.new(0, (5 * multiplier), 0)
            multiplier = multiplier + 1
        end
    end
    return table
end
function UnitPos(map, unit, pos)
    local UnitPos = {   
        ["jjk"] = {
            u1 = UnitCFrames(CFrame.new(378.5, 146, -78.5), 3, "money"),
            u2 = UnitCFrames(CFrame.new(364, 122, -87), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(364, 122, -87), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(364, 122, -87), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(364, 122, -87), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(364, 122, -87), 4, "z", 4)
        },
        ["magnolia"] = {
            u1 = UnitCFrames(CFrame.new(-598, 22.5, -830.3), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-604, 7, -830), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(-604, 7, -830), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(-604, 7, -830), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(-604, 7, -830), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(-604, 7, -830), 4, "z", 4)
        },
        ["hxhant"] = {
            u1 = UnitCFrames(CFrame.new(-166, 23, 2939), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-162, 23, 2953), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-162, 23, 2953), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-162, 23, 2953), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-162, 23, 2953), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-162, 23, 2953), 4, "x", 4)
        },
        ["hueco"] = {
            u1 = UnitCFrames(CFrame.new(-154, 133, -725.65), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-188, 133, -761), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(-188, 133, -761), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(-188, 133, -761), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(-188, 133, -761), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(-188, 133, -761), 4, "z", 4)
        },
        ["tokyoghoul"] = {
            u1 = UnitCFrames(CFrame.new(-3022.8, 58.5, -48.6), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-3000, 58.5, -48), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-3000, 58.5, -48), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-3000, 58.5, -48), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-3000, 58.5, -48), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-3000, 58.5, -48), 4, "x", 4)
        },
        ["marineford"] = {
            u1 = UnitCFrames(CFrame.new(-2590, 34.5, -37), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-2553, 25.2, -38), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-2553, 25.2, -38), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-2553, 25.2, -38), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-2553, 25.2, -38), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-2553, 25.2, -38), 4, "x", 4)
        },
        ["naruto"] = {
            u1 = UnitCFrames(CFrame.new(-878.5, 32, 328), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 4)
        },
        ["demonslayer"] = {
            u1 = UnitCFrames(CFrame.new(-2971.5, 42.45, -170.8), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-2870, 34.3, -124), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-2870, 34.3, -124), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-2870, 34.3, -124), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-2870, 34.3, -124), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-2870, 34.3, -124), 4, "x", 4)
        },
        ["aot"] = {
            u1 = UnitCFrames(CFrame.new(-2981, 42, -692), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 4)
        },
        ["namek"] = {
            u1 = UnitCFrames(CFrame.new(-2926, 94.4, -750.3), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-2948.5, 91.8, -709.5), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-2948.5, 91.8, -709.5), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-2948.5, 91.8, -709.5), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-2948.5, 91.8, -709.5), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-2948.5, 91.8, -709.5), 4, "x", 4)
        },
        ["west_city_raid"] = {
            u1 = UnitCFrames(CFrame.new(-2359, 40, -85), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-2359, 19.75, -85.8), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(-2359, 19.75, -85.8), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(-2359, 19.75, -85.8), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(-2359, 19.75, -85.8), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(-2359, 19.75, -85.8), 4, "z", 4)
        },
        ["demonslayer_raid"] = {
            u1 = UnitCFrames(CFrame.new(86, -7, 318.8), 3, "money"),
            u2 = UnitCFrames(CFrame.new(35, -15, 325), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(35, -15, 325), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(35, -15, 325), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(35, -15, 325), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(35, -15, 325), 4, "z", 4)
        },
        ["naruto_raid"] = {
            u1 = UnitCFrames(CFrame.new(-878.5, 32, 328), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 0),
            u3 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 1),
            u4 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 2),
            u5 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 3),
            u6 = UnitCFrames(CFrame.new(-894, 25.3, 312), 4, "x", 4)
        },
        ["aot_raid"] = {
            u1 = UnitCFrames(CFrame.new(-2981, 42, -692), 3, "money"),
            u2 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 0),
            u3 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 1),
            u4 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 2),
            u5 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 3),
            u6 = UnitCFrames(CFrame.new(-3014, 33.75, -682), 4, "z", 4)
        }
    }
    return UnitPos[map][unit][pos]
end
function PlaceToLoc(UnitID, Location)
    if game:GetService("Workspace")["_wave_num"].Value < _G.Config.Inf.WaveToLose then
        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(UnitID, Location)
    end
end

function DS.Codes()
    return {
        "CURSE2",
        "CURSE",
        "subtomaokuma",
        "TOADBOIGAMING",
        "SubToKelvingts",
        "SubToBlamspot",
        "FictioNTheFirst",
        "KingLuffy",
        "noclypso"
    }
end

return DS;
