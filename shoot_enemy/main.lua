function love.load()
    Object = require "classic"
    require "player"    
    require "enemy"
    require "bullet"
    player = Player()
    enemy = Enemy()
    listBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)
    for k,v in ipairs(listBullets) do
        v:update(dt)
        v:checkCollision(enemy)
        if(v.dead) then table.remove(listBullets,k) end
    end
end

function love.draw()
    player:draw()
    enemy:draw()
    for k,v in ipairs(listBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    if key == "space" then table.insert(listBullets,Bullet(player.x+player.width/2,player.y))
    end
end

