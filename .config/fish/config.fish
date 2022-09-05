if test -e $HOME/.nvm
  set -gx NVM_DIR $HOME/.nvm
  bass source $NVM_DIR/nvm.sh
end

if test -z "$TMUX" -a -z "$(tmux lsc)"
  tmux -f ~/.config/tmux/tmux.conf new-session -A -s MAIN
end
fish_vi_key_bindings

alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
