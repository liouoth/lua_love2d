Enemy = Object:extend()

function Enemy:new()
    self.avatar = love.graphics.newImage("snake.png")
    self.x = love.graphics.getWidth()/2
    self.y = 100
    self.speed= 200
    self.width = self.avatar:getWidth()
    self.height = self.avatar:getHeight()
    self.direction = true
end 

function Enemy:draw()
    love.graphics.draw(self.avatar,self.x,self.y)
end

function Enemy:update(dt)
    if ((self.x + self.width + self.speed*dt)>love.graphics.getWidth() and self.direction) then
        self.x = love.graphics.getWidth()-self.width
        self.direction = false
        return
    elseif(self.x - self.speed*dt<0 and not self.direction) then
        self.x = 0
        self.direction = true
        return
    end

    if(self.direction) then self.x = self.x + self.speed*dt
    else self.x = self.x - self.speed*dt end
end
