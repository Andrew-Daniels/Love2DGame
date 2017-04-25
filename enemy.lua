Enemy = Object:extend()

function Enemy:new(yaxis, width, height, startXAxis, endXAxis, speed)
	self.x = 5
	self.y = yaxis
	self.width = width
	self.height = height
	goDown = true
	goUp = false
	xAxisStart = startXAxis
	xAxisEnd = endXAxis
	enemySpeed = speed
	enemyCount = 0
	world:add(self, self.x, self.y, self.width, self.height);	-- Refactor me.
end

function CheckCollision(x1,y1,w1,h1,x2,y2,w2,h2)
	return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
end


function lerp(a, b, t)
	return a + (b - a) * t
end
		

function Enemy:update(dt)



	if goDown == true then
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
	

	self.x, self.y = world:move(self, lerp(xAxisStart, xAxisEnd, enemyCount), self.y);
	
end

function Enemy:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end