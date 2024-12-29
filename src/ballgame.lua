--- physics library for ball games
-- @classmod ballgame
local ball = require('src.ballgame.ball')
local color = require('src.ballgame.color')
local hole = require('src.ballgame.hole')
local rectangle = require('src.ballgame.rectangle')

local ballgame = {}

-- class table
local BallGame = {
  x = 0,
  y = 0,
  width = 250,
  height = 250,
  bounds = rectangle.new(),
  balls = {},
  holes = {},
  rects = {}
}

function BallGame:draw()
  --self.bounds:draw()
  for _, rect in ipairs(self.rects) do
    rect:draw()
  end
  for _, hole in ipairs(self.holes) do
    hole:draw()
  end
  for _, ball in ipairs(self.balls) do
    ball:draw()
  end
  if #self.balls < 1 then return end
  if self.ptr_x and self.ptr_y then
    love.graphics.setColor(color.light_red)
    love.graphics.line(
      self.balls[1].x,
      self.balls[1].y,
      self.ptr_x,
      self.ptr_y
    )
  end
end

function BallGame:bounce_demo()
  local ball = ball.new(self.width / 3, self.height / 4, 12)
  ball:accelerate(150, 230)
  self.balls = {ball}
  self.rects = {rectangle.new(self.x, self.y, self.width, self.height)}
  self.holes = {}
end

function BallGame:hole_in_one()
  local x = (self.width / 3) * 2
  local y = (self.height / 4) * 3
  self.balls = {}
  self.rects = {}
  self.holes = {
    hole.new(self.width / 3, self.height / 4, 16)
  }
  self.bounds = golf_green.new(self.x, self.y, self.width, self.height)
  local ball = golf_ball.new(x, y, 8)
  table.insert(self.balls, ball)
end

function BallGame:mousepressed(x, y)
  if #self.balls < 1 then return end
  if self.balls[1].sunk then
    self.balls[1].x = x
    self.balls[1].y = y
    self.balls[1].sunk = false
  elseif not self.balls[1]:is_moving() and self.balls[1]:is_touching(x, y) then
    self.ptr_x = x
    self.ptr_y = y
  end
end

function BallGame:mousereleased(x, y)
  if #self.balls < 1 then return end
  if self.ptr_x and self.ptr_y then
    self.balls[1]:putt(x, y)
  end
  self.ptr_x = false
  self.ptr_y = false
end

function BallGame:mousemoved(x, y)
  if self.ptr_x and self.ptr_y then
    self.ptr_x = x
    self.ptr_y = y
  end
end

function BallGame:update(dt)
  for _, ball in ipairs(self.balls) do
    local bounds = self.bounds
    for _, rect in ipairs(self.rects) do
      if rect:is_touching(ball.x, ball.y) then
        bounds = rect
      end
    end
    ball:move(dt, bounds)
    for _, hole in ipairs(self.holes) do
      hole:influence(ball)
    end
  end
end

function ballgame.new(width, height)
  local self = {width = width, height = height}
  setmetatable(self, { __index = BallGame })
  return self
end

return ballgame
