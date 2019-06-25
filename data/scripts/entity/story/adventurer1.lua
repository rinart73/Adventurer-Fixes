local adventurerFixes_givePlayerGoodie


if onServer() then


adventurerFixes_givePlayerGoodie = Adventurer1.givePlayerGoodie
function Adventurer1.givePlayerGoodie(...)
    local player = Player(callingPlayer)
    if player:getValue("got_adventurer_system") then return end
    
    player:setValue("got_adventurer_system", true)
    
    adventurerFixes_givePlayerGoodie(...)
end


end