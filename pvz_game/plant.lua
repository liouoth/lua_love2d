Plant = Object:extend()

function Plant:new(image,func)
    self.func = func
    self.image = image
end

function Plant:exec()
    self.func()
end