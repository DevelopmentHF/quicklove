EndState = Class('GameOverState', State)

function EndState:enter()
	State.enter(self)
end

function EndState:update(dt)
    -- Restart the game by pressing space
    if love.keyboard.isDown("space") then
		GameOverFlag = false
        stateManager:switch(LevelState:new())
	elseif GameOverFlag and love.keyboard.isDown("q") then
		print("Return to menu")
		GameOverFlag = false
    	stateManager:switch(StartState:new())
    end
end

function EndState:draw()
	love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)

    love.graphics.setColor(0.1, 0.1, 0.5, 0.7)
    love.graphics.draw(Bg)
	love.graphics.pop()

	love.graphics.setColor(1,1,1,1)
	if GameOverFlag then
    	love.graphics.printf("Game over!", BigFont, 0, love.graphics.getHeight() / 5, love.graphics.getWidth(), "center")
    	love.graphics.printf("Press [Space] to restart or\n[Q] to return to the main menu", Font, 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
	else
	end
end

function EndState:exit()

end

