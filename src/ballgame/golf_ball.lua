--- ball with conditional shadows
-- @classmod ballgame.golf_ball
local ball = require('src.ballgame.ball')
local color = require('src.ballgame.color')

local golf_ball = {}

-- class table extends ball
local GolfBall = ball.new{
  radius = 8,
  sunk = false,
}

function GolfBall:draw()
  if not self.sunk then
    love.graphics.setColor(color.dark_gray)
    love.graphics.circle('fill', self.x + 2, self.y + 2, self.radius)
  end
  love.graphics.setColor(self.sunk and color.light_gray or color.white)
  love.graphics.circle('fill', self.x, self.y, self.radius) 
end

function GolfBall:putt(x, y)
  self:accelerate(self.x - x, self.y - y)
end

function golf_ball.extend(self)
  setmetatable(self, { __index = GolfBall })
  return self
end

function golf_ball.new(o)
  local self = o or {}
  setmetatable(self, { __index = GolfBall })
  return self
end

return golf_ball
