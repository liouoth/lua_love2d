-- 植物种类卡槽

Type = Object:extend()

function Type:new(index,name,image,cost)
    self.index=index
    self.name=name
    self.image=image
    self.isChoosed = false
    self.cost=cost
end