Projectile = Object:extend()

function Projectile:new()
	self.x = 0
	self.y = 0
	self.width = 0
	self.height = 0
end

function Projectile:update(dt)

end

function Projectile:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end