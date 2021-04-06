Player = Object:extend()

function Player:new()
    self.avatar = love.graphics.newImage("panda.png")
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()-100
    self.speed= 200
    self.width = self.avatar:getWidth() 
end 

function Player:draw()
    love.graphics.draw(self.avatar,self.x,self.y)
end

function Player:update(dt)
    if love.keyboard.isDown("left") 
        then self.x = (self.x-self.speed*dt)>0 and self.x-self.speed*dt or 0 end
    if love.keyboard.isDown("right")
        then self.x = (self.x+self.width+self.speed*dt)>love.graphics.getWidth() and love.graphics.getWidth()-self.width or self.x+self.speed*dt
    end
end