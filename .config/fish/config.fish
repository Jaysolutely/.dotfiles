set -gx PATH /bin /usr/bin /usr/local/bin /usr/games /usr/sbin
set -gx EDITOR /usr/bin/nvim
if test $TERM != "tmux-256color"
  set -gx TERM xterm-256color
end

if test -e $HOME/.nvm
  set -gx NVM_DIR $HOME/.nvm
  bass source $NVM_DIR/nvm.sh
end

if status is-interactive
  if not test -n "$TMUX"
    tmux new-session -A -s MAIN
  end
  fish_vi_key_bindings
  set -g theme_display_date no
  set -g theme_display_cmd_duration no
  set -g theme_display_vi no
  set -g theme_display_ruby no
  set -g theme_show_exit_status no
  set -U fish_greeting "🐟"
  
  alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end
