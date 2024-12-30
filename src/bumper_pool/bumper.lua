--- circular obstacle for bumper pool table
-- @classmod bumper
-- requires ballgame
local ball = require('src.ballgame.ball')

local bumper = {}

-- class table
local Bumper = ball.new{}

function Bumper:draw()
  love.graphics.draw(
    self.texture, self.quad,
    self.x, self.y, 0, 0, 0,
    self.ox, self.oy
  )
end

function bumper.new(o)
  local self = o or {}
  setmetatable(self, { __index = Bumper })
  return self
end

return bumper
