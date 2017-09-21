# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/bkrein/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
plugins=(colorize jira git pip python gem kitchen gitlab colored-man-pages dircycle history web-search themes fancy-ctrl-z benk)

builtin which -s git &>/dev/null && plugins+=(git git-extras)
#builtin which -s knife &>/dev/null && plugins+=(knife)
builtin which -s port &>/dev/null && plugins+=(macports)
builtin which -s vagrant &>/dev/null && plugins+=(vagrant)
#builtin which -s svn &>/dev/null && plugins+=(svn)
builtin which -s virtualenv &>/dev/null && plugins+=(virtualenv)
builtin which -s brew &>/dev/null && plugins+=(brew mybrew)
builtin which -s boxen &>/dev/null && plugins+=(boxen)
builtin which -s bundle &>/dev/null && plugins+=(bundle)
builtin which -s ansible &>/dev/null && plugins+=(ansible)
builtin which -s go &>/dev/null && plugins+=(go)
builtin which -s nmap &>/dev/null && plugins+=(nmap)
builtin which -s http &>/dev/null && plugins+=(httpie)
builtin which -s tig &>/dev/null && plugins+=(tig)
builtin which -s vagrant &>/dev/null && plugins+=(vagrant)
#[[ -d /opt/chefdk ]] && plugins+=(chefdk)
#[[ -d ~/git/terminal_markdown_viewer ]] && plugins+=(mdv)

[ -e "~/.oh-my-zsh/custom/aws.zsh" ] && plugins+=(aws)
[ -e "~/packer/packer" ] && plugins+=(packer)

[ "$(uname -s)" = "Darwin" ] && plugins+=(aj osx history-substring-searchi zsh-syntax-highlighting)
[ "$(uname -s)" = "Linux" ] && plugins+=(sshagent)
[ "$(cat /etc/debian_release 2>/dev/null)" = "squeeze/sid" ] && plugins+=(history-substring-search)


source $ZSH/oh-my-zsh.sh

# User configuration

export JIRA_URL="https://jira.maaslab.uspa.ibm.com"
export JIRA_NAME="benjamin.krein"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# History configuration
# Don't store commands prepended with a space in the history
HIST_IGNORE_SPACE="true"
HIST_NO_STORE="true"
HIST_IGNORE_ALL_DUPS="true"

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
