function love.load()
    Object = require "classic"
    require "type"
    require "slot"
    require "field"
    require "plant"
    require "bullet"
    Timer = require "timer"
    --加载卡槽
    plant_slot = slot_initial()
    field_x = 20
    field_y = 230

    --加载土地
    field_list = field_initial()

    --子弹
    bullets = {}
end

function love.draw()
    slot_draw(plant_slot,20,30)
    field_draw(20,230,660,320,field_list)
    for k,v in ipairs(bullets) do
        bullets[k]:draw()
    end
end

function love.update(df)
    for k,v in ipairs(bullets) do
        bullets[k]:update()
    end
end

function love.mousepressed( x, y, button )
    local state = nil
    -- 划分区域
    if(button == 1) then
        state = pivot_press_area(x,y)
        if (state ~= nil) then
            active_area(state,x,y)
        end
    end

end

function pivot_press_area(x,y)
    -- 1 卡槽
    if(x>=20 and x<=500 and y>=30 and y<=110) then
        return 1

    -- 2 土地
    elseif (x>=20 and x<=500 and y>=230 and y<=550) then
        return 2
    end
end

function active_area(state,x,y)
    if(state == 1) then
        for k,v in ipairs(plant_slot) do
            plant_slot[k].isChoosed = false
        end
        plant_slot[math.floor((x-20)/80)+1].isChoosed = true
    elseif (state ==2) then
        seed_plant(x,y)
    end
end

function seed_plant(x,y)
    local seed_x = math.floor((x-20)/80)+1
    local seed_y = math.floor((y-230)/80)+1
    local index_chosen = nil
    for k,v in ipairs(plant_slot) do
        if(plant_slot[k].isChoosed) then index_chosen = k end
    end
    if(index_chosen ~=nil) then 
        -- msg = "seed x:" ..(seed_x-1)*80 .."send y:"..230+(seed_y-1)*80
        local temp_plant = create_plant(index_chosen,20+(seed_x-1)*80,230+(seed_y-1)*80)
        field_list[seed_x][seed_y].plant = temp_plant 
        -- Timer.during(2,function() table.insert(bullets,Bullet((seed_x-1)*80+10,230+(seed_y-1)*80+30)) end)
        Timer.every(2,function() table.insert(Bullet(bullets,100,100)) end)
    end
end

function create_plant(type_index,x,y)
    return Plant(plant_slot[type_index].image,x,y)
end

