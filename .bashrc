# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Android Studio
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

#alias
alias ans="sh /usr/local/android-studio/bin/studio.sh"
alias cdc="cd /home/keerthan/code"
alias cds="cd /home/keerthan/code/college"
alias cdj="cd /home/keerthan/code/work/sridher"
alias hyarn="/usr/local/hadoop/bin/yarn"
alias yarn="$HOME/.nvm/versions/node/v22.3.0/lib/node_modules/yarn/bin/yarn"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Java
#export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH=$PATH:$JAVA_HOME/bin
source "/home/keerthan/.sdkman/bin/sdkman-init.sh"

#asdf package manager
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

#Fly.io
export FLYCTL_INSTALL="/home/keerthan/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

#hadoop
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export PDSH_RCMD_TYPE=ssh

#SPARK
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin
export PYSPARK_PYTHON=/usr/bin/python3

#STREAM DECK
export PATH=$PATH:$HOME/.local/bin

#git shortcuts
alias gw="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519_work'"
alias gita='git add .'
alias gitc='git commit -m "$@"'
alias gitac="git add . && git commit -m "$@""

gitd() {
    # Check if a branch name is provided
    if [ -z "$1" ]; then
        echo "Usage: gitd <branch_name>"
        return 1
    fi

    branch_name=$1

    # Delete local branch
    git branch -d "$branch_name"

    # Delete remote branch
    git push origin --delete "$branch_name"

    echo "Branch '$branch_name' deleted locally and remotely."
}

_gitd() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local branches=$(git branch -l | awk '{print $NF}')

    COMPREPLY=($(compgen -W "$branches" -- "$cur"))
}
complete -F _gitd gitd

#Ros2
#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
#source /opt/ros/humble/setup.bash
##source ~/dev_ws/install/setup.bash
##source /usr/share/colcon_cd/function/colcon_cd.sh
##export _colcon_cd_root=~/dev_ws
#export COLCON_EXTENSION_BLOCKLIST=colcon_core.event_handler.desktop_notification
#export TURTLEBOT3_MODEL=waffle
##export TURTLEBOT3_MODEL=burger
##export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models
##export GZ_VERSION="fortress"
##export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH
##export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH
##export IGN_GAZEBO_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:$IGN_GAZEBO_SYSTEM_PLUGIN_PATH
##export IGN_GAZEBO_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:IGN_GAZEBO_RESOURCE_PATH
##export PATH=$PATH:$HOME/repos/Micro-XRCE-DDS-Gen/scripts
#export LD_PRELOAD=/lib/x86_64-linux-gnu/libstdc++.so.6:$LD_PRELOAD


#chrome_dev
alias gc_dev='nohup google-chrome --disable-web-security --user-data-dir="/home/keerthan/chrome_disable_cors"  > /dev/null 2>&1&'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#etcd
export PATH=$PATH:/tmp/etcd-download-test

. "$HOME/.cargo/env"

#docker shortcuts
dockertp() {
    if [ -z "$1" ]; then
        echo "Usage: dockertp <image>"
        return 1
    fi

    local image="$1"
    local tagged_image="keerthang/${image}"

    if docker image inspect "${image}" > /dev/null 2>&1; then
        echo "Tagging ${image} as ${tagged_image}..."
        docker tag "${image}" "${tagged_image}"

        echo "Pushing ${tagged_image}..."
        docker push "${tagged_image}"
    else
        echo "Error: Image ${image} does not exist."
        return 1
    fi
}

# Function for docker image autocomplete
_dockertp_completions() {
    local cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Check if the previous word is 'dockertp'
    if [[ ${prev} == 'dockertp' ]]; then
        # Get list of local Docker images
        local images
        images=$(docker image ls --format '{{.Repository}}:{{.Tag}}')

        # Provide the list of images for autocomplete
        COMPREPLY=($(compgen -W "${images}" -- "${cur}"))
    fi
}

# Register the completion function for dockertp command
complete -F _dockertp_completions dockertp

# pnpm
export PNPM_HOME="/home/keerthan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# UV shell
uvsh() {
    local venv_name=${1:-'.venv'}
    venv_name=${venv_name//\//} # remove trailing slashes (Linux)
    venv_name=${venv_name//\\/} # remove trailing slashes (Windows)

    local venv_bin=
    if [[ -d ${WINDIR} ]]; then
        venv_bin='Scripts/activate'
    else
        venv_bin='bin/activate'
    fi

    local activator="${venv_name}/${venv_bin}"
    echo "[INFO] Activate Python venv: ${venv_name} (via ${activator})"

    if [[ ! -f ${activator} ]]; then
        echo "[ERROR] Python venv not found: ${venv_name}"
        return
    fi

    # shellcheck disable=SC1090
    . "${activator}"
}

# Source KraftX utilities
source /home/keerthan/.kraftx_utilities

#Default Editor
export EDITOR=vim
export VISUAL=vim

# Append history to file, don't overwrite
shopt -s histappend

# Disable reading history from file into current session
# So up-arrow only shows current terminal session's history
unset HISTFILE      # disables auto-reading .bash_history into this terminal

# Still write to the global history file on each command
export HISTFILE=~/.bash_history
export PROMPT_COMMAND="history -a"

# Grow history size generously
export HISTSIZE=-1
export HISTFILESIZE=-1

# Github User Switch sriderh --> Keerthan
export PATH="$HOME/scripts:$PATH"
alias gus="gus.sh"
