export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias zshconf="nvim ~/.zshrc"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias tmuxconf="nvim ~/.tmux.conf"
alias vimconf="cd ~/.config/nvim"
alias down="cd ~/Downloads"
alias dev="cd ~/dev"
alias fd="fdfind"
alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias repo="gh repo view --web"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

zstyle ':omz:update' frequency 13

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:/usr/local/go/bin

# ZVM_MODE=ZVM_MODE_NORMAL
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZSH_AUTOSUGGEST_STRATEGY=(completion)

bindkey '^[l' autosuggest-accept

# The plugin will auto execute this zvm_config function
#
# zvm_config() {
#   # Retrieve default cursor styles
#   local ncur=$(zvm_cursor_style $ZVM_NORMAL_MODE_CURSOR)
#   local icur=$(zvm_cursor_style $ZVM_INSERT_MODE_CURSOR)
#
#   # Append your custom color for your cursor
#   ZVM_INSERT_MODE_CURSOR=$icur'\e\e]12;red\a'
#   ZVM_NORMAL_MODE_CURSOR=$ncur'\e\e]12;#008800\a'
# }

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2026-01-05 22:17:59
export PATH="$PATH:/home/tufe/.local/bin"
