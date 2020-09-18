export HOSTNAME=`/bin/hostname`
export EDITOR=vim
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
export RBENV_ROOT=/usr/local/var/rbenv
export ARTIFACTORY_API_TOKEN="$(cat ~/.artifactory)"
export VAGRANT_USE_VAGRANT_TRIGGERS=false

###Suffix Aliases

alias -s yaml=code
alias -s yml=code
alias -s txt=code
alias -s sh=code
alias -s md=code
alias -s html=code
alias -s json=code
alias -s pp=code

###Aliases

alias vbm="VBoxManage"
alias v="vagrant"
alias vup="vagrant up"
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vs="vagrant status"
alias vp="vagrant provision"
alias vspec="vagrant provision --provision-with serverspec"
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
alias pupsync="rsync -auv --delete /Users/bkrein/IBM/puppet/common bz1puppet1-0.bb.internal.maas360.com:/u001/puppet/bkrein"
alias k="kubectl"
alias sk='export KUBECONFIG=superk_kube/config'
alias zshrc="source $HOME/.zshrc"

if [[ $OSTYPE == darwin* ]];
then
  alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;'
fi

### Functions

weather () {
  curl "http://wttr.in/${*:-18976}"
}

i2csshenv () {
  i2cssh -b -C1 ${1}infra1-0.bl.internal.maas360.com ${1}portalapp{1,2}-0.bl.internal.maas360.com
}

ikscfg () {
  eval $(ibmcloud ks cluster-config $1 --export)
}

rmd () {
  pandoc $1 | lynx -stdin
}

vansible () {
  ansible $1 --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m $2
}

# Shamelessly stolen from CMH as a way to distribute a sane shell environment where NFS homedirs don't exist
hd ()
{
    # set the source path
    typeset source=~/git/dotfiles/server/;
    # Default to both rsync and ssh
    typeset RSYNC=1;
    typeset SSH=1;
    # Override
    case $1 in
        "-x")
	    # Only copy dotfiles, don't log in
            echo "Skipping login, just update.";
            RSYNC=1;
            SSH=0;
            shift
        ;;
        *skm*)
	    # Idiot-proofing myself
            echo "Don't rsync to an SKM server, moron!";
            RSYNC=0
        ;;
    esac;
    # Get the servername - works with user@host syntax
    typeset svr=${1##*@};
    # Check to see if this is a legit host in the ssh config, or that it's alive.
    grep --color=auto -qw ${svr} ~/.ssh/config || fping ${svr} || return 1;
    # rsync out the source directory
    (( RSYNC )) && rsync -ai --exclude='*.swp' --exclude='.git*' --exclude='*.md' $source $1:./;
    # Connect to the host
    (( SSH )) && ssh $1
}

# Show GMT of given time
#gmt () {
#  TZ='GMT' date $1
#}

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

