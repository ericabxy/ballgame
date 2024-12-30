--- straight-edged obstacle for cue sports
-- @classmod cushion
-- requires ballgame
local rectangle = require('src.ballgame.rectangle')

local cushion = {}

-- class table
local Cushion = rectangle.new{}

function Cushion:draw()
  love.graphics.draw(
    self.texture, self.quad,
    self.x, self.y, 0, 0, 0,
    self.ox, self.oy
  )
end

function cushion.new(o)
  local self = o or {}
  setmetatable(self, { __index = Cushion })
  return self
end

return cushion
