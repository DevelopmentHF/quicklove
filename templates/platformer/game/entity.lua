Entity = Class('Entity') -- Entity is our class name

function Entity:initialize(x, y, spriteRow, spriteCol, spriteWidth, spriteHeight)
	self.position = {
		x = x,
		y = y
	}

	self.spriteWidth = spriteWidth
	self.spriteHeight = spriteHeight

	self.spriteQuad = love.graphics.newQuad(
		spriteRow * TileWidth,
		spriteCol * TileHeight,
		TileWidth, TileHeight,
		TileSheet:getDimensions()
	)

end

function Entity:update(dt)
end

function Entity:draw()
	love.graphics.draw(TileSheet, self.spriteQuad, self.position.x - self.spriteWidth/2, self.position.y - self.spriteHeight /2)
end
