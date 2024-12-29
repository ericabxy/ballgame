--- simple circle shape
-- @classmod ballgame.circle

local circle = {}

--- class table
local Circle = {
  x = 0,
  y = 0,
  radius = 10,
}

function Circle:left()
  return self.x - self.radius
end

function Circle:right()
  return self.x + self.radius
end

function Circle:top()
  return self.y - self.radius
end

function Circle:bottom()
  return self.y + self.radius
end

function Circle:distance(x, y)
  local dx = x - self.x
  local dy = y - self.y
  return math.sqrt(( dx * dx ) + ( dy * dy ))
end

function Circle:is_touching(x, y)
  return self:distance(x, y) < self.radius
end

function circle.new(o)
  local self = o or {}
  setmetatable(self, { __index = Circle })
  return self
end

return circle
