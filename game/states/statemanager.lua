StateManager = Class('StateManager')

function StateManager:initialize(initState)
    self.currentState = initState
    self.nextState = nil
    self.currentLevel = 1
    self.maxLevel = 3
    self.transitionTime = 0.5  -- Duration of the transition (in seconds)
    self.transitionAlpha = 0  -- The current alpha value for the transition
    self.transitioning = false  -- Flag to track whether a transition is happening
end

-- Switch to the next level, or end the game if we've passed the max level
function StateManager:switchToNextLevel()
    if self.currentLevel + 1 > self.maxLevel then
        GameOverFlag = true
        self:switch(EndState:new())
		self.currentLevel = 1
    else
        self.currentLevel = self.currentLevel + 1
        self:switch(LevelState:new(self.currentLevel))
    end
end

-- Switch to a new state (with transition)
function StateManager:switch(newState)
    if self.currentState then
        self.currentState:exit()
    end

    -- Set the next state and start the transition
    self.nextState = newState
    self.transitionAlpha = 0  -- Start with no fade
    self.transitioning = true
end

-- Update the state, handle transition
function StateManager:update(dt)
    if self.transitioning then
        -- Update the transition alpha value (fade in/out)
        self.transitionAlpha = self.transitionAlpha + dt / self.transitionTime

        -- If transition is done, switch to the next state
        if self.transitionAlpha >= 1 then
            -- Finish the transition
            self.transitioning = false
            -- Set the new state after transition
			--if self.nextState.number == 2 then return end
            self.currentState = self.nextState
            self.currentState:enter()  -- Enter the new state
        end
    else
        if self.currentState then
            self.currentState:update(dt)
        end
    end
end

-- Draw the current state, handle transition overlay
function StateManager:draw()
    if self.currentState then
        self.currentState:draw()
    end

    -- If transitioning, draw the transition effect (e.g., a black screen that fades)
    if self.transitioning then
        love.graphics.setColor(0, 0, 0, self.transitionAlpha)  -- Set the transition color (black)
        love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())  -- Draw a rectangle to cover the screen
	else
		love.graphics.setColor(1, 1, 1, 1)
    end
end
