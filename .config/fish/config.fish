if status is-interactive
    set -g theme_display_date no
    set -g theme_display_cmd_duration no
end
set -gx EDITOR /usr/bin/nvim
set -gx TERM xterm-256color

set -U fish_greeting "🐟"
