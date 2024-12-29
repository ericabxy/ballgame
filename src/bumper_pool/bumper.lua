--- circular obstacle for bumper pool table
-- @classmod bumper

local bumper = {}

-- class table
local Bumper = {}

function bumper.new(o)
  local self = o or {}
  setmetatable(self, { __index = Bumper })
  return self
end

return bumper
