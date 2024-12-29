--- store and calculate changes in velocity
-- @classmod ballgame.vector

local vector = {}

-- class table
local Vector = {
  x = 0.0,
  y = 0.0
}

function Vector:distance(x, y)
  local x, y = x - self.x, y - self.y
  return math.sqrt(x * x + y * y)
end

function Vector:dot(x, y)
  return self.x * x + self.y * y
end

function Vector:length()
  return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector:normalize()
  local d = math.sqrt(self.x * self.x + self.y * self.y)
  if not (d > 0) then return self.x, self.y end
  return self.x / d, self.y / d
end

function Vector:scale(s)
  return self.x * s, self.y * s
end

function vector.new(o)
  local self = o or {}
  setmetatable(self, { __index = Vector })
  return self
end

return vector
