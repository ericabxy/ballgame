--- math library to help calculate vectors
-- @module ballgame.vector

local vector = {}

function vector.distance(x1, y1, x2, y2)
  local x, y = x2 - x1, y2 - y1
  return math.sqrt(x * x + y * y)
end

function vector.dot(x1, y1, x2, y2)
  return x1 * x2 + y1 * y2
end

function vector.get()
  return self.x, self.y
end

function vector.set(x, y)
  self.x = x
  self.y = y
end

function vector.length(x, y)
  return math.sqrt(x * x + y * y)
end

function vector.normalize(x, y)
  local d = math.sqrt(x * x + y * y)
  if not (d > 0) then return x, y end
  return x / d, y / d
end

function vector.scale(x, y, s)
  return x * s, y * s
end

return vector
