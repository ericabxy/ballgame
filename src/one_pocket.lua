--- billiards application
-- @classmod one_pocket
-- requires ballgame
local color = require('src.ballgame.color')
local hole = require('src.ballgame.hole')
local pool_ball = require('src.ballgame.pool_ball')
local surface = require('src.one_pocket.surface')

local one_pocket = {}

-- class table
local OnePocket = {
  ball = false, -- ballgame.pool_ball
  balls = {},
  bounds = 'ballgame.boundary',
  bumpers = {},
  holes = {}, -- ballgame.hole
  shooter = {x = 0, y = 0}
}

-- constructor
function OnePocket:OnePocket(width, height)
  self.width = width
  self.height = height
  table.insert(self.balls, pool_ball.new{x = width / 2, y = height - height / 4, radius = 8 })
  table.insert(self.balls, pool_ball.new{x = width / 2 - 10, y = height / 4, radius = 8 })
  table.insert(self.balls, pool_ball.new{x = width / 2 + 10, y = height / 4, radius = 8 })
  table.insert(self.balls, pool_ball.new{x = width / 2, y = height / 4 + 14, radius = 8 })
  self.balls[2].color = color[14]
  self.balls[3].color = color[12]
  self.balls[4].color = color[8]
  self.bounds = surface.new{width = width, height = height}
  table.insert(self.holes, hole.new{x = width / 6, y = height - height / 6, radius = 15})
end

function OnePocket:draw()
  self.bounds:paint()
  for _, hole in ipairs(self.holes) do
    hole:paint()
  end
  for _, ball in ipairs(self.balls) do
    ball:paint()
  end
  if self.ball then
    love.graphics.setColor(color.red)
    love.graphics.line(self.shooter.x, self.shooter.y, self.ball.x, self.ball.y)
  end
end

function OnePocket:update(dt)
  for b1 = 2, #self.balls do
    for b2 = 1, b1 - 1 do
      local ball1 = self.balls[b1]
      local ball2 = self.balls[b2]
      local time1 = ball1:time_to_intercept_ball(ball2)
      local time2, horz, vert = ball1:time_to_intercept_edge(self.bounds)
      if time1 > 0 and time1 < dt and time2 > 0 and time1 < time2 then
        ball1:strike_ball(ball2)
      elseif time2 > 0 and time2 < dt and time1 > 0 and time2 < time1 then
        ball1:bounce_edge(self.bounds, horz, vert)
      end
    end
  end
  for _, ball in ipairs(self.balls) do
    ball:move(dt, self.bounds)
    for _, hole in ipairs(self.holes) do
      hole:influence(ball)
    end
  end
end

function OnePocket:mousepressed(x, y)
  for _, ball in ipairs(self.balls) do
    if ball:is_touching(x, y) then
      self.ball = ball
    end
  end
end

function OnePocket:mousereleased(x, y)
  if self.ball then
    self.ball:shoot(x, y)
    self.ball = false
  end
end

function OnePocket:mousemoved(x, y)
  self.shooter.x = x
  self.shooter.y = y
end

function one_pocket.new(o)
  local self = o or {}
  setmetatable(self, { __index = OnePocket })
  self:OnePocket(o.width, o.height)
  return self
end

return one_pocket
