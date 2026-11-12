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

cpp_run() {
    local file="$1"
    local output="${file%.cpp}"
    g++ -std=c++17 -Wall -Wextra "$file" -o "$output" && "./$output"
}

# ========================
# uv completion
# ========================
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi
# ========================
# tmux safe autostart
# ========================
# Automatically attach to the same tmux session
if command -v tmux >/dev/null && [[ -z "$TMUX" && -t 1 && -z "$SSH_CONNECTION" ]]; then
  tmux new-session -A -s main
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
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.platformio-venv/bin:$PATH"
# ==========================================
# PlatformIO — ESP32 / Arduino
# ==========================================

mc() {
    case "$1" in
        build)
            shift
            pio run "$@"
            ;;
        upload)
            shift
            pio run -t upload "$@"
            ;;
        clean)
            shift
            pio run -t clean "$@"
            ;;
        sm)
            shift
            pio device monitor -b 115200 "$@"
            ;;
        compiledb)
            shift
            pio run -t compiledb "$@"
            ;;
        list)
            shift
            pio device list "$@"
            ;;
        info)
            shift
            pio project config "$@"
            ;;
        *)
            echo "PlatformIO commands:"
            echo "  mc build - Build firmware"
            echo "  mc upload    - Upload firmware"
            echo "  mc clean     - Clean build"
            echo "  mc sm        - Serial Monitor"
            echo "  mc compiledb - Generate compile_commands.json"
            echo "  mc list      - List connected devices"
            echo "  mc info      - Project configuration"
            ;;
    esac
}
