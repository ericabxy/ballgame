--- tabletop for cue sports
-- @classmod surface
local surface = {}

-- REQUIRES ballgame
local boundary = require('src.ballgame.boundary')
local color = require('src.ballgame.color')

local Surface = boundary.new{
  friction = 0.80
}

function Surface:paint()
  love.graphics.setColor(color.green)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function surface.new(o)
  local self = o or {}
  setmetatable(self, { __index = Surface })
  return self
end

return surface
