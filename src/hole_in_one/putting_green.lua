--- colored surface for golfing
-- @classmod hole_in_one.putting_green
-- requires ballgame
local boundary = require('src.ballgame.boundary')
local color = require('src.ballgame.color')

local putting_green = {}

-- class table
local PuttingGreen = boundary.new{
  friction = 0.80,
}

function PuttingGreen:draw()
  love.graphics.setColor(color.green)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.setColor(color.light_green)
  local x, y = self:center()
  love.graphics.ellipse('fill', x, y, self.width / 2.50, self.height / 2.50)
end

function putting_green.new(o)
  local self = o or {}
  setmetatable(self, { __index = PuttingGreen })
  return self
end

return putting_green
