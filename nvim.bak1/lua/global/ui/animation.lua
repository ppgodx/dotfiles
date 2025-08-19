local M = {}

M.glitch = function()
  local stages = {
    { stage_length = 60, mode = "static" },
    { stage_length = 10, frame_start = 6, mode = "forward" },
    { stage_length = 20, mode = "static" },
    { stage_length = 8, frame_start = 7, mode = "backward" },
  }
  local original = require("global.ui.ascii_arts").Tokamak.original
  local frames = require("global.ui.ascii_arts").Tokamak.glitch
  local curr_stage = 1
  local counter = 0

  return function()
    local curr_frame
    if counter == stages[curr_stage].stage_length then
      curr_stage = curr_stage + 1
      if curr_stage > #stages then
        curr_stage = 1
      end
      counter = 0
    end
    if stages[curr_stage].mode == "static" then
      curr_frame = original
    elseif stages[curr_stage].mode == "forward" then
      curr_frame = frames[1 + (stages[curr_stage].frame_start + counter) % #frames]
    elseif stages[curr_stage].mode == "backward" then
      curr_frame = frames[1 + (stages[curr_stage].frame_start - counter) % #frames]
    elseif stages[curr_stage].mode == "random" then
      curr_frame = frames[math.random(#frames)]
    end
    counter = counter + 1
    return curr_frame
  end
end

return M
