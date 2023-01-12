# Shortcuts
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias ssh-server1="ssh -t -i ~/.ssh/id_ed25519 mcornips@server1.cornipshosting.nl -p 61619 'cd \/home\/mcornips\/html && exec \$SHELL -l'"
alias ssh-heldro="ssh -t -i ~/.ssh/id_ed25519 heldro@verkoop.heldro.nl 'cd \/home\/heldro\/public_html && exec \$SHELL -l'"
alias dirsize="du -sch"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
ccat() {
  pygmentize -P style=monokai -g $1 | less
}

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"
alias dev="cd $HOME/Development"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

