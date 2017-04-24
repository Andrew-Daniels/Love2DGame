local GameObject = require("GameObject");

Projectile = GameObject:extend();

function Projectile:new(x, y, width, height)
	Projectile.super.new(self, x, y, width, height);
end

function Projectile:update(dt)

end

function Projectile:draw()
	love.graphics.rectangle("line", self.position.x, self.positiony, self.width, self.height)
end