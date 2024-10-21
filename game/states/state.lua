Class = require 'utils.middleclass'

State = Class('State')

function State:initialize() end
function State:enter() end -- called when entering the state
function State:exit() end -- called when exiting the state
function State:update(dt) end
function State:draw() end
