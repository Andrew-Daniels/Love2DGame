Projectile = Object:extend()

function Projectile:new()
	self.x = 0
	self.y = 0
	self.width = 5
	self.height = 5
	self.currentPos = 0
	self.lastPos = 0
	self.distTravelled = 200
	self.maxDist = 200
	self.projectileList = {}
	self.expired = false
	projectileCount = 0
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function Projectile:update(dt)

	if projectile.x > 0 and projectile.y > 0 then
		if projectileCount <= 0 then
			projectileCount = projectileCount + 0.1;
		end
			projectile.x = lerp(projectile.x, player.x + self.maxDist, projectileCount)
	end
	
	

end

function Projectile:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end