# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

pathAppend "$HOME/.yadr/bin"
pathAppend "$HOME/.yadr/bin/yadr"
pathAppend  "/usr/local/sbin"
pathAppend  "$HOME/bin"
pathAppend  "$HOME/.rbenv/bin:$PATH"
pathAppend  "$HOME/.cargo/env/bin:$PATH"
pathAppend  "/usr/local/opt/python@2/libexec/bin"
pathAppend "/usr/local/Cellar/node/9.10.1/bin"
