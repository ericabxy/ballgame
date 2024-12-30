--- golf ball putting application
-- @classmod hole_in_one
-- requires ballgame
local putting_green = require('src.hole_in_one.putting_green')
local golf_ball = require('src.ballgame.golf_ball')
local hole = require('src.ballgame.hole')

local hole_in_one = {}

-- class table
local HoleInOne = {
  ball = 'golf_ball',
  bounds = 'putting_green',
  hole = 'hole',
  putting = false
}

-- constructor
function HoleInOne:HoleInOne()
  local x = self.width - (self.width / 3)
  local y = self.height - (self.height / 4)
  self.ball = golf_ball.new{x = x, y = y}
  self.bounds = putting_green.new{width = self.width, height = self.height}
  self.hole = hole.new{x = self.width / 3, y = self.height / 4}
end

function HoleInOne:draw()
  self.bounds:paint()
  self.hole:paint()
  self.ball:paint()
  if self.putting then
    love.graphics.setColor(255, 0, 0)
    love.graphics.line(self.ball.x, self.ball.y, self.putting.x, self.putting.y)
  end
end

function HoleInOne:update(dt)
  self.ball:move(dt, self.bounds)
  self.hole:influence(self.ball)
end

function HoleInOne:mousepressed(x, y)
  if self.ball.sunk then
    self.ball = golf_ball.new{x = x, y = y}
  elseif not self.ball:is_moving() and self.ball:is_touching(x, y) then
    self.putting = {x = x, y = y}
  end
end

function HoleInOne:mousereleased(x, y)
  if self.putting then
    self.ball:putt(self.putting.x, self.putting.y)
  end
  self.putting = false
end

function HoleInOne:mousemoved(x, y)
  if self.putting then
    self.putting.x = x
    self.putting.y = y
  end
end

function hole_in_one.new(o)
  local self = o or {}
  setmetatable(self, { __index = HoleInOne })
  self:HoleInOne()
  return self
end

return hole_in_one
