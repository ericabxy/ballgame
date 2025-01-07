--- circle shape that repels ball momentum
-- @classmod ballgame.hill
local circle = require('src.ballgame.circle')
local color = require('src.ballgame.color')
local vector = require('src.ballgame.vector')

local hill = {}

-- class table
local Hill = circle.new{
  radius = 30
}

function Hole:influence(ball)
  local dist_in = self.radius - ball.radius
  local hb_dist = vector.distance(self.x, self.y, ball.x, ball.y)
  if hb_dist < self.radius and hb_dist > dist_in then
    local x, y = vector.normalize(self.x - ball.x, self.y - ball.y)
    ball.dx = ball.dx - x * 10
    ball.dy = ball.dy - y * 10
  elseif hb_dist < dist_in then
  end
end

function Hill:paint()
  love.graphics.setColor(self.color)
  love.graphics.circle('fill', self.x, self.y, self.radius)
  love.graphics.setColor(self.color + 8)
  love.graphics.circle('fill', self.x, self.y, self.radius / 2)
end

function hill.new(o)
  local self = o or {}
  setmetatable(self, { __index = Hill })
  return self
end

return hill
