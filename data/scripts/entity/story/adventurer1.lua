local adventurerFixes_updateClient, adventurerFixes_onMeetAdventurer

if onClient() then


adventurerFixes_updateClient = updateClient
function updateClient(...)
    if Player():getValue("talked_to_adventurer") then return end

    adventurerFixes_updateClient(...)
end

function initUI() -- overridden
    ScriptUI():registerInteraction("Greetings"%_t, "onGreet") -- fix localization
end


else -- onServer


function givePlayerGoodie() -- overridden
    -- keep this part in case mod was installed on pre-existing server
    if data.given[callingPlayer] then return end
    local player = Player(callingPlayer)
    if player:getValue("got_adventurer_system") then return end
    
    data.given[callingPlayer] = true
    player:setValue("got_adventurer_system", true)
    
    player:getInventory():add(SystemUpgradeTemplate("data/scripts/systems/radarbooster.lua", Rarity(1), Seed(124)))
end

adventurerFixes_onMeetAdventurer = onMeetAdventurer
function onMeetAdventurer(...)
    Player(callingPlayer):setValue("talked_to_adventurer", true)

    adventurerFixes_onMeetAdventurer(...)
end


end