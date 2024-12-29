--- four-walled shape for ball physics
-- @classmod ballgame.boundary
local rectangle = require('src.ballgame.rectangle')

local boundary = {}

-- class table
local Boundary = rectangle.new{}

function Boundary:Boundary()
  self.left = self.x
  self.top = self.y
  self.right = self.x + self.width
  self.bottom = self.y + self.height
end

function boundary.new(o)
  local self = o or {}
  setmetatable(self, { __index = Boundary })
  self:Boundary()
  return self
end

return boundary
