local class = require 'middleclass'
require("entity")

function love.load()
	-- load up sprite stuff -> globals 
	TileWidth = 8
	TileHeight = 8
	TileSheet = love.graphics.newImage("assets/spritesheet.png")
	TileSheet:setFilter("nearest", "nearest") -- pixel perfect
	ScalingFactor = 4 -- how much bigger do we actually want to see stuff

	-- example entity setup
	Entities = {}
	local exampleEntity = Entity:new(12, 12, 6, 1, 8, 8)
	table.insert(Entities, exampleEntity)

	-- background
	Bg = love.graphics.newImage("assets/bg.png")
end

function love.update(dt)
	for index, value in ipairs(Entities) do
		value:update(dt)
	end	
end

function love.draw()
	love.graphics.push()
	love.graphics.scale(ScalingFactor, ScalingFactor)
	
	love.graphics.draw(Bg)
	for index, value in ipairs(Entities) do
		value:draw()
	end
	love.graphics.pop()
end
