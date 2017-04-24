local Vector = require("Vector");

function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	love.window.setMode(1280,720)
	
	Object = require "classic"
	require "player"
	require "enemy" 
	require "projectile"
	
	local x, y, width, height = 95, 75, 25, 25;
	local x2, y2 = 300, 400;
	local endPos1 = Vector:new(30, 100);
	local endPos2 = Vector:new(50, 200);
	local speed1, speed2 = 0.04, 0.01;
	enemy = Enemy(x, y, width, height, endPos1, speed1);
	-- enemyTwo = Enemy(x2, y2, width, height, endPos2, speed2);
	player = Player(5, 5, 100, 20, 20)
end

function love.update(dt)
	player:update(dt)
	-- enemyTwo:update(dt)
	enemy:update(dt)
end

function love.draw()
	player:draw()
	-- enemyTwo:draw()
	enemy:draw()
end