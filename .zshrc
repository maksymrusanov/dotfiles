# ========================
# PATH
# ========================

# ========================
# Oh My Zsh
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
# минимальные плагины
plugins=( git zsh-autosuggestions)


source $ZSH/oh-my-zsh.sh

# ========================
# ========================

# ========================
# Prompt (git branch)
# ========================
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

setopt PROMPT_SUBST

PROMPT='%F{white}%~%f ${vcs_info_msg_0_} 
> '

# ========================
# Editor
# ========================
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"

# ========================
# Python / venv
# ========================
alias vc="python3 -m venv .venv"
alias va="source .venv/bin/activate"
alias vd="deactivate"
alias db="open -a DBeaver"
alias orbstack="open -a OrbStack"
# ========================
# tmux safe autostart
# ========================

# ========================
# uv completion
# ========================
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi
. "$HOME/.local/bin/env"

export PATH=$PATH:/opt/nvim-linux-x86_64/bin

