function love.load()
    -- 引入test lua
    require "test"
end

function love.draw()
    love.graphics.print(a())
end