Animation = Class("Animation")

function Animation:initialize(name, startFrame, endFrame, row, width, height, duration, loop)
	self.name = name or "default"

	self.startFrame = startFrame
	self.endFrame = endFrame
	self.row = row
	self.width = width
	self.height = height
	self.duration = duration
	self.loop = loop
	
	--print(name, startFrame, endFrame, row, width, height, duration, loop)
	self.animation = Anim8.newAnimation(AnimationGrid(tostring(startFrame) .. '-' .. tostring(endFrame), row), duration)


	self.totalDuration = self.duration * ((self.endFrame - self.startFrame) + 1)
	self.elapsed = 0
end

function Animation:update(dt)
	self.animation:update(dt)
end

function Animation:draw(x, y)
	self.animation:draw(TileSheet, x - self.width/2, y - self.height/2)
end
