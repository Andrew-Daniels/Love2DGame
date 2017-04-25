Player = Object:extend()

function Player:new(xaxis, yaxis, speed, width, height)
	self.x = xaxis
	self.y = yaxis
	self.speed = speed
	self.width = width
	self.height = height
	self.health = 100
	playerCount = 0
	
	
end

function CheckCollision(x1,y1,w1,h1,x2,y2,w2,h2)
	return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
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
		
	if CheckCollision(player.x, player.y, player.width, player.height, enemy.x, enemy.y, enemy.width, enemy.height) then
		if player.x < enemy.x and (enemy.x == player.x + player.width) then 
			player.x = player.x - 5;
		end
		
		if player.x > enemy.x and (enemy.x == player.x - enemy.width) then
			player.x = player.x + 5;
		end
		
		if player.y > enemy.y and (enemy.y == player.y - enemy.height) then
			player.y = player.y - 5;
		end
		
		if player.y < enemy.y and (enemy.y == player.y + player.height) then
			player.y = player.y - 5;
		end 
	end		


	if love.keyboard.isDown('a') then
		self.x = self.x - (self.speed * dt)
	end
	if love.keyboard.isDown('d') then
		self.x = self.x + (self.speed * dt)
	end
	if love.keyboard.isDown('w') then
		self.y = self.y - (self.speed * dt)
	end
	if love.keyboard.isDown('s') then
		self.y = self.y + (self.speed * dt)
	end
	
	local window_width = love.graphics.getWidth()
	local window_height = love.graphics.getHeight()
	
	if self.x < 0 then
		self.x = 0
	elseif self.x + self.width > window_width then
		self.x = window_width - self.width
	elseif self.y < 0 then
		self.y = 0
	elseif self.y + self.height > window_height then
		self.y = window_height - self.height
	end
	
	if self.health <= 0 then
		player.x = 0
		player.y = 0
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end