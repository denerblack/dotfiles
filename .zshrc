
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# pro cd function
pd() {
  projDir=$(pro search $1)
  cd ${projDir}
}
