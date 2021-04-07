Bullet = Object:exec

function Bullet:new()
    self.x = x
    self.y = y
    self.speed = 300
end

function Bullet:draw()
    love.graphics.print("=",x,y)
end

function Bullet:update(dt)
    self.x = self.speed+self.x*dt
end

