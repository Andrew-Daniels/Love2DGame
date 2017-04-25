Enemy = Object:extend()

function Enemy:new(x, y, speed)
  self.image = love.graphics.newImage("Character2.png")
  self.x = x
  self.y = y
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.speed = speed
  enemyCount = 0
  goDown = true
  goUp = false

end


--[[
function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
end

function lerp(a, b, t)
  return a + (b - a) * t
end
]]--

function Enemy:update(dt)
  self.x = self.x + self.speed * dt
  
  --[[ if goDown == true then
    enemyCount = enemyCount - enemySpeed;
    if enemyCount <= 0 then
      goUp = true;
      goDown = false;
    end
  elseif goUp == true then
    enemyCount = enemyCount + enemySpeed;
    if enemyCount >= 1 then
      goUp = false;
      goDown = true;
    end
  end
  
  self.x = lerp(xAxisStart, xAxisEnd, enemyCount);
  
  ]]--
  
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  
  if self.x < 0 then
    self.x = 0
    self.speed = -self.speed
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
    self.speed = -self.speed
  end
  
  
  
end

function Enemy:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
