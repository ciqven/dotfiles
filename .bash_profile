# .bash_profile
export HISTSIZE=50000

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

PATH="$HOME/.local/bin:$PATH"

# When autologged in on tty1, start X
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
startx
fi

. "/home/ciqven/.local/share/cargo/env"
