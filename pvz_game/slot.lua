function slot_initial()
    local list = {}
    table.insert(list,Type(1,"1 shot","   =>  \n   / \\   \n  50"))
    table.insert(list,Type(2,"2 shot","   ==>  \n   /  \\   \n   100"))
    table.insert(list,Type(3,"3 shot","   ===>  \n   /   \\   \n   150"))
    table.insert(list,Type(4,"stone","    /```\\ \n    \\___/\n     80"))
    table.insert(list,Type(5,"stone","   ( O )\n    \\ | /  \n    30"))
    return list
end

function slot_draw(list,slot_x,slot_y)
    for k,v in ipairs(list) do
        love.graphics.print(list[k].image,
            slot_x+(list[k].index-1)*80,slot_y)
    end
end