--- straight-edged obstacle for cue sports
-- @classmod cushion

local cushion = {}

-- class table
local Cushion = {}

function cushion.new(o)
  local self = o or {}
  setmetatable(self, { __index = Cushion })
  return self
end

return cushion
