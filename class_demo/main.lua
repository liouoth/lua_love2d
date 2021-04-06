function love.load()
    Object = require "classic"
    require "shape"
    require "rectangle"
    r1 = Rectangle(100, 100, 200, 50)
    r2 = Rectangle(350, 80, 25, 140)
end

function love.update(dt)
    r1:update(dt)
    r2:update(dt)
end

function love.draw()
    r1:draw()
    r2:draw()
end