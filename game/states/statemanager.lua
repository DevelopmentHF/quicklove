StateManager = Class('StateManager')

function StateManager:initialize()
    self.currentState = nil
end

function StateManager:switch(newState)
    if self.currentState then
        self.currentState:exit()
    end
    self.currentState = newState
    self.currentState:enter()
end

function StateManager:update(dt)
    if self.currentState then
        self.currentState:update(dt)
    end
end

function StateManager:draw()
    if self.currentState then
        self.currentState:draw()
    end
end


