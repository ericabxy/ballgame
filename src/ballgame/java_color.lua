--- @module ballgame.java_color

local java_color = {
  black = lutro and {0, 0, 0} or {0.00, 0.00, 0.00},
  blue = lutro and {0, 0, 255} or {0.00, 0.00, 1.00},
  cyan = lutro and {0, 255, 255} or {0.00, 1.00, 1.00},
  darkGray = lutro and {64, 64, 64} or {0.25, 0.25, 0.25},
  gray = lutro and {128, 128, 128} or {0.50, 0.50, 0.50},
  green = lutro and {0, 255, 0} or {0.00, 1.00, 0.00},
  lightGray = lutro and {192, 192, 192} or {0.75, 0.75, 0.75},
  magenta = lutro and {255, 0, 255} or {1.00, 0.00, 1.00},
  orange = lutro and {255, 200, 0} or {1.00, 0.78, 0.00},
  pink = lutro and {255, 175, 175} or {1.00, 0.68, 0.68},
  red = lutro and {255, 0, 0} or {1.00, 0.00, 0.00},
  white = lutro and {255, 255, 255} or {1.00, 1.00, 1.00},
  yellow = lutro and {255, 255, 0} or {1.00, 1.00, 0.00},
}

return java_color
