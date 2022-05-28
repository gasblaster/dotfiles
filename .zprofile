
alias ls="exa -la"
alias zp="vim ~/.zprofile"
alias reload="source ~/.zprofile"
alias creds="gimme-aws-creds --profile aws-users-user"
alias ag="ag --hidden"
alias k="~/universe/bin/kubecfg"
alias xrg="xargs -I %"
alias 1st='awk '\''{print $1}'\'''
alias 2nd='awk '\''{print $2}'\'''
alias 3rd='awk '\''{print $3}'\'''


# Git aliases
alias gg="git grep"
alias gss="git status -s -uno"
alias gcb="new_branch"
alias gco="python ~/scripts/smart_checkout.py"

# Git work tree (WIP)
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# alias gwta="git worktree add"
# __git_complete gwta _git_checkout
# alias gwtr="git worktree remove"


export EDITOR=vim

#export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home'

export FZF_DEFAULT_COMMAND="ag --hidden -g"





export PATH="$HOME/universe/eng-tools/bin/hcvault:$HOME/.cargo/bin:$PATH"

jira() {
 open https://databricks.atlassian.net/browse/${1}
}

gitpr() {
 git fetch databricks "pull/${1}/head:pr/${1}"
 git checkout "pr/${1}" 
}

prod() {
  pushd ~/universe
  bin/get-kube-access prod-aws-us-west-2 --write
  popd
}

staging() {
  pushd ~/universe
  bin/get-kube-access staging-aws-us-west-2 --write
  popd
}

dev() {
  pushd ~/universe
  bin/get-kube-access dev-aws-us-west-2 --write
  popd
}

new_branch() {
  temp_date=$(date +"%Y-%m-%d")
  git checkout -b "${1}_${temp_date}" 
}

eval "$(/opt/homebrew/bin/brew shellenv)"
