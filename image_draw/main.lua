function love.load()
    my_image = love.graphics.newImage("sheep.png")
    love.graphics.setBackgroundColor(1,1,1)
end

function love.draw()
    love.graphics.setColor(255/255, 200/255, 40/255, 127/255)
    love.graphics.setColor(1, 0.78, 0.15, 0.5)
    -- image ,x,y
    love.graphics.draw(my_image,100,100)
    --image,x,y,r(rotation),x-scale,y-scale
    love.graphics.draw(my_image,200,100,0,2,2)
    love.graphics.draw(my_image,300,100,0,1,2)

    --by defalut ,scale、rotation by top of image
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(my_image,400,100,0,1,1,0,0)
    love.graphics.draw(my_image,400,100,2,1,1,20,20)

end
