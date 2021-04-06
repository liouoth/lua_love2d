function love.load()
    size = 20
    position_x = 500
end

function love.draw()
    love.graphics.circle('fill',position_x,50,size)
end

-- every computer frames per second (fps) are different
-- so in order to keep same update
-- use delta time to set
function love.update(df)
    if love.keyboard.isDown('right') then 
        if position_x<500 then position_x = position_x+300*df end
    elseif love.keyboard.isDown('left') then
        if position_x>0 then position_x =  position_x-300*df end
    end
end