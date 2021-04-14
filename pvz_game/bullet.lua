Bullet = Object:extend()

function Bullet:new(x,y)
    self.x = x
    self.y = y
    self.speed = 300
    self.attack = 30
end

function Bullet:draw()
    love.graphics.print("=>",self.x,self.y)
end

function Bullet:update(dt)
    self.x = self.x+self.speed*dt
end

