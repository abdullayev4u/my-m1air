

# Run .zshrc_secrets before all if exits
[ -f ~/.zshrc_secrets ] \
 && source ~/.zshrc_secrets \
 && chmod 600 ~/.zshrc_secrets


source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# PROMPT='%1~ %# '
setopt prompt_subst
# git_branch() {
#   local br
#   # use symbolic-ref for a nicer name and avoid printing "HEAD" on detached
#   br=$(git symbolic-ref --short HEAD 2>/dev/null) || return 0
#   [[ -n $br ]] && echo " %F{magenta}${br}%f"
# }
git_branch() {
  local br dirty
  br=$(git symbolic-ref --short HEAD 2>/dev/null) || return 0
  # detect uncommitted changes
  if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    dirty="*"
  fi
  [[ -n $br ]] && echo " %F{magenta}${br}${dirty}%f"
}
PROMPT="%1~\$(git_branch) %# "





# MY Codes......
alias gc2='$HOME/go/bin/gc2'
  # so I can use cli-tools isntalled by golang
export PATH="$PATH:$HOME/go/bin"



# MY GIT Alieases
alias gaa='git add --all'
alias gc='git commit -m'
alias gpo='git push origin'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gplo='git pull origin'

alias gpl='git pull'
alias gp='git push'
alias gploc='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gpoc='git push origin $(git rev-parse --abbrev-ref HEAD)'


alias goo='go run -tags=dev .'
alias gg='go get'
alias gmt='go mod tidy'

alias cl='clear'


## Go Test
alias got='go test'

alias rgo='richgo test'

alias gotestsum='go run gotest.tools/gotestsum@latest'
alias gts='gotestsum'
alias gtsp='gotestsum --format pkgname'
alias gtst='gotestsum --format testname'
alias gtsd='gotestsum --format dots'

alias goct='go clean -testcache'









# Antigravity
alias antigravity='/Users/myhome/.antigravity/antigravity/bin/antigravity'
alias agy='/Users/myhome/.antigravity/antigravity/bin/agy'
alias ag='agy'

# Kiro Code - I dont like it and commented it out, but keeping it for now if needed later
# [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
