local GameObject = require("GameObject");

Enemy = GameObject:extend();

function Enemy:new(xaxis, yaxis, width, height, endPosition, speed)
	Enemy.super.new(self, xaxis, yaxis, width, height);
	self.counter = 0; -- Used for lerping position.
	self.endPosition = endPosition;
	self.speed = speed;
end

function Enemy:update(dt)
	-- print(self.position.x, self.position.y);
	if (self.counter >= 1) then
		self.counter = 0;
	else
		self.counter = self.counter + self.speed;
	end
	self.position = self.position:lerp(self.endPosition, self.counter);
end

function Enemy:draw()
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
end