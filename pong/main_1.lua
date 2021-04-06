function love.load()
    size = 20
    direction = true
    position_x = 500
end

function love.draw()
    love.graphics.circle('fill',position_x,50,size)
end

-- every computer frames per second (fps) are different
-- so in order to keep same update
-- use delta time to set
function love.update(df)
    if(position_x>500) then direction = false
    elseif(position_x<0) then direction = true end

    if(direction) then position_x = position_x+300*df
    else position_x = position_x-300*df
    end
end