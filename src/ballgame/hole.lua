--- circle shape that affects ball momentum
-- @classmod ballgame.hole
local circle = require('src.ballgame.circle')
local color = require('src.ballgame.color')
local vector = require('src.ballgame.vector')

local hole = {}

-- class table
local Hole = circle.new{
  radius = 15
}

function Hole:draw()
  love.graphics.setColor(color.black)
  love.graphics.circle('fill', self.x, self.y, self.radius)
end

function Hole:influence(ball)
  local dist_in = self.radius - ball.radius
  local hb_dist = vector.distance(self.x, self.y, ball.x, ball.y)
  if hb_dist < self.radius and hb_dist > dist_in then
    local x, y = vector.normalize(self.x - ball.x, self.y - ball.y)
    ball.dx = ball.dx + x * 10
    ball.dy = ball.dy + y * 10
  elseif hb_dist < dist_in then
    if vector.length(ball.dx, ball.dy) < self.radius * 10 then
      ball.sunk = true
    end
  end
  if ball.sunk and hb_dist > dist_in then
    local x, y = self.x - ball.x, self.y - ball.y
    --push toward center
    local mag = ( hb_dist - dist_in ) / hb_dist
    x, y = vector.scale(x, y, mag)
    ball.dx = ball.dx + x
    ball.dy = ball.dy + y
    --bounce off the walls
    x, y = self.x - ball.x, self.y - ball.y
    local mag = vector.length(x, y) - dist_in
    x, y = vector.normalize(x, y)
    x, y = vector.scale(x, y, mag)
    ball.x = ball.x + x
    ball.y = ball.y + y
  end
end

function hole.new(o)
  local self = o or {}
  setmetatable(self, { __index = Hole })
  return self
end

return hole
