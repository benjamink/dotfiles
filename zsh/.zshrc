# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/opt/libiconv/bin:$PATH:/opt/puppetlabs/bin:~/bin:~/bin/kui/bin
export GOPATH=$HOME/go

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="bk_agnoster"
ZSH_THEME="ys"
#ZSH_THEME=powerlevel10k/powerlevel10k
#
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
#
#POWERLEVEL9K_MODE=nerdfont-complete
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_ROOT_ICON=$'\uF09C'
#POWERLEVEL9K_TIME_ICON=$'\uF017'
#POWERLEVEL9K_TIME_BACKGROUND=magenta
#POWERLEVEL9K_STATUS_OK_BACKGROUND=grey53

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(colorize jira git pip python gem kitchen gitlab colored-man-pages dircycle history web-search themes fancy-ctrl-z zsh-autosuggestions artifactory benk history-substring-search sshagent)
plugins=(mygit colorize pip python gem gitlab colored-man-pages dircycle history themes fancy-ctrl-z zsh-autosuggestions benk history-substring-search )

builtin which -s git &>/dev/null && plugins+=(git git-extras)
builtin which -s ansible &>/dev/null && plugins+=(ansible)
builtin which -s asdf &>/dev/null && plugins+=(asdf)
builtin which -s brew &>/dev/null && plugins+=(brew mybrew)
builtin which -s bundle &>/dev/null && plugins+=(bundle)
builtin which -s cloudctl &>/dev/null && plugins+=(icp)
builtin which -s docker &>/dev/null && plugins+=(docker)
builtin which -s fab &>/dev/null && plugins+=(fabric)
builtin which -s go &>/dev/null && plugins+=(go)
builtin which -s helm &>/dev/null && plugins+=(helm)
builtin which -s http &>/dev/null && plugins+=(httpie)
builtin which -s ibmcloud &>/dev/null && plugins+=(ibmcloud)
builtin which -s kubectl &>/dev/null && plugins+=(kubectl customk8s)
builtin which -s nmap &>/dev/null && plugins+=(nmap)
builtin which -s oc &>/dev/null && plugins+=(oc oc-cmd fyre)
builtin which -s op &>/dev/null && plugins+=(1password)
builtin which -s rbenv &>/dev/null && plugins+=(rbenv)
builtin which -s terraform &>/dev/null && plugins+=(terraform)
#builtin which -s tig &>/dev/null && plugins+=(tig)
builtin which -s vagrant &>/dev/null && plugins+=(vagrant)
builtin which -s vault &>/dev/null && plugins+=(vault)
builtin which -s pyenv &>/dev/null && plugins+=(pyenv)
builtin which -s virtualenv &>/dev/null && plugins+=(virtualenv)

#builtin which -s crc &>/dev/null && plugins+=(crc-oc)

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[[ -d /usr/local/gradle ]] && plugins+=(gradle)
[[ -d /usr/local/ibm-java ]] && plugins+=(ibmjava)

[ -e "~/packer/packer" ] && plugins+=(packer)

#[ "$(uname -s)" = "Darwin" ] && plugins+=(aj osx history-substring-searchi zsh-syntax-highlighting)
#[ "$(uname -s)" = "Linux" ] && plugins+=(sshagent)
#[ "$(cat /etc/debian_release 2>/dev/null)" = "squeeze/sid" ] && plugins+=(history-substring-search)

#source ~/dotfiles/zsh/custom/plugins/gitstatus/gitstatus.plugin.zsh
#source ~/dotfiles/zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

source $ZSH/oh-my-zsh.sh

# User configuration

#export JIRA_URL="https://jira.maaslab.uspa.ibm.com"
#export JIRA_NAME="benjamin.krein"
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# History configuration
# Don't store commands prepended with a space in the history
HIST_IGNORE_SPACE="true"
HIST_NO_STORE="true"
HIST_IGNORE_ALL_DUPS="true"

# zsh-autosuggestion Configs
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# added by travis gem
[ -f /Users/bkrein/.travis/travis.sh ] && source /Users/bkrein/.travis/travis.sh

### Added by the Bluemix CLI
#source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

. /usr/local/opt/asdf/asdf.sh

eval "$(pyenv init -)"

# crwctl autocomplete setup
CRWCTL_AC_ZSH_SETUP_PATH=/Users/bkrein/Library/Caches/crwctl/autocomplete/zsh_setup && test -f $CRWCTL_AC_ZSH_SETUP_PATH && source $CRWCTL_AC_ZSH_SETUP_PATH;
