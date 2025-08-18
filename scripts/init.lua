--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")
print("Starting up scipts")

-- Add Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hosted_items.json")
Tracker:AddItems("items/flags.json")
Tracker:AddItems("items/shards.json")

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
    Tracker:AddLocations("locations/overworld.json")
end

Tracker:AddLayouts("layouts/standard/shared.json")
if Tracker.ActiveVariantUID == "shardHunt" then
  Tracker:AddLayouts("layouts/shardHunt/tracker.json")
  Tracker:AddLayouts("layouts/shardHunt/broadcast.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNoMap" then
  Tracker:AddLayouts("layouts/shardHuntNoMap/tracker.json")
  Tracker:AddLayouts("layouts/shardHuntNoMap/broadcastNoMap.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNOverworld" then
  Tracker:AddLayouts("layouts/NOverworld/shardsTracker.json")
  Tracker:AddLayouts("layouts/NOverworld/broadcastShards.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "shardHuntNOverworldNoMap" then
  Tracker:AddLayouts("layouts/NOverworld/shardsTrackerNoMap.json")
  Tracker:AddLayouts("layouts/NOverworld/broadcastShardsNoMap.json")
  local shardsRequired = Tracker:FindObjectForCode("shardsRequired")
  shardsRequired.CurrentStage = 8
elseif Tracker.ActiveVariantUID == "NOverworld" then
  Tracker:AddLayouts("layouts/NOverworld/tracker.json")
  Tracker:AddLayouts("layouts/NOverworld/broadcast.json")
elseif Tracker.ActiveVariantUID == "NOverworldNoMap" then
  Tracker:AddLayouts("layouts/NOverworld/trackerNoMap.json")
  Tracker:AddLayouts("layouts/NOverworld/broadcastNoMap.json")
elseif Tracker.ActiveVariantUID == "standardNoMap" then
  Tracker:AddLayouts("layouts/standardNoMap/tracker.json")
  Tracker:AddLayouts("layouts/standardNoMap/broadcastNoMap.json")
else
  Tracker:AddLayouts("layouts/standard/tracker.json")
  Tracker:AddLayouts("layouts/standard/standard_broadcast.json")
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
local earlyKing = Tracker:FindObjectForCode("earlyKing")
earlyKing.Active = true
local earlySarda = Tracker:FindObjectForCode("earlySarda")
earlySarda.Active = true
local earlySage = Tracker:FindObjectForCode("earlySage")
earlySage.Active = true
local earlyOrdeals = Tracker:FindObjectForCode("earlyOrdeals")
earlyOrdeals.Active = true


Tracker.DisplayAllLocations = PREFERENCE_DISPLAY_ALL_LOCATIONS

if _VERSION == "Lua 5.3" then
  print("Your tracker version supports autotracking!")
  ScriptHost:LoadScript("scripts/autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
