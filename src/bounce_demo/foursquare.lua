--- checkered background for demonstration
-- @classmod bounce_demo.foursquare
-- requires ballgame
local boundary = require('src.ballgame.boundary')

local foursquare = {}

-- class table
local Foursquare = boundary.new{}

function Foursquare:draw()
  love.graphics.setColor(lutro and {192, 192, 192} or {0.75, 0.75, 0.75})
  love.graphics.rectangle('fill', self.x, self.y, self.width / 2, self.height / 2)
  love.graphics.rectangle('fill', self.width / 2, self.height / 2, self.width / 2, self.height / 2)
  love.graphics.setColor(lutro and {255, 255, 255} or {1.00, 1.00, 1.00})
  love.graphics.rectangle('fill', self.x, self.height / 2, self.width / 2, self.height / 2)
  love.graphics.rectangle('fill', self.width / 2, self.y, self.width / 2, self.height / 2)
end

function foursquare.new(o)
  local self = o or {}
  setmetatable(self, { __index = Foursquare })
  return self
end

return foursquare
