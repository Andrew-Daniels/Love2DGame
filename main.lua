function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  love.window.setMode(1280, 720)
  
  Object = require "classic"
  require "player"
  require "enemy"
  require "projectile"
  
  player = Player()
  enemy = Enemy(5, 5, 300)
  listOfProjectiles = {}
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
  
  for i,v in ipairs(listOfProjectiles) do
    v:update(dt)
  end
  
end

function love.draw()
  player:draw()
  enemy:draw()
  
  for i,v in ipairs(listOfProjectiles) do
    v:draw()
  end
  
end

function love.keypressed(key)
  player:keyPressed(key)
end
