function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	love.window.setMode(1280,720)
	
	Object = require "classic"
	require "player"
	require "enemy" 
	require "projectile"
	
	enemy = Enemy(25, 5, 5, 30, 100, 0.04)
	enemyTwo = Enemy(50, 5, 5, 50, 70, 0.01)
	player = Player(5, 5, 100, 20, 20)
	projectile = Projectile()
	
	
end

function love.update(dt)
	player:update(dt)
	enemyTwo:update(dt)
	enemy:update(dt)
	projectile:update(dt)
end

function love.draw()
	player:draw()
	enemyTwo:draw()
	enemy:draw()
	projectile:draw()
end