Class = require 'utils.middleclass'
Anim8 = require 'utils.anim8'
require("states.statemanager")
require("states.startstate")

function love.load()
    TileWidth = 8
    TileHeight = 8
    TileSheet = love.graphics.newImage("assets/spritesheet.png")
    TileSheet:setFilter("nearest", "nearest")
    ScalingFactor = 4

    AnimationGrid = Anim8.newGrid(8, 8, TileSheet:getWidth(), TileSheet:getHeight())
	
	Font = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf")
	BigFont = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 24, "mono", 1)
	local cursor = love.mouse.newCursor("assets/cursor.png", 4, 4)
	love.mouse.setCursor(cursor)

	-- music
	local music = love.audio.newSource("assets/sfx/HerdingPidgeons.mp3", "stream")
	music:play()
	music:setLooping(true)
	music:setVolume(0.7)

    Entities = {}
    UIElements = {}

    -- Background
    Bg = love.graphics.newImage("assets/bg.png")
    Bg:setFilter("nearest", "nearest")

    -- Initialize the StateManager and switch to the start state
	GameOverFlag = false
    stateManager = StateManager:new()
    stateManager:switch(StartState:new())
end

function love.update(dt)
    stateManager:update(dt)
end

function love.draw()
    stateManager:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()  -- Close the game
    end
end
