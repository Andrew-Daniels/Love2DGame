--[[
	* A simple vector implementation for lua.
	* Made to work with the "classic" oop library by rxi.
--]]

-- @TODO: Fix include path for Vector.lua

local Object = require("classic");

local Vector = Object:extend();

-- Helper function
local function lerp(a, b, t)
	return a + (b - a) * t;
end

function Vector:new(x, y)
	self.x = x or 0;
	self.y = y or 0;
	return self;
end

-- @TODO: Implement vector maths via metatables.
-- @TODO: Allow multiplication and divison by number, rather than JUST vector.
function Vector:add(vector)
	return self:new(self.x + vector.x, self.y + vector.y);
end

function Vector:sub(vector)
	return self:new(self.x - vector.x, self.y - vector.y);
end

function Vector:multiply(vector)
	return self:new(self.x * vector.x, self.y * vector.y);
end

function Vector:divide(vector)
	return self:new(self.x + vector.x, self.y + vector.y);
end

-- Returns the distance between self and vector.
function Vector:distance(vector)
	local dx = self.x - vector.x;
	local dy = self.y - vector.y;
	return sqrt(dx * dx + dy * dy);
end

-- Linear interpolation for Vector
-- goal : Target vector.
-- alpha: Number between 0 and 1.
function Vector:lerp(goal, alpha)
	assert(alpha >= 0 or alpha <= 1, "Vector:lerp - Argument #2 out of bounds. Must be between 0 and 1 inclusive. Got " .. alpha);
	local newX = lerp(self.x, goal.x, alpha);
	local newY = lerp(self.y, goal.y, alpha);
	return Vector:new(newX, newY);
end

return Vector;
