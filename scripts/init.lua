--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")
print("Starting up scipts")

-- Add Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hosted_items.json")
Tracker:AddItems("items/flags.json")
Tracker:AddItems("shardHunt/shards.json")

if Tracker.ActiveVariantUID == "NOverworld" or Tracker.ActiveVariantUID == "shardHuntNOverworld" then
  Tracker:AddMaps("maps/NOverworldMaps.json")
else
  Tracker:AddMaps("maps/maps.json")
end

ScriptHost:LoadScript("scripts/logic.lua")

if Tracker.ActiveVariantUID == "NOverworld" or Tracker.ActiveVariantUID == "shardHuntNOverworld" then
    Tracker:AddLocations("locations/NOverworld/locations.json")
    Tracker:AddLocations("locations/NOverworld/incentives.json")
else
    Tracker:AddLocations("locations/locations.json")
    Tracker:AddLocations("locations/incentives.json")
end

Tracker:AddLayouts("layouts/shared.json")
if Tracker.ActiveVariantUID == "shardHunt" then
  Tracker:AddLayouts("shardHunt/tracker.json")
  Tracker:AddLayouts("shardHunt/broadcast.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNoMap" then
  Tracker:AddLayouts("shardHuntNoMap/tracker.json")
  Tracker:AddLayouts("shardHuntNoMap/broadcastNoMap.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNOverworld" then
  Tracker:AddLayouts("NOverworld/shardsTracker.json")
  Tracker:AddLayouts("NOverworld/broadcastShards.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNOverworldNoMap" then
  Tracker:AddLayouts("NOverworld/shardsTrackerNoMap.json")
  Tracker:AddLayouts("NOverworld/broadcastShardsNoMap.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "NOverworld" then
  Tracker:AddLayouts("NOverworld/tracker.json")
  Tracker:AddLayouts("NOverworld/broadcast.json")
elseif Tracker.ActiveVariantUID == "NOverworldNoMap" then
  Tracker:AddLayouts("NOverworld/trackerNoMap.json")
  Tracker:AddLayouts("NOverworld/broadcastNoMap.json")
elseif Tracker.ActiveVariantUID == "standardNoMap" then
  Tracker:AddLayouts("standardNoMap/tracker.json")
  Tracker:AddLayouts("standardNoMap/broadcastNoMap.json")
else
  Tracker:AddLayouts("layouts/tracker.json")
  Tracker:AddLayouts("layouts/standard_broadcast.json")
end

-- Default Flags
local progressionFlag = Tracker:FindObjectForCode("progressionFlag")
progressionFlag.CurrentStage = 1
local npcsIncentive = Tracker:FindObjectForCode("npcsAreIncentive")
npcsIncentive.Active = true
local fetchQuestsIncentive = Tracker:FindObjectForCode("fetchQuestsAreIncentive")
fetchQuestsIncentive.Active = true
local iceIncentive = Tracker:FindObjectForCode("iceCaveIsIncentive")
iceIncentive.Active = true
local ordealsIncentive = Tracker:FindObjectForCode("ordealsIsIncentive")
ordealsIncentive.Active = true
local marshIncentive = Tracker:FindObjectForCode("marshIsIncentive")
marshIncentive.Active = true
local earthIncentive = Tracker:FindObjectForCode("earthIsIncentive")
earthIncentive.Active = true
local seaIncentive = Tracker:FindObjectForCode("seaIsIncentive")
seaIncentive.Active = true
local skyIncentive = Tracker:FindObjectForCode("skyIsIncentive")
skyIncentive.Active = true
local coneriaLockedIncentive = Tracker:FindObjectForCode("coneriaLockedIsIncentive")
coneriaLockedIncentive.Active = true


Tracker.DisplayAllLocations = PREFERENCE_DISPLAY_ALL_LOCATIONS

if _VERSION == "Lua 5.3" then
  print("Your tracker version supports autotracking!")
  ScriptHost:LoadScript("scripts/autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
