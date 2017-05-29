# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Modear el PATH
export PATH="/usr/local/bin:$HOME/.local/share/apache-cxf/bin:$PATH"

# Hacks para apps java en gtk, creo
export IBUS_ENABLE_SYNC_MODE=1
export SWT_GTK3=1

#
## Desarrollo con spring y spring cloud
#
export SPRING_PROFILES_ACTIVE="dev"
export CLOUD_CONFIG_HOST="127.0.0.1"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/pperez/.sdkman"
[[ -s "/home/pperez/.sdkman/bin/sdkman-init.sh" ]] && source "/home/pperez/.sdkman/bin/sdkman-init.sh"
