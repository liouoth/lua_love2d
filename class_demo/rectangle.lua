Rectangle = Shape:extend()

function Rectangle:new(x,y,width,height)
    -- self.x = x
    -- self.y = y
    Rectangle.super.new(self,x,y)  --需要将self传入
    self.width = width
    self.height = height
end

function Rectangle:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end 

-- function Rectangle:update(dt)
--     self.x = self.x + self.speed*dt
-- end 