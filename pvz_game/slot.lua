function slot_initial()
    local list = {}
    table.insert(list,Type(1,"1 shot","\n    =>  \n   / \\   \n  50"))
    table.insert(list,Type(2,"2 shot","\n   ==>  \n   /  \\   \n   100"))
    table.insert(list,Type(3,"3 shot","\n   ===>  \n   /   \\   \n   150"))
    table.insert(list,Type(4,"stone"," \n   /```\\ \n    \\___/\n     80"))
    table.insert(list,Type(5,"stone"," \n  ( O )\n    \\ | /  \n    30"))
    return list
end

function slot_draw(list,slot_x,slot_y)
    for k,v in ipairs(list) do
        love.graphics.rectangle(list[k].isChoosed and "fill" or "line",slot_x+(list[k].index-1)*80,slot_y,80,80)
        if(list[k].isChoosed) then love.graphics.setColor(0,0,0) end
        love.graphics.print(list[k].image,
            slot_x+(list[k].index-1)*80,slot_y)
        if(list[k].isChoosed) then love.graphics.setColor(1,1,1) end
    end
end