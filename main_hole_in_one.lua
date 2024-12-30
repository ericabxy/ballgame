local ballgame = require('src.ballgame')
local hole_in_one = require('src.hole_in_one')

local screen_width = lutro and 320 or 800
local screen_height = lutro and 240 or 600
local applet = hole_in_one.new{
  width = screen_width,
  height = screen_height
}

function love.load()
end

function love.update(dt)
  applet:update(dt)
end

function love.draw()
  applet:draw()
end

function love.mousepressed(x, y)
  applet:mousepressed(x, y)
end

function love.mousereleased(x, y)
  applet:mousereleased(x, y)
end

function love.mousemoved(x, y)
  applet:mousemoved(x, y)
end
