local bump = require("bump");

-- Constants
local PHYSICS_CELL_SIZE = 64;	-- default

world = bump.newWorld(PHYSICS_CELL_SIZE);	-- TODO: Move into separate file and localise!

function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	love.window.setMode(1280,720)
	
	Object = require "classic"
	require "player"
	require "enemy" 
	require "projectile"
	
	enemy = Enemy(250, 25, 25, 30, 500, 0.02)	-- (yaxis, width, height, startXAxis, endXAxis, speed)
	enemyTwo = Enemy(280, 25, 25, 50, 700, 0.01)
	player = Player(5, 5, 100, 20, 20)
	-- projectile = Projectile()
	
	
end

function love.update(dt)
	player:update(dt)
	enemyTwo:update(dt)
	enemy:update(dt)
	-- projectile:update(dt)
end

function love.draw()
	player:draw()
	enemyTwo:draw()
	enemy:draw()
	-- projectile:draw()
end