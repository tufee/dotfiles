alias zshconfig="nvim ~/.zshrc"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="cd ~/.config/nvim"
alias down="cd ~/Downloads"
alias dev="cd ~/dev"
alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

TERM=screen-256color

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.zsh/spaceship/spaceship.zsh"
