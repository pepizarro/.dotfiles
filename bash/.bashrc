# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# default text editor
export VISUAL=nvim
export EDITOR=nvim

export GOROOT_BOOTSTRAP="$HOME/Downloads/go1"
export PATH="$PATH:/home/go/bin"
export PATH="$PATH:/home/pedro/go/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH="$PATH:/home/pedro/dart-sdk/bin"
export PATH="$PATH:/home/pedro/books/craftinginterpreters"

export PATH="$PATH:/home/pedro/.cargo/bin"

# scripts
export PATH="$PATH:/home/pedro/code/scripts/bashscripts"
export PATH="$PATH:$HOME/.dotfiles/scripts"

# OS 
export PATH="$PATH:/opt/riscv/bin"
export PATH="$PATH:/home/pedro/uni/8vo/sistemas-operativos/qemu/build"

# keybinds
bind -x '"\C-f":tmux-sessionizer'


function title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# rgb colors
green="122;175;96"
purple="129;97;179"
purple2="129;97;179"
if [ "$color_prompt" = yes ]; then
    # PS1=' ${debian_chroot:+($debian_chroot)}\[\033[38;2;${green};1m\]\u\[\033[00m\]\[\033[01;38;2;${purple};1m\] \W\[\033[00m\]\[\033[1;31m\] $(__git_ps1 "(%s)")\[\033[38;2;${purple2};1m\]\$ \[\033[00m\]'
    PS1='${debian_chroot:+($debian_chroot)}\[\033[38;2;${green};1m\]\u\[\033[00m\]\[\033[01;38;2;${purple};1m\] \W\[\033[00m\]\[\033[1;31m\] $(__git_ps1 "(%s)")\n\[\033[38;2;${purple2};1m\]\$ \[\033[00m\] '
    # ❯
    # capital W for only current dir, w for full path
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# eg 'killproc firefox'
alias killproc='kill -9 $(ps aux | grep $1 | awk "{print $2}" | xargs kill)'

# cd into Downloads
alias cdd='cd ~/Downloads'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# fzf reverse search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

# neofetch
current_dir=$(pwd)
if [ "$current_dir" = "$HOME" ]; then
#     fastfetch  --logo-type data --logo "
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢢⡄⠀⠀⠀⠈⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠃⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠔⠊⠀⢈⣉⢱⣦⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠤⠔⠚⠁⡄⢀⠀⠈⢷⣄⠀⠀⠀⠀⠀⣠⡾⠁⠀⠀⠈⣿⣦⠀⠀⣀⡠⠴⠒⠉⠉⠂⠊⠉⠀⠀⣠⣤⠘⠋⠚⠛⠋⠛⠙⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠱⡿⠀⡀⣤⡈⠙⠢⢤⡤⣺⠟⣰⠃⠀⡠⠀⠙⣿⣿⣏⣉⣠⡤⠀⢀⣴⣤⡦⠄⠀⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⢡⡀⢠⡞⠀⠀⠀⣆⠀⠀⢄⠄⠀⠁⠉⠁⠉⣉⠯⠛⢡⠜⢡⣼⡙⠀⠀⡏⠀⠀⣿⣿⣿⣿⣿⣤⣄⣫⠿⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠓⠀⠈⠉⠀⡈⠤⠐⠊⠉⢀⠀⠈⢠⠄⣡⢰⠁⠀⠀⡃⠀⠀⠘⣿⣿⣿⣿⣿⣏⣝⢿⠒⠀⠠⠄⠐⠒⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠁⡠⠄⠊⣀⣴⢮⠺⠊⢻⠃⠀⠀⣼⠇⠀⠀⣶⣿⣿⣯⣿⣛⡕⠑⠁⠀⠀⠀⠀⠀⢀⠀⠀⠉⠒⠂⠀⠒⠒⠁⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠐⣴⣃⡀⠀⠀⠀⠀⠀⣰⠊⠁⡀⡴⣟⡵⠈⠋⠋⡔⠁⠀⠀⣸⣿⣄⠀⡼⣟⡟⡟⣿⣿⣟⠂⣴⣶⣤⢄⠀⠀⠠⣼⣿⢷⣶⠠⠀⠀⣀⡀⣤⡻⣿⠷⠂⠂⠂⢒⣢⡀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠞⠁⣠⢬⠏⠎⠁⠀⠀⠀⢠⠇⠀⢠⣾⣧⢋⡢⠀⡄⠁⠀⠀⠙⣿⣜⣶⣿⣾⠿⣾⣰⡄⢸⢿⠿⠎⠋⠉⠁⠀⠀⠙⠈⠋⠀⣀⣀⡠⠴⠟⠯⠛⠂⠀
# ⠀⠀⠀⢀⠀⠀⡠⠤⠐⠉⠀⠠⠋⠊⠀⠀⠀⡀⡄⠀⡘⠀⠀⢸⢿⡻⢈⣇⠀⣇⡄⠀⠀⠀⢿⣏⣿⣿⡿⣦⢻⢿⣵⡈⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀
# ⠀⢀⣼⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣰⢘⡝⣽⠰⠁⠀⢀⣿⣾⣟⡧⢿⠀⢹⡸⠀⠀⠀⠀⠹⣿⡋⠉⠀⠀⠄⠤⢄⡀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠤⠤⠔⠒⠛⠙⠋⠛⠙⠀⠲
# ⠰.⠶⣋⢶⣤⣀⣤⠤⡠⠤⠤⠄⠋⠀⠀⠀⠐⠟⠀⠀⠀⣿⢻⢿⡞⠉⠀⠀⠀⠙⢷⠀⣼⣄⠀⠈⠻⣿⣄⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⠀⣼⠓⠋⠀⠀⠀⠀⠀⠀⠀⠀⠺⠞⢿⣄⠀⠈⠙⠓⠢⠀⠀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⣸⠖⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⠀⣠⢎⡁⠀⠀⣀⣴⠛⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⡐⠁⠀⢨⠏⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⢟⢬⡃⢀⣼⣈⠁⠀⣀⣤⣼⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠂⠀⠀⠀⠀⢠⣳⡀⢰⠂⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠕⠚⠉⠛⠐⣰⢟⠿⠋⠝⠋⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠒⠒⠂⠀⠀⠐⢱⡇⢸⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠅⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#     "
# fastfetch

    title terminal
fi

HISTSIZE=2000
HISTFILESIZE=4000

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
#
#
# # Load Angular CLI autocompletion.
# source <(ng completion script)
# . "$HOME/.cargo/env"
source ~/.git-prompt.sh

