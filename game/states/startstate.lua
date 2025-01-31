require("states.levelstate")
require("states.state")

StartState = Class('StartState', State)

-- TODO: Make this a singleton
function StartState:enter()
    -- Initialize any data for the start state
end

function StartState:update(dt)
    -- Press any key to start the game
    if love.keyboard.isDown("space") then
        stateManager:switch(LevelState:new(1))
    end
end

function StartState:draw()
	love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)

    love.graphics.draw(Bg)


	love.graphics.setColor(0, 0, 1, 1)
	love.graphics.pop()

    love.graphics.printf("quicklove", BigFont, 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
    love.graphics.printf("Press [Space] to Start", Font, 0, love.graphics.getHeight() - (love.graphics.getHeight() / 4), love.graphics.getWidth(), "center")

end
