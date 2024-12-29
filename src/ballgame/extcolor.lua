--- @module ballgame.extcolor

local extcolor = {
  -- remaining 48 colors from Extended Graphics Array
  dark_yellow = lutro and {85, 85, 0} or {0.33, 0.33, 0.00} -- EGA-6
  black1 = lutro and {0, 0, 85} or {0.00, 0.00, 0.33}, -- EGA-8
  blue1 = lutro and {0, 0, 255} or {0.00, 0.00, 1.00}, -- EGA-9
  green1 = lutro and {0, 170, 85} or {0.00, 0.66, 0.33}, -- EGA-10
  cyan1 = lutro and {0, 170, 255} or {0.00, 0.66, 1.00}, -- EGA-11
  red1 = lutro and {170, 0, 85} or {0.66, 0.00, 0.33}, -- EGA-12
  magenta1 = lutro and {170, 0, 255} or {0.66, 0.00, 1.00}, -- EGA-13
  yellow1 = lutro and {170, 170, 85} or {0.66, 0.66, 0.33}, -- EGA-14
  gray1 = lutro and {170, 170, 255} or {0.66, 0.66, 1.00}, -- EGA-15
  black2 = lutro and {0, 85, 0} or {0.00, 0.33, 0.00}, -- EGA-16
  blue2 = lutro and {0, 85, 170} or {0.00, 0.33, 0.66}, -- EGA-17
  green2 = lutro and {0, 255, 0} or {0.00, 1.00, 0.00}, -- EGA-18
  cyan2 = lutro and {0, 255, 170} or {0.00, 1.00, 0.66}, -- EGA-19
  red2 = lutro and {170, 85, 0} or {0.66, 0.33, 0.00}, -- EGA-20
  magenta2 = lutro and {170, 85, 170} or {0.66, 0.33, 0.66}, -- EGA-21
  yellow2 = lutro and {170, 255, 0} or {0.66, 1.00, 0.00}, -- EGA-22
  gray2 = lutro and {170, 255, 170} or {0.66, 1.00, 0.66}, -- EGA-23
  black3 = lutro and {0, 85, 85} or {0.00, 0.33, 0.33}, -- EGA-24
  blue3 = lutro and {0, 85, 255} or {0.00, 0.33, 1.00}, -- EGA-25
  green3 = lutro and {0, 255, 85} or {0.00, 1.00, 0.33}, -- EGA-26
  cyan3 = lutro and {0, 255, 255} or {0.00, 1.00, 1.00}, -- EGA-27
  red3 = lutro and {170, 85, 85} or {0.66, 0.33, 0.33}, -- EGA-28
  magenta3 = lutro and {170, 85, 255} or {0.66, 0.33, 1.00}, -- EGA-29
  yellow3 = lutro and {170, 255, 85} or {0.66, 1.00, 0.33}, -- EGA-30
  gray3 = lutro and {170, 255, 255} or {0.66, 1.00, 1.00}, -- EGA-31
  green4 = lutro and {85, 170, 0} or {0.33, 0.66, 0.00},
  green5 = lutro and {85, 170, 85} or {0.33, 0.66, 0.33},
  green6 = lutro and {85, 255, 0} or {0.33, 1.00, 0.00},
}

return extcolor
