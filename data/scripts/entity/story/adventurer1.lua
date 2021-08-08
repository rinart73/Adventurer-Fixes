local adf_givePlayerGoodie -- extended server function


if onServer() then


adf_givePlayerGoodie = Adventurer1.givePlayerGoodie
function Adventurer1.givePlayerGoodie(...)
    local player = Player(callingPlayer)
    if player:getValue("got_adventurer_system") then return end
    
    player:setValue("got_adventurer_system", true)
    
    adf_givePlayerGoodie(...)
end


end