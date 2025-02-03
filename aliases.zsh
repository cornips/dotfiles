# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias dirsize="du -sch"
alias ll="ls -lAh"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias ssh-heldro="ssh -t -i ~/.ssh/id_ed25519 heldro@verkoop.heldro.nl 'cd \/home\/heldro\/public_html && exec \$SHELL -l'"
alias ssh-server1="ssh -t -i ~/.ssh/id_ed25519 mcornips@server1.cornipshosting.nl -p 61619 'cd \/home\/mcornips\/html && exec \$SHELL -l'"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias serve="http-server"
alias checkjson="python3 -m json.tool"

# Functions
ccat() {
  pygmentize -P style=monokai -g $1 | less
}
mov2mp4() {
  ffmpeg -i "$1" -vcodec h264 -acodec mp2 "$(echo $1 | sed -r 's/.{3}$/mp4/')"
}
portcheck() {
  lsof -i:$1 | grep LISTEN
  processRunning=$?
  if [ $processRunning -eq 0 ]; then
    echo
    read -r "?Do you want to kill the process running on port $1? [y/N] " wantToKill
    if [[ $wantToKill =~ ^[Yy]$ ]]; then
      lsof -i:$1 | grep LISTEN | awk '{print $2}' | xargs kill
      echo "Killed the process running on port $1"
    else
      echo "Leaving the process running"
    fi
  else
    echo "Nothing running on port $1"
  fi
}

# Directories
alias dev="cd $HOME/Development"
alias dotfiles="cd $DOTFILES"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

