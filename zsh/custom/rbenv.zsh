if [ ! -d $HOME/.rbenv ]; then
  echo -n "Installing rbenv... "
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo "Done."
fi
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
