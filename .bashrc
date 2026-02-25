# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add colors to ls
alias ls='ls --color=auto'

# Default basic prompt
PS1='[\u@\h \W]\$ '

# Use Pureline (https://github.com/chris-marsh/pureline) for a nice prompt
if [ "$TERM" != "linux" ]; then
    source ~/Programs/pureline/pureline ~/.config/pureline/pureline.conf
fi

# Tell nVidia to place the .nv folde somewhere else
export __GL_SHADER_DISK_CACHE_PATH="${HOME}/.cache/.nv/GLCache"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
export RUSTUP_HOME="${HOME}/.local/share/rustup"
export CARGO_HOME="${HOME}/.local/share/cargo"
. "${CARGO_HOME}/env"


# Todo top 5 (Only if not in ranger shell)
#if [[ -z "${RANGER_LEVEL}" ]]; then
#    echo "======= Top 5 Todo ======="
#    echo "$(head -5 /home/ciqven/.local/TODO)"
#fi

# Start code with gnome keyring (Only needed for copilot)
# alias code-oss='code-oss --password-store="gnome-libsecret"'

# Support yazi change cwd on close
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf shell integration
eval "$(fzf --bash)"
