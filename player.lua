local GameObject = require("GameObject");

Player = GameObject:extend();

function Player:new(xaxis, yaxis, speed, width, height)
	Player.super.new(self, xaxis, yaxis, width, height);
	self.speed = speed
	self.health = 100
	playerCount = 0
	shooting = false
end

function love.keypressed(key)
	if key == "f" then
		shooting = true
	end
end

function Player:update(dt)
	print("Player:", self.position.x, self.position.y);
	if shooting == true then
		if playerCount <= 0 then
		--[[
			playerCount = playerCount + 0.01
			projectile.x = lerp(player.x + 50, player.x + 100, playerCount)
			projectile.y = player.y + 7
			projectile.width = 5
			projectile.height = 5
		--]]
		elseif playerCount >= 1 then
		--[[
			playerCount = playerCount - 0.01
			projectile.x = lerp(player.x + 50, player.x + 100, playerCount)
			projectile.y = player.y + 7
			projectile.width = 5
			projectile.height = 5
		--]]
		end
			

		
	end

	if love.keyboard.isDown('a') then
		self.position.x = self.position.x - (self.speed * dt)
	end
	if love.keyboard.isDown('d') then
		self.position.x = self.position.x + (self.speed * dt)
	end
	if love.keyboard.isDown('w') then
		self.position.y = self.position.y - (self.speed * dt)
	end
	if love.keyboard.isDown('s') then
		self.position.y = self.position.y + (self.speed * dt)
	end
	
	local window_width = love.graphics.getWidth()
	local window_height = love.graphics.getHeight()
	
	if self.position.x < 0 then
		self.position.x = 0
	elseif self.position.x + self.width > window_width then
		self.position.x = window_width - self.width
	elseif self.position.y < 0 then
		self.position.y = 0
	elseif self.position.y + self.height > window_height then
		self.position.y = window_height - self.height
	end
	
	if self.health <= 0 then
		self.position.x = 0
		self.position.y = 0
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
end