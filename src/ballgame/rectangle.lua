--- rectangle shape
-- @classmod ballgame.rectangle

local rectangle = {}

local Rectangle = {
  x = 0,
  y = 0,
  width = 100,
  height = 100
}

function Rectangle:center()
  return self.x + self.width / 2, self.y + self.height / 2
end

function Rectangle:paint()
  love.graphics.setColor(lutro and {255, 255, 255} or {1.00, 1.00, 1.00})
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Rectangle:is_touching(x, y)
  return x > self.x and y > self.y
    and x < self.x + self.width
    and y < self.y + self.height
end

function rectangle.new(o)
  local self = o or {}
  setmetatable(self, { __index = Rectangle })
  return self
end

return rectangle
