if onClient() then -- CLIENT


local old_updateClient = updateClient
function updateClient(timeStep)
    if Player():getValue("talked_to_adventurer") then return end
    old_updateClient(timeStep)
end

function initUI()
    ScriptUI():registerInteraction("Greetings"%_t, "onGreet") -- fix localization
end


else -- SERVER


function givePlayerGoodie()
    -- keep this part in case mod was installed on pre-existing server
    if data.given[callingPlayer] then return end
    local player = Player(callingPlayer)
    if player:getValue("got_adventurer_system") then return end
    
    data.given[callingPlayer] = true
    player:setValue("got_adventurer_system", true)
    
    player:getInventory():add(SystemUpgradeTemplate("data/scripts/systems/radarbooster.lua", Rarity(1), Seed(124)))
end
callable(nil, "givePlayerGoodie")

local old_onMeetAdventurer = onMeetAdventurer
function onMeetAdventurer()
    Player(callingPlayer):setValue("talked_to_adventurer", true)
    old_onMeetAdventurer()
end
callable(nil, "onMeetAdventurer")


end