require("states.endstate")

LevelState = Class('LevelState', State)


function LevelState:initialize()
	
end

function LevelState:enter()

end

function LevelState:update(dt)
	
	-- temp: just to switch states for templating purposes
	if love.keyboard.isDown("e") then
		GameOverFlag = true
	end

    -- Switch to GameOverState if no blue moon remain
    if GameOverFlag then
        stateManager:switch(EndState:new())
    end
end


function LevelState:draw()
    love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)
    love.graphics.draw(Bg)

    -- Draw all entities
    for _, value in ipairs(Entities) do
        value:draw()
    end
	
    love.graphics.pop()
	love.graphics.setColor(0.7, 1, 0.6, 1)
    love.graphics.printf("Press [E] to end the game ", Font, 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
	love.graphics.setColor(1, 1, 1, 1)

end

function LevelState:exit()

end

