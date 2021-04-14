Plant = Object:extend()

function Plant:new(image,x,y)
    self.image = image
    self.x = x
    self.y = y
end

function Plant:draw()
    love.graphics.print(self.image,self.x,self.y)
end