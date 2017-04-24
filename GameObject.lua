local Object = require("classic");
local Vector = require("Vector");

local GameObject = Object:extend();

function GameObject:new(x, y, width, height)
	self.position = Vector:new(x, y);
	print("Created new gameobject at position: " .. self.position.x, self.position.y);
	self.width = width;
	self.height = height;
end

-- Checks collision of Gameobject against OtherObject.
function GameObject:checkCollision(OtherObject)
	return self.x < OtherObject.x + OtherObject.width and
	OtherObject.x < self.x + self.width and
	self.y < OtherObject.y + OtherObject.height and
	OtherObject.y < self.y + self.height;
end

function GameObject:update(diff)
end

function GameObject:draw()
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height);
end

return GameObject;
