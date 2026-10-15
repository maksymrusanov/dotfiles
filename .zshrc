# ========================
# Oh My Zsh
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
plugins=(
  git
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
# ========================
# Prompt
# ========================
PROMPT='%F{white}%~%f $(git_prompt_info)
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
# ========================
# uv completion
# ========================
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi
# ========================
# tmux safe autostart
# ========================
if command -v tmux >/dev/null && [[ -z "$TMUX" && -t 1 && -z "$SSH_CONNECTION" ]]; then
  tmux new-session -A -s 0
fi
# ========================
# Environment
# ========================
. "$HOME/.local/bin/env"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="/usr/bin:$PATH"
export GZ_CONFIG_PATH="/usr/share/gz"
# ========================
# ROS2
# ========================
source /opt/ros/jazzy/setup.zsh
