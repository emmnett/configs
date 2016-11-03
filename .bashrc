# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
[ x${MANPATH:0:1} != x':' ] && export MANPATH=:$MANPATH

    
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
shopt -s globstar


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ls='ls -GFh'
alias ls='ls -Gh --file-type'
alias ll='ls -l'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

#Most used Directories
alias csrc='cd /home-link/epiie01/src/douar-wsmp/src'
alias cdocs='cd /home-link/epiie01/documents/'
alias cmodels='cd /beegfs/work/epiie01/model_runs/DOUAR/'

#Often used
alias grepsrc='grep -irn --include=*.f90 --include=*.f'
alias myconfigs='/opt/bwgrid/devel/git/1.7.5/bin/git --git-dir=/home-link/epiie01/.myconfigs/ --work-tree=/home-link/epiie01'


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

#Own extensions

#add bin directories
export PATH=${PATH}:${HOME}/bin

#change prompt
export PROMPT_DIRTRIM=2
PS1='\u@\h:\w$ '

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

function mkcdir(){
    mkdir "$@"
    cd "$@"
}

function loadmod_intel15
{
    # module load numlib/mkl/11.0.5 numlib/wsmp/15.01.10 compiler/intel/15.0.3 mpi/impi/5.0.3-intel-15.0
    module load compiler/intel/15.0.3 mpi/impi/5.0.3-intel-15.0 numlib/wsmp/15.01.10 
    #export WSMPLICPATH=${HOME}/src/wsmp
    
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/bwhpc/common/compiler/intel/compxe.2015.3.187/mkl/lib/intel64
    
    export LD_LIBRARY_PATH
    
    export LD_RUN_PATH
}

# Load git
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/lib
module load devel/git
export INCLUDE=

#DOUAR options
export MALLOC_TRIM_THRESHOLD_=50000000
export MALLOC_MMAP_MAX_=0

export MKL_NUM_THREADS=1

export WRKDIR=/beegfs/work/epiie01/model_runs
