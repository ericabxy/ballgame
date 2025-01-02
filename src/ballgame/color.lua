--- 16-color graphics library
-- from IBM Color Graphics Array
-- @module color

local color = {
  [0] = 'black', 'blue', 'green', 'cyan',
  'red', 'magenta', 'brown', 'light_gray',
  'dark_gray', 'light_blue', 'light_green', 'light_cyan',
  'light_red', 'light_magenta', 'yellow', 'white'
}

local Color = {
  0, 0, 0,
  number = 0
}

color.__index = Color

function color.__add(self, n)
  return color[(self.number + n) % 16]
end

function color.__div(self, n)
  return color[math.floor(self.number / n) % 16]
end

function color.__mul(self, n)
  return color[(self.number * n) % 16]
end

function color.__sub(self, n)
  return color[(self.number - n) % 16]
end

for x = 0, 15 do
  local bitand = function (a, b)
    return a % (b * 2) < b and 0 or b 
  end
  local red =   2/3 * bitand(x, 4) / 4 + 1/3 * bitand(x, 8) / 8
  local green = 2/3 * bitand(x, 2) / 2 + 1/3 * bitand(x, 8) / 8
  local blue =  2/3 * bitand(x, 1) / 1 + 1/3 * bitand(x, 8) / 8
  if x == 6 then
    green = green * 2/3
  end
  local rgb = lutro and {red * 255, green * 255, blue * 255, number = x}
                     or {red, green, blue, number = x}
  setmetatable(rgb, color)
  local name = color[x]
  color[name] = rgb
  color[x] = rgb
end

return color
