-- This is the main Lua script of your project.
-- You will probably make a title screen and then start a game.
-- See the Lua API! http://www.solarus-games.org/solarus/documentation/

local game_manager = require("scripts/game_manager")

local solarus_logo = require("scripts/menus/solarus_logo")
local language_menu = require("scripts/menus/language")
  
function sol.main:on_started()
  -- This function is called when Solarus starts.
  print("This is a sample quest for Solarus.")

  -- Show the Solarus logo initially.
  sol.menu.start(self, solarus_logo)
  solarus_logo.on_finished = function()
    sol.menu.start(self, language_menu)
  end

  language_menu.on_finished = function()
    local game = game_manager:create("savegame_file_name")
    game:start()
  end
 
end
