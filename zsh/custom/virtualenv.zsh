function new-ve () {
  mkdir ~/.virtualenv/$1
  virtualenv ~/.virtualenv/$1
}

function use-ve () {
  source ~/.virtualenv/$1/bin/activate
}

alias activate="use-ve"
alias end-ve="deactivate"
