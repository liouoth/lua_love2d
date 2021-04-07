Timer = Object:extend()

function Timer:new(time,func)
    self.time = time
    self.tick = time
    self.func = func
end


function Timer:update(dt)
    
end