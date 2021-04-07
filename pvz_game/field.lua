Field = Object:extend()

function Field:new()
    self.plant = nil
end

function field_draw(x,y,width,height,list)
    love.graphics.rectangle("line",x,y,width,height)
    for i=1,6 do
        for j=1,4 do
            love.graphics.rectangle("line",x+80*(i-1),y+80*(j-1),80,80)
            if(list[i][j].plant ~= nil) then
                list[i][j].plant:draw()
            end
        end
    end
end

function field_initial()
    local list = {}
    for i=1,6 do
        list[i] = {}
        for j=1,4 do
            list[i][j] = Field()
        end
    end
    return list
end

function Field:seed(plant)
    self.plant = plant
end

