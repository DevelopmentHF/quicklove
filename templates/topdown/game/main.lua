Class = require 'middleclass'
require("entity")
require("ui.button")

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

	-- example button setup
	UIElements = {}
	local exampleButton = Button:new(240, 240, "Button Name", 10)
	table.insert(UIElements, exampleButton)

	-- background
	Bg = love.graphics.newImage("assets/bg.png")
end

function love.update(dt)
	-- update all entities
	for index, value in ipairs(Entities) do
		value:update(dt)
	end

	-- update all ui elements
	for index, value in ipairs(UIElements) do
		value:update(dt)
	end
end

function love.draw()
	love.graphics.push()
	love.graphics.scale(ScalingFactor, ScalingFactor)
	
	love.graphics.draw(Bg)

	-- draw all entities
	for index, value in ipairs(Entities) do
		value:draw()
	end

	love.graphics.pop()

	-- draw all ui elements last!
	for index, value in ipairs(UIElements) do
		value:draw()
	end
end
