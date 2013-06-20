# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

COLOR=yes
CTERM=xterm

# Set prompt
if [ $COLOR = yes ]; then
        PS1="\[$IWhite\]┌─[\[$IBlue\u\[$White@\[$IPurple\H\[$IWhite]───[\[$ICyan\w\[$IWhite]\n\[\[$White\]\[\[$IWhite\]└─ \[$Color_Reset"
else
        PS1="┌─[\u@\H]───[\w]\n└─ "
fi

#aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
alias apt-get='sudo apt-get'
alias rmdir='rm -rfv'
alias cls='clear'
alias reboot='sudo shutdown -r now'
alias halt='sudo shutdown -h now'
alias sF='./.screenfetch'

# x - archive extractor
# usage: x <file>
x ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.xz)        unxz $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
