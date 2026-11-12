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
    local command="$1"
    shift 2>/dev/null || true

    case "$command" in

        # ==================================
        # Create Project
        # ==================================
        create)
            if [[ -z "$1" ]]; then
                echo "Usage: mc create <project_name> [board]"
                echo "Example: mc create Blink esp32dev"
                return 1
            fi

            local project_name="$1"
            local board="${2:-esp32dev}"

            # Check if project already exists
            if [[ -e "$project_name" ]]; then
                echo "Error: '$project_name' already exists."
                return 1
            fi

            # Create project directory
            mkdir -p "$project_name" || return 1

            # Initialize PlatformIO project
            pio project init \
                --project-dir "$project_name" \
                --board "$board" \
                --project-option "framework=arduino" || return 1

            # Create main.cpp
            cat > "$project_name/src/main.cpp" <<'EOF'
#include <Arduino.h>

void setup() {

}

void loop() {

}
EOF

            # Enter project directory
            cd "$project_name" || return 1

            # Generate clangd compilation database
            pio run -t compiledb || return 1

            echo ""
            echo "=================================="
            echo "Project created successfully!"
            echo "Project: $project_name"
            echo "Board:   $board"
            echo "=================================="
            ;;

        # ==================================
        # Build
        # ==================================
        build|run)
            pio run "$@"
            ;;

        # ==================================
        # Upload Firmware
        # ==================================
        upload)
            pio run -t upload "$@"
            ;;

        # ==================================
        # Clean Build
        # ==================================
        clean)
            pio run -t clean "$@"
            ;;

        # ==================================
        # Serial Monitor
        # ==================================
        sm)
            pio device monitor -b 115200 "$@"
            ;;

        # ==================================
        # Generate clangd Database
        # ==================================
        compiledb)
            pio run -t compiledb "$@"
            ;;

        # ==================================
        # List Connected Devices
        # ==================================
        list)
            pio device list "$@"
            ;;

        # ==================================
        # Project Information
        # ==================================
        info)
            pio project config "$@"
            ;;

        # ==================================
        # List Available Boards
        # ==================================
        boards)
            pio boards "$@"
            ;;

        # ==================================
        # Upload + Serial Monitor
        # ==================================
        flash)
            pio run -t upload "$@" &&
                pio device monitor -b 115200
            ;;

        # ==================================
        # Help
        # ==================================
        help|*)
            echo "PlatformIO CLI"
            echo ""
            echo "Usage: mc <command> [arguments]"
            echo ""
            echo "Commands:"
            echo "  create <name> [board]  Create a project"
            echo "  build                  Build firmware"
            echo "  run                    Build firmware"
            echo "  upload                 Upload firmware"
            echo "  flash                  Upload + Serial Monitor"
            echo "  clean                  Clean build"
            echo "  sm                     Serial Monitor"
            echo "  compiledb              Generate clangd database"
            echo "  list                   List connected devices"
            echo "  boards                 List available boards"
            echo "  info                   Project configuration"
            echo "  help                   Show this help"
            ;;
    esac
}
