local map = ...
local game = map:get_game()

function you_win_sensor:on_activated()

  sol.audio.play_sound("secret")
  game:start_dialog("you_win")
end
