-- This is the main Lua script of your project.
-- You will probably make a title screen and then start a game.
-- See the Lua API! http://www.solarus-games.org/solarus/documentation/

local game_manager = require("scripts/game_manager")

function sol.main:on_started()
  -- This function is called when Solarus starts.
  print("This is a sample quest for Solarus.")

  -- Setting a language is useful to display text and dialogs.
  sol.language.set_language("en")

  local solarus_logo = require("menus/solarus_logo")

  -- Show the Solarus logo initially.
  sol.menu.start(self, solarus_logo)
  solarus_logo.on_finished = function()
    local game = game_manager:create("savegame_file_name")
    game:start()
  end

end
