AnimatedText = Class("AnimatedText")

function AnimatedText:initialize(x, y, content, font, amplitude, frequency)
    self.x = x - font:getWidth(content)/2
    self.y = y
    self.content = content
    self.font = font
    self.amplitude = amplitude
    self.frequency = frequency
    self.time = 0
end

function AnimatedText:update(dt)
    self.time = self.time + dt
end

function AnimatedText:draw()
    love.graphics.setFont(self.font)
    local spacing = self.font:getWidth("")

    for i = 1, #self.content do
        local char = self.content:sub(i, i)
        local charWidth = self.font:getWidth(char)
        local offset = math.sin(self.time * self.frequency + i * 0.5) * self.amplitude
        love.graphics.print(char, self.x + (i - 1) * charWidth + (i - 1) * spacing, self.y + offset)
    end
end
