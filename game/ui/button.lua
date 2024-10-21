Button = Class('Button') -- Entity is our class name
    
local font = love.graphics.getFont() -- Get the current font

function Button:initialize(x, y, text, padding)
	self.position = {
		x = x,
		y = y
	}

	self.padding = padding

	self.label = text or "Button"

	self.width = font:getWidth(self.label) + 2 * self.padding
    self.height = font:getHeight() + 2 * self.padding

	self.isClicked = false

end

-- Check if mouse is over the button
function Button:isMouseOver()
    local mouseX, mouseY = love.mouse.getPosition()
    return mouseX >= self.position.x and mouseX <= (self.position.x + self.width)
       and mouseY >= self.position.y and mouseY <= (self.position.y + self.height)
end

function Button:onClick()
    print("Button clicked!")
    self.isClicked = true
end

-- Update the button state, check if clicked
function Button:update(dt)
    if love.mouse.isDown(1) and self:isMouseOver() then  -- Mouse button 1 is left click
        if not self.isClicked then  -- Only trigger once per click
            self:onClick()
        end
    else
        self.isClicked = false -- Reset click state 
    end
end

function Button:draw()
	-- Set the color based on whether the mouse is over the button
    if self:isMouseOver() then
        love.graphics.setColor(0.8, 0.8, 0.8) -- gray when hovering
    else
        love.graphics.setColor(1, 1, 1) -- White when not hovering
    end

    love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)

    love.graphics.setColor(0, 0, 0)

    local textWidth = font:getWidth(self.label)
    local textHeight = font:getHeight()
    
    local textX = self.position.x + (self.width - textWidth) / 2
    local textY = self.position.y + (self.height - textHeight) / 2
    love.graphics.printf(self.label, Font, textX, textY)

    love.graphics.setColor(1, 1, 1)
end
