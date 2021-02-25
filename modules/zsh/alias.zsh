alias reload!='. ~/.zshrc'
alias e="nvim"
alias vi="nvim"
alias vim="nvim"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias restart_audio="sudo kextunload /System/Library/Extensions/AppleHDA.kext; sudo kextload /System/Library/Extensions/AppleHDA.kext"
alias reset_sound="sudo killall coreaudiod"
alias flush_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

export DISPLAY_MAC=`ifconfig en0 | grep "inet " | cut -d " " -f2`:0

function startx() {
    if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
        open -a XQuartz
        socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
    fi
}

function t() {
  if [[ -z "$1" ]]; then
    tmux attach -t "perso" || tmux new -s "perso"
  else
    tmux attach -t "$1" || tmux new -s "$1"
  fi
}
