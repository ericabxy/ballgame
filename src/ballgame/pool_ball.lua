--- ball with accurate ball-to-ball collision physics
-- @classmod ballgame.pool_ball
local ball = require('src.ballgame.ball')
local vector = require('src.ballgame.vector')

local pool_ball = {}

-- class table
local PoolBall = ball.new{
  radius = 8,
}

function PoolBall:bounce_edge(t, horizontal, vertical)
  if t == horizontal then
    self.dx = -self.dx
  end
  if t == vertical then
    self.dy = -self.dy
  end
end

-- No shadow, but darken when sunk
function PoolBall:paint()
  love.graphics.setColor(self.sunk and self.color - 8 or self.color)
  love.graphics.circle('fill', self.x, self.y, self.radius) 
end

-- Transfer momentum from self to ball, assuming they are in collision.
-- This state should be determined by calling intercept_ball first.
-- @param ballgame.ball
function PoolBall:strike_ball(ball)
  -- set frame of reference: ball stationary, self moving
  self.dx, self.dy = self.dx - ball.dx, self.dy - ball.dy
  -- magnitude of collision velocity
  local mv = vector.length(self.dx, self.dy)
  -- axis of collision as unit vector
  local vec_x, vec_y = vector.normalize(self.x - ball.x, self.y - ball.y)
  -- velocity of collision as unit vector
  local vel_x, vel_y = vector.normalize(self.dx, self.dy)
  -- cosine of difference between axis and velocity
  local cos = vector.dot(vel_x, vel_y, vec_x, vec_y)
  -- calculate amount of momentum to transfer along axis
  vec_x, vec_y = vector.scale(vec_x, vec_y, cos * mv)
  -- subtract momentum from self
  self.dx, self.dy = self.dx - vec_x, self.dy - vec_y
  -- restore frame of reference:
  self.dx, self.dy = self.dx + ball.dx, self.dy + ball.dy
  -- transfer momentum to ball
  ball.dx, ball.dy = ball.dx + vec_x, ball.dy + vec_y
end

function PoolBall:time_to_intercept_ball(ball)
  local d = self.radius + ball.radius
  local ddx = self.dx - ball.dx
  local ddy = self.dy - ball.dy
  local dx = self.x - ball.x
  local dy = self.y - ball.y
  local a = ddx * ddx + ddy * ddy
  local b = 2 * (dx * ddx + dy * ddy)
  local c = dx * dx + dy * dy - d * d
  return (-b - math.sqrt( b * b - 4 * a * c )) / (2 * a)
end

function PoolBall:time_to_intercept_edge(bounds)
  local horizontal = (bounds.width + bounds.x - self.x - self.radius) / self.dx
  local vertical = (bounds.height + bounds.y - self.y - self.radius) / self.dy
  if self.dx < 0 then
    horizontal = (bounds.x - self.x + self.radius) / self.dx
  end
  if self.dy < 0 then
    vertical = (bounds.y - self.y + self.radius) / self.dy
  end
  return math.min(horizontal, vertical), horizontal, vertical
end

function pool_ball.new(o)
  local self = o or {}
  setmetatable(self, { __index = PoolBall })
  return self
end

return pool_ball
