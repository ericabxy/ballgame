--- circle shape with momentum physics
-- @classmod ballgame.ball
local circle = require('src.ballgame.circle')
local vector = require('src.ballgame.vector')

local ball = {}

--- class table
local Ball = circle.new{
  radius = 12,
  dx = 0.00,
  dy = 0.00,
  color = lutro and {255, 255, 255} or {1.00, 1.00, 1.00},
}

function Ball:accelerate(x, y)
  self.dx = self.dx + x
  self.dy = self.dy + y
end

function Ball:decelerate(val)
  if val >= vector.length(self.dx, self.dy) then
    self.dx = 0.00
    self.dy = 0.00
  else
    local x, y = vector.normalize(self.dx, self.dy)
    x, y = vector.scale(x, y, val)
    self.dx = self.dx - x
    self.dy = self.dy - y
  end
end

function Ball:paint()
  love.graphics.setColor(self.color)
  love.graphics.circle('fill', math.floor(self.x), math.floor(self.y), self.radius) 
end

--- simulate motion through elapsed time
-- @param t: number elapsed time
-- @param bounds: ballgame.Boundary
function Ball:move(t, bounds)
  local left, top = bounds.x, bounds.y
  local right = bounds.x + bounds.width
  local bottom = bounds.y + bounds.height
  self.x = self.x + self.dx * t
  self.y = self.y + self.dy * t
  if self:left() < left and self.dx < 0 then
    self.dx = -self.dx
    self.x = self.x - 2 * (self:left( ) - left)
  elseif self:right() > right and self.dx > 0 then
    self.dx = -self.dx
    self.x = self.x - 2 * (self:right( ) - right)
  end
  if self:top() < top and self.dy < 0 then
    self.dy = -self.dy
    self.y = self.y - 2 * (self:top( ) - top)
  elseif self:bottom() > bottom and self.dy > 0 then
    self.dy = -self.dy
    self.y = self.y - 2 * (self:bottom( ) - bottom)
  end
  if bounds.friction then
    self:decelerate(bounds.friction)
  end
end

function Ball:is_moving()
  return self.dx ~= 0 or self.dy ~= 0
end

function Ball:shoot(x, y)
  self:accelerate(self.x - x, self.y - y)
end

function ball.new(o)
  local self = o or {}
  setmetatable(self, { __index = Ball })
  return self
end

return ball
