-- 植物大战僵尸

-- 开发步骤：
-- 1.画出大体框架，包含卡包、土地位置、以及balance
-- 2.点击事件
--   点击卡包选择，点击土地进行种植，点击阳光收获
--   点击阳光与土地会有重叠，所以会有优先级判断，可能有图层概念会更好
-- 3.定时器的书写，deltatime（帧频）以及闭包使用
--  植物种植，以及定时发射。太阳豆定时产生，以及植物产生太阳豆
--  僵尸随机出现在土地上
-- 4.collide 物体碰撞，子弹与僵尸，僵尸与植物，僵尸与左边界
-- 5.画面控制
-- 6.优化，添加关卡声音以及僵尸等等
--

function love.load()
    Object = require "classic"
    require "type"
    require "slot"
    require "field"
    require "plant"
    require "bullet"
    require "timer"
    require "zombie"
    --初始化金额
    balance = 100

    --加载卡槽
    plant_slot = slot_initial()
    field_x = 20
    field_y = 230

    --加载土地
    field_list = field_initial()

    --子弹
    bullets = {}

    --定时器
    timers = {}

    --僵尸
    zombies = {}

    --初始化：定时释放僵尸
    initial()

    --窗口大小
    screen_x =love.graphics.getWidth()

    --游戏状态 0 1 2 未开始 进行中 暂停 失败 结束
    game_state = 0

    --sun bean 太阳

end

function initial()
    table.insert(timers,Timer(3,function() local rd = math.random(1,4) table.insert(zombies,Zombie(love.graphics.getWidth(),230+(rd-1)*80)) end))
end

function love.draw()
    love.graphics.print("Balance: "..balance,20,150)
    slot_draw(plant_slot,20,30)
    field_draw(20,230,660,320,field_list)
    for k,v in ipairs(bullets) do
        bullets[k]:draw()
    end
    for k,v in ipairs(zombies) do
        zombies[k]:draw()
    end
end

function love.update(dt)

    for i, v in ipairs(timers) do
        timers[i]:update(dt)
    end

    for i,v in ipairs(bullets) do
        if bullets[i].x>screen_x then
            bullets[i]:update(dt)
        end

        if(not check_collision(i)) then
            bullets[i]:update(dt)
        end
    end

    for i,v in ipairs(zombies) do
        if zombies[i].hp<0 then
            table.remove(zombies,i)
            return
        end
        zombies[i]:update(dt)
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

    -- -1 界面之外
    else
        return -1
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
    elseif (state==-1) then
        for k,v in ipairs(plant_slot) do
            plant_slot[k].isChoosed = false
        end
    end
end

function seed_plant(x,y)
    local index_chosen = nil

    for k,v in ipairs(plant_slot) do
        if(plant_slot[k].isChoosed) then index_chosen = k end
    end

    if not buy(index_chosen) then
        return
    end

    local seed_x = math.floor((x-20)/80)+1
    local seed_y = math.floor((y-230)/80)+1
    if(index_chosen ~=nil) then 
        -- msg = "seed x:" ..(seed_x-1)*80 .."send y:"..230+(seed_y-1)*80
        local temp_plant = create_plant(index_chosen,20+(seed_x-1)*80,230+(seed_y-1)*80)
        field_list[seed_x][seed_y].plant = temp_plant 
        -- Timer.during(2,function() table.insert(bullets,Bullet((seed_x-1)*80+10,230+(seed_y-1)*80+30)) end)
        local timer = Timer(2,function() table.insert(bullets,Bullet(20+(seed_x-1)*80+100,260+(seed_y-1)*80))end)
        table.insert(timers,timer)
    end 
end

function create_plant(type_index,x,y)
    return Plant(plant_slot[type_index].image,x,y)
end

function check_collision(i)
    for k, v in ipairs(zombies) do
        if (bullets[i].x>=zombies[k].x and bullets[i].y<=zombies[k].y+80 and bullets[i].y>=zombies[k].y) then
            zombies[k].hp=zombies[k].hp-bullets[i].attack
            table.remove(bullets,i)
            return true
        end
    end
    return false
end

function buy(index)
    if balance>=plant_slot[index].cost then
        balance = balance-plant_slot[index].cost
        return true
    end 
    return false
end