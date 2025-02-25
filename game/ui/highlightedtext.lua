HighlightedText = Class("HighlightedText")

function HighlightedText:initialize(x, y, content, padding)
	self.content = content
	self.padding = padding

	self.x = x
	self.y = y
end

function HighlightedText:update(dt)

end

local function drawRoundedRectangle(mode, x, y, width, height, radius, segments)
    love.graphics.rectangle(mode, x + radius, y, width - 2 * radius, height)
    love.graphics.rectangle(mode, x, y + radius, width, height - 2 * radius)
    love.graphics.arc(mode, x + radius, y + radius, radius, math.pi, 1.5 * math.pi, segments)
    love.graphics.arc(mode, x + width - radius, y + radius, radius, 1.5 * math.pi, 2 * math.pi, segments)
    love.graphics.arc(mode, x + width - radius, y + height - radius, radius, 0, 0.5 * math.pi, segments)
    love.graphics.arc(mode, x + radius, y + height - radius, radius, 0.5 * math.pi, math.pi, segments)
end

function HighlightedText:draw()
	-- draw a box
	local font = BigFont
    local textWidth = font:getWidth(self.content)
    local textHeight = font:getHeight()
    local boxWidth = textWidth + self.padding * 2
    local boxHeight = textHeight + self.padding * 2
    local boxX = self.x - boxWidth / 2
    local boxY = self.y - self.padding

    --love.graphics.setColor(AlternateColours[stateManager.currentLevel])
    love.graphics.setColor(0, 0, 0)
    drawRoundedRectangle("line", boxX, boxY, boxWidth, boxHeight, 10, 10)
    love.graphics.setColor(0, 0, 0)

	-- draw the content
    love.graphics.printf(self.content, font, self.x - textWidth / 2, self.y, textWidth, "center")
	
end
