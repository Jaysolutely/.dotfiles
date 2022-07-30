set -gx PATH /bin /usr/bin /usr/local/bin /usr/games /usr/sbin
set -gx NVM_DIR $HOME/.nvm
set -gx EDITOR /usr/bin/nvim
set -gx TERM xterm-256color

bass source $NVM_DIR/nvm.sh

if status is-interactive
  fish_vi_key_bindings
  set -g theme_display_date no
  set -g theme_display_cmd_duration no
  set -g theme_display_vi no
  set -g theme_display_ruby no
  set -g theme_show_exit_status no
  set -U fish_greeting "🐟"
  # start tmux if not opened inside tmux
  if not test -n "$TMUX"
    tmux new-session -A -s MAIN
  end
end
