# ----------------------------------------------------------------------------
# From blog post:
#   http://zanshin.net/2012/03/09/wordy-nerdy-zsh-prompt/
# ----------------------------------------------------------------------------
# Using bits from Steve Losh
#   http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Shows little symbol '±' if you're currently at a git repo,
#                     '☿' if you're currently at a hg repo,
#                     '⚡' if you're currently at a svn repo,
#                 and '○' all other times
# ----------------------------------------------------------------------------
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "[git] " && return
    hg root >/dev/null 2>/dev/null && echo "[hg] " && return
    svn info >/dev/null 2>/dev/null && echo "[svn] " && return
    echo ''
}

# ----------------------------------------------------------------------------
# hg prompt
# depends upon ~/Projects/hg/hg-prompt
# ----------------------------------------------------------------------------
function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

# ----------------------------------------------------------------------------
# svn prompt
# based on: https://gist.github.com/1156969
# with help from: http://andrewray.me/bash-prompt-builder/index.html
# ----------------------------------------------------------------------------
function svn_prompt_info {
    # Set up defaults
    local svn_branch=""
    local svn_repository=""
    local svn_version=""
    local svn_change=""

    # only if we are in a directory that contains a .svn entry
    if [ -d ".svn" ]; then
        # query svn info and parse the results
        svn_branch=`svn info | grep '^URL:' | egrep -o '((tags|branches)/[^/]+|trunk).*' | sed -E -e 's/^(branches|tags)\///g'`
        svn_repository=`svn info | grep '^Repository Root:' | egrep -o '(http|https|file|svn|svn+ssh)/[^/]+' | egrep -o '[^/]+$'`
        svn_version=`svnversion -n`

        # this is the slowest test of the bunch
        change_count=`svn status | grep "?\|\!\|M\|A" | wc -l`
        if [ "$change_count" != "       0" ]; then
            #svn_change=" [dirty]"
            svn_change=" %{$fg[red]%}✘"
        else
            #svn_change=""
            svn_change=" %{$fg[green]%}✔︎"
        fi

        # show the results
        #echo "%{$fg[blue]%}$svn_repository/$svn_branch @ $svn_version%{$reset_color%}%{$fg[yellow]%}$svn_change%{$reset_color%}"
        echo " %{$fg[blue]%}$svn_repository/$svn_branch @ $svn_version%{$reset_color%}$svn_change%{$reset_color%}"

    fi
}

# ----------------------------------------------------------------------------
# git prompt variables
# depends on using Steve Losh fork of oh-my-zsh
# ----------------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ⚑"

# ----------------------------------------------------------------------------
# zee prompt (ha ha)
# ----------------------------------------------------------------------------
PROMPT='
%{$fg[red]%}[$(date +%Y-%m-%d) $(date +%H:%M:%S)]%{$reset_color%} %{$fg[blue]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}${PWD/#$HOME/~}%b%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)$(svn_prompt_info)
$(prompt_char)\$ '

# ----------------------------------------------------------------------------
# rubies are red, and so my Ruby version is too
#----------------------------------------------------------------------------
#RPROMPT='%{$fg[red]%}$(rbenv version-name)%{$reset_color%}%'

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
