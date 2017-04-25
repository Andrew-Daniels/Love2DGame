Projectile = Object:extend()

function Projectile:new(x, y)
  self.image = love.graphics.newImage("bullet.png")
  self.x = x
  self.y = y
  self.speed = 700
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Projectile:update(dt)
  self.y = self.y - self.speed * dt
end


function Projectile:draw()
  love.graphics.draw(self.image, (self.x - self.width/2 + player.width/2), self.y)
end

