Entity = Class('Entity') -- Entity is our class name

function Entity:initialize(x, y, startFrame, endFrame, spriteRow, spriteWidth, spriteHeight, animationDuration)
	self.position = {
		x = x,
		y = y
	}

	self.spriteWidth = spriteWidth
	self.spriteHeight = spriteHeight
	
	self.animation = Anim8.newAnimation(AnimationGrid(tostring(startFrame) .. '-' .. tostring(endFrame), spriteRow), animationDuration)
end

function Entity:update(dt)
	self.animation:update(dt)
end

function Entity:draw()
	-- not using box2d so might not have to offset
	--love.graphics.draw(TileSheet, self.spriteQuad, self.position.x - self.spriteWidth/2, self.position.y - self.spriteHeight /2)
	--love.graphics.draw(TileSheet, self.spriteQuad, self.position.x, self.position.y)
	self.animation:draw(TileSheet, self.position.x, self.position.y)
end
