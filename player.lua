Player = Object:extend()

function Player:new(xaxis, yaxis, speed, width, height)
	self.x = xaxis
	self.y = yaxis
	self.speed = speed
	self.width = width
	self.height = height
	self.health = 100
	playerCount = 0
	world:add(self, self.x, self.y, self.width, self.height);	-- Refactor me.
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function love.keypressed(key)
		if key == "f" then
			projectile.x = player.x + 20
			projectile.y = player.y + 7
		end	
end

function Player:update(dt)
	local newX, newY = self.x, self.y;

	if love.keyboard.isDown('a') then
		newX = self.x - (self.speed * dt)
	end
	if love.keyboard.isDown('d') then
		newX = self.x + (self.speed * dt)
	end
	if love.keyboard.isDown('w') then
		newY = self.y - (self.speed * dt)
	end
	if love.keyboard.isDown('s') then
		newY = self.y + (self.speed * dt)
	end
	
	local window_width = love.graphics.getWidth()
	local window_height = love.graphics.getHeight()
	
	if self.health <= 0 then
		player.x = 0
		player.y = 0
	end

	self.x, self.y = world:move(self, newX, newY);
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end