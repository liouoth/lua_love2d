function love.load()
    Object = require "classic"
    require "type"
    require "slot"
    require "field"
    --加载卡槽
    plant_slot = slot_initial()
    --加载土地
    field_list = field_initial()
end

function love.draw()
    slot_draw(plant_slot,20,30)
    field_draw(20,230,660,320,field_list)
end

function love.update(df)
end

