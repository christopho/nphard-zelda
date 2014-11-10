-- Script that creates a game ready to be played.

-- Usage:
-- local game_manager = require("scripts/game_manager")
-- local game = game_manager:create("savegame_file_name")
-- game:start()

local dialog_box_manager = require("scripts/dialog_box")

local game_manager = {}

-- Sets initial values for a new savegame of this quest.
local function initialize_new_savegame(game)
  -- Default values are fine.
end

-- Creates a game ready to be played.
function game_manager:create(file)

  -- Create the game (but do not start it).
  local exists = sol.game.exists(file)
  local game = sol.game.load(file)
  if not exists then
    -- This is a new savegame file.
    initialize_new_savegame(game)
  end
 
  local dialog_box

  -- Function called when the player runs this game.
  function game:on_started()

    dialog_box = dialog_box_manager:create(game)
  end

  -- Function called when the game stops.
  function game:on_finished()

    dialog_box:quit()
    dialog_box = nil
  end

  return game
end

return game_manager
