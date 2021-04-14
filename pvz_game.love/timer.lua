Timer = Object:extend()

function Timer:new(duration,func)
	self.duration = duration
	self.temp = duration
	self.func = func
end

function Timer:update(dt)
	if (self.temp-dt>0)then
		self.temp = self.temp-dt
	else
		self.func()
		self.temp = self.duration
	end
end