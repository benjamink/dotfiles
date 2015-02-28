export HOSTNAME=`/bin/hostname`
export EDITOR=vim
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
export RBENV_ROOT=/usr/local/var/rbenv

# ##Aliases

alias vbm="VBoxManage"
alias v="vagrant"
alias vup="vagrant up"
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vs="vagrant status"
alias vssh="vagrant ssh"
alias mutt="nocorrect mutt"
alias la="ls -la"
alias sshrm="ssh-keygen -R $1"
alias rake="noglob rake"
alias knife="nocorrect knife"
alias shef="shef -z -c ~/.chef/knife.rb"
alias gitx="open -a gitx ."
alias gitmerge="git merge --no-commit --no-ff"
alias githead="noglob git reset head^"
alias dirsize='du -s * | sort -n | cut -f 2- | while read a; do du -hs "$a"; done;'
alias myps="ps auxwww"
alias init_dnsmasq="sudo killall dnsmasq && sudo dscacheutil -flushcache"
alias portstat="lsof -i -n -P"
alias ipynotebook="ipython notebook --notebook-dir=~/ipython/ --script --logfile=~/ipython/ipy-notebook.log"

### Functions

# Generate SHA512 hash for /etc/shadow
mkshadow () {
  if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Usage: mkshadow <password> <salt>"
  else
    python -c "import crypt, getpass, pwd; \
                   print crypt.crypt('$1', '\$6\$${2}\$')"
  fi
}

# Generate ASCII QR code
qr () {
  if [ -x "$(which qrencode)" ]; then
    qrencode -t ANSI256 $1
  else
    echo "'qrencode' missing - run 'brew install qrencode' to install"
  fi
}

# Convert epoch to readable
epoch2date () {
    perl -e "print scalar(localtime($1)), \"\n\""
}

# Number of days since date
dayssince () {
  echo "$(( `gdate +%s` - `gdate -d "$1" +%s` ))/(60*60*25)" | bc
}

# Unquote URL strings
unquote () {
    python -c 'import urllib,sys; print urllib.unquote(sys.argv[1])' $1
}

# Quote URL strings
quote () {
    python -c 'import urllib,sys; print urllib.quote(sys.argv[1])' $1
}

# Lookup whois location info
whowhere () {
    whois $1 | egrep -i "(OrgName|Address|City|StateProv|PostalCode|Country)"
}

# Lookup whois email info
whoemail () {
    whois $1 | egrep -i "(OrgName|OrgAbuse)"
}

# Describe files for awk/cut processing
filedesc () {
    head $1 | awk '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}'
}

# Describe files for awk/cut processing
filedesclim () {
    head $2 | awk -F"$1" '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}'
}

# Port-forward VNC to host via SSH
vmssh () {
  ssh $(for i in {0..30}; do echo "-L $(( 5900 + $i)):127.0.0.1:$(( 5900 + $i )) "; done;) $1
}

# Convert IP address to Hex format
ip2hex () {
  printf '%02X' ${1//./ }; echo
}

# List inode usage by directory
dirinodes () {
    if [ -n "$1" ]; then
        PWD="$1"
    else
        PWD=`pwd`
    fi

    find $PWD -type d |
    while read line; do
        echo "$( find "$line" -maxdepth 1 | wc -l ) $line"
    done |
    sort -rn | less
}

