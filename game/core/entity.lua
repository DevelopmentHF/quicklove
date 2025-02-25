require("core.animation")

Entity = Class('Entity')

function Entity:initialize(x, y, spriteWidth, spriteHeight, animations)
	self.x = x
	self.y = y

	self.spriteWidth = spriteWidth
	self.spriteHeight = spriteHeight

	self.animations = animations
	self.currentAnimation = self.animations["default"]
end

function Entity:swapAnimation(name)
	if self.animations[name] then
		print("swapping to " .. name .. " animation")
		self.currentAnimation = self.animations[name]
	else
		print("animation not found")
	end
end

function Entity:update(dt)
	self.currentAnimation:update(dt)
	
	-- swap back to default animation at end of non-looping animation
	if not self.currentAnimation.loop then
		self.currentAnimation.elapsed = self.currentAnimation.elapsed + dt
		if self.currentAnimation.elapsed > self.currentAnimation.totalDuration then
			print("swapping to default animation")
			self.currentAnimation.elapsed = 0
			self.currentAnimation = self.animations["default"]
		end
	end
end

function Entity:draw()
	self.currentAnimation:draw(self.x, self.y)
end
