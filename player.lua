Player = Object:extend()


function Player:new()
  self.image = love.graphics.newImage("Character1.png")
  self.x = 5
  self.y = 5
  self.speed = 200
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Player:update(dt)
  if love.keyboard.isDown("a") then
    self.x = self.x - (self.speed * dt)
  end
  if love.keyboard.isDown("d") then
    self.x = self.x + (self.speed * dt)
  end
  if love.keyboard.isDown("w") then
    self.y = self.y - (self.speed * dt)
  end
  if love.keyboard.isDown("s") then
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

end

function Player:keyPressed(key)
  if key == "space" then
    table.insert(listOfProjectiles, Projectile(self.x, self.y))
  end
end


function Player:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
