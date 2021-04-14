Zombie = Object:extend()

function Zombie:new(x,y)
    self.image = love.graphics.newImage('zombie.png')
    self.x = x
    self.y =y
    self.height = 80
    self.width = 80
    self.hp = 100
    self.speed = 30
end

function Zombie:draw()
    love.graphics.draw(self.image,self.x,self.y,0,self.height/self.image:getHeight(),self.width/self.image:getWidth())
end

function Zombie:update(dt)
    self.x = self.x - dt*self.speed
end