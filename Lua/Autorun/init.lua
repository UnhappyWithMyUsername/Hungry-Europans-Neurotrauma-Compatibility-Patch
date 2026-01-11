NTA = {}
NTA.Name="Hungry Europans Patch"
NTA.Version = "1.0"
NTA.Path = table.pack(...)[1]
Timer.Wait(function() if NTC ~= nil and NTC.RegisterExpansion ~= nil then NTC.RegisterExpansion(NTA) end end,1)

if (Game.IsMultiplayer and SERVER) or not Game.IsMultiplayer then

    dofile(NTA.Path.."/Lua/humanupdate.lua")

    Timer.Wait(function()
        if NTC == nil then
            print("Error loading NT + HE Patch: It appears Neurotrauma isn't loaded!")
            return
        end
    end,1)

end