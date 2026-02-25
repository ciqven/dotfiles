## symlinked to /etc/bash/bashrc.d

alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gs="git status"
alias dif="git difftool --no-symlinks --dir-diff"

# Git dotfile repo
alias dotfiles='git --git-dir=$HOME/.config/dotfiles.git --work-tree=$HOME'

# Kitty aliases
alias d="kitty +kitten diff"
alias uni="kitty +kitten unicode_input"
alias ssh="kitty +kitten ssh"

# Calendar
alias cal="ncal -bwM"
alias cal4="ncal -bwMB1 -A2"

# Todo list
alias todo="nano ${HOME}/.local/TODO"

# Ranger
alias ranger=". ranger"
# alias rng="ranger" replaced with yazi, print duck to remind:
alias rng="printduck"

# yt-dlp
alias yt="yt-dlp --js-runtimes node"
alias yt-mp3="yt-dlp --js-runtimes node -t mp3"
