# Bashrc of Arch Linux
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Always Active
tmux

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# Match all files and zero or more directories and subdirectories.
# Shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability; turned
# Off by default to not distract the user: the focus in a terminal window
# Should be on the output of commands, not on the prompt
# Force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
else
    PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    ;;
*)
    ;;
esac

# Colored GCC warnings and errors
# Export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Usual Instructions  
alias install='pacman -S'
alias remove='pacman -R'
alias update='pacman -Syu'
alias c='clear'  
alias h='history'  
alias wg='wget -c '   

# Some more ls aliases
alias ll='ls -la'     
alias lf='ls -alF'  
alias la='ls -A'  
alias ls='ls -CF'  
alias lt='ls --human-readable --size -1 -S --classify'  
alias lh='ls -ahlt'
alias lu='du -sh * | sort -h'  
alias lt='ls -t -1 -long'  
alias lc='find . -type f | wc -l'  
alias ld='ls -d */'  

# Info from Drupal: config files, types of content and existing paragraphs
alias lsc='ls -lah config/sync/ | wc -l'   
alias lsn='ls -lah config/sync/node.type.* | wc -l'    
alias lsp='ls -lah config/sync/paragraphs.paragraphs_type.* | wc -l'  
    
# Files, folders and resources  
alias fh='find . -name '   
alias ..='cd ..'  
alias ....='cd ../..'  

# More Jump down  
alias 1d="cd .."  
alias 2d="cd ..;cd .."  
alias 3d="cd ..;cd ..;cd .."  
alias 4d="cd ..;cd ..;cd ..;cd .."  
alias 5d="cd ..;cd ..;cd ..;cd ..;cd .."  
alias untar='tar -zxvf $1'  
alias tar='tar -czvf $1'  
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"  
alias df="df -Tha --total"   
alias exp='nautilus .'
alias std="stat -c '%y - %n' * | sort -r -t'-' -k1,1"
# Gets a list of files ordered by date.

# Git Related Aliases  
# Basic info
alias gs='git status'  
alias gb='git branch'  
alias gr='git remote -v'  

# Getting info from 'Git log'  
alias gl='git log --oneline'  
alias glc="git log --format=format: --name-only --since=12.month | egrep -v '^$' | sort | uniq -c  | sort -nr | head -50"  
alias gld='git log –oneline –decorate –graph –all'  
alias glp="git log -g --grep='PHP' -10 --pretty='%h - %s - %cn - %cd'"
alias glf='git for-each-ref --sort=-committerdate'   

# Pushing to basic branches 
alias gpom='git push origin master'  
alias gpod='git push origin develop' 

# Add an "alert" alias for long running commands.  Use like so:
# Sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
