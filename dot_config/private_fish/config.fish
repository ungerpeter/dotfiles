fenv source ~/.profile
source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
fish_add_path -m ~/.local/bin
fish_add_path -m ~/bin
set TERM xterm-256color 
set DOCKER_HOST unix:///run/podman/podman.sock
# set XDG_RUNTIME_DIR /run/user/(id -u)
alias docker="podman"
alias lg="lazygit"
# function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
#   if set --query TMUX
#     fzf-tmux $argv
#   else
#     command fzf $argv
#   end
# end
starship init fish | source
