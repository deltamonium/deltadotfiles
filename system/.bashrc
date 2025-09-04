#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
export PIPEWIRE_LATENCY="128/48000"
PS1='\[\033[01;32m\]\A\[\033[00m\] \[\033[01;34m\]\u\[\033[00m\] = 》'


alias cbonsai="cbonsai -l --time=1 --infinite --wait=2 --multiplier=7 --life=65 --seed=200"
alias lt="ls -a"
alias clock='tty-clock -c -s -C 1 -b -t -f "%A, %B, %d, %Y"'
alias fastfetch="fastfetch --logo-padding-top 3"
alias unimatrix="unimatrix -a -b -c blue -f -s 97"
alias ls='ls --color=auto'

# (cat ~/.cache/wal/sequences &)
[ -f "$HOME/.cache/wal/colors.sh" ] && source "$HOME/.cache/wal/colors.sh"
