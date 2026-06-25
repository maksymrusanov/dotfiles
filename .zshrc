# ========================
# PATH
# ========================
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ========================
# Oh My Zsh
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ========================
# zsh-syntax-highlighting
# ========================
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Если установлен через git:
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ========================
# Prompt
# ========================
autoload -Uz vcs_info
precmd() { vcs_info; }

zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

setopt PROMPT_SUBST

PROMPT='%F{white}%~%f ${vcs_info_msg_0_} > '

# ========================
# Editor
# ========================
export EDITOR="nvim"

alias vi="nvim"
alias vim="nvim"

# ========================
# Python
# ========================
alias vc="python3 -m venv .venv"
alias va="source .venv/bin/activate"
alias vd="deactivate"

# ========================
# tmux autostart
# ========================
if command -v tmux >/dev/null && [[ -z "$TMUX" && -t 1 && -z "$SSH_CONNECTION" ]]; then
    tmux attach 2>/dev/null || tmux new-session
fi

# ========================
# uv completion
# ========================
if command -v uv >/dev/null 2>&1; then
    eval "$(uv generate-shell-completion zsh)"
fi

# ========================
# opencode
# ========================
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="/opt/nvim-linux-arm64/bin:$PATH"
