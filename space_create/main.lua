function love.load()
    listOfRectangles = {}
end

function create_rect()
    rect = {}
    rect.x = 20
    rect.y = 200
    rect.width = 40
    rect.height = 100
    rect.speed = 200
    table.insert(listOfRectangles,rect)
end

function love.update(dt)
    for k,v in ipairs(listOfRectangles) do
        if v.x>400 then table.remove(listOfRectangles,k) end
        v.x = v.x + v.speed*dt
    end
end

function love.draw()
    for k,v in ipairs(listOfRectangles) do
        love.graphics.rectangle('fill',v.x,v.y,v.width,v.height)
    end
end

function love.keypressed(key)
    if key == "space" then
        create_rect()
    end
end
