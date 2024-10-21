require("states.endstate")

LevelState = Class('LevelState', State)


function LevelState:initialize(numMoons, duration)
	
end

function LevelState:enter()

end

function LevelState:update(dt)
    -- Switch to GameOverState if no blue moon remain
    if GameOverFlag then
        stateManager:switch(EndState:new())
    end
end


function LevelState:draw()
    love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)
   	
	-- use self.elapsedTime/self.duration to transition from night to day
    love.graphics.draw(Bg)

    -- Draw all entities
    for _, value in ipairs(Entities) do
        value:draw()
    end

    love.graphics.pop()
end

