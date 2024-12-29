--- bouncing ball demonstration
-- @classmod bounce_demo
-- requires ballgame
local ball = require('src.ballgame.ball')
local foursquare = require('src.bounce_demo.foursquare')
local rectangle = require('src.ballgame.ball')

local bounce_demo = {}

-- class table
local BounceDemo = {
  ball = 'ball',
  bounds = 'rectangle',
}

-- constructor
function BounceDemo:BounceDemo()
  self.ball = ball.new{x = self.width / 3, y = self.height / 4, radius = 12}
  self.ball.color = {0.00, 0.00, 1.00}
  self.ball:accelerate(150, 230)
  self.bounds = foursquare.new{width = self.width, height = self.height}
end

function BounceDemo:draw()
  self.bounds:draw()
  self.ball:draw()
end

function BounceDemo:mousepressed(x, y)end
function BounceDemo:mousereleased(x, y) end
function BounceDemo:mousemoved(x, y) end

function BounceDemo:update(dt)
  self.ball:move(dt, self.bounds)
end

function bounce_demo.extend(self)
  setmetatable(self, { __index = BounceDemo })
  return self
end

function bounce_demo.new(o)
  local self = o or {}
  setmetatable(self, { __index = BounceDemo })
  self:BounceDemo()
  return self
end

return bounce_demo
