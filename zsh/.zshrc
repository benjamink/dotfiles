# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="benk_svn"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(perl pip python gem benk)

builtin which -s git &>/dev/null && plugins+=(git)
builtin which -s knife &>/dev/null && plugins+=(knife)
builtin which -s port &>/dev/null && plugins+=(macports)
builtin which -s vagrant &>/dev/null && plugins+=(vagrant)
builtin which -s svn &>/dev/null && plugins+=(svn)
builtin which -s virtualenv &>/dev/null && plugins+=(virtualenv)
builtin which -s brew &>/dev/null && plugins+=(brew mybrew)
builtin which -s boxen &>/dev/null && plugins+=(boxen)
builtin which -s bundle &>/dev/null && plugins+=(bundle)

[ -e "~/.oh-my-zsh/custom/aws.zsh" ] && plugins+=(aws)
[ -e "~/packer/packer" ] && plugins+=(packer)

[ "`uname -s`" = "Darwin" ] && plugins+=(aj osx history-substring-searchi zsh-syntax-highlighting)
[ "`uname -o`" = "GNU/Linux" ] && plugins+=(sshagent)
[ "`cat /etc/debian_release 2>/dev/null`" = "squeeze/sid" ] && plugins+=(history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

