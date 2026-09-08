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
alias ldk="lazydocker"

alias domusapp='sshpass -f ~/.ssh/passwd-domusapp ssh domusapp'
alias domusdb='sshpass -f ~/.ssh/passwd-domusdb ssh domusdb'
alias geo='sshpass -f ~/.ssh/passwd-geo ssh geo'
alias pulseapp='sshpass -f ~/.ssh/passwd-pulseapp ssh pulseapp'
alias pulsedb='sshpass -f ~/.ssh/passwd-pulsedb ssh pulsedb'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

zstyle ':omz:update' frequency 13

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export EDITOR=nvim
export VISUAL=nvim

export PATH=$PATH:/usr/local/go/bin
export PATH=/home/paulo/.opencode/bin:$PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"

ZSH_AUTOSUGGEST_STRATEGY=(completion)

source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

bindkey -r '^[l'                      # remove o macro `ls` padrão do oh-my-zsh
bindkey '^[l' autosuggest-accept      # Alt+L aceita a sugestão do zsh-autosuggestions
