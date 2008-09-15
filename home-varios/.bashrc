# .bashrc
# User specific aliases and functions
alias tc="truecrypt"
alias ncmpc="ncmpc -f ~/.ncmpc/white-blue/config"


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#PS1='\[\033[0;36m\]\u \[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;35m\]\w\[\033[0m\$ '
#PS1='\[\033[01;30m\]\u \[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;35m\]\w\[\033[0m\$ '
#PS1='@\[\033[0;36m\]\h (\[\033[0;31m\]\u\[\033[0;36m\]) \[\033[0;32m\]\w :: \[\033[0m\]'
#PS1='[\[\033[0;36m\]\u@\[\033[0;31m\]\h\[\033[0;36m\] \[\033[0;32m\]\w \[\033[0m\]] '
#PS1='[\[\033[0;32m\]\u\[\033[01;31m\]@\[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;35m\]\w\[\033[0m\$ ]'

PS1='@\[\033[0;32m\]\h (\[\033[0;38m\]\u\[\033[0;36m\]) \[\033[0;32m\]\w :: \[\033[0m\]'

# keychain
keychain ~/.ssh/id_dsa
[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && \
  source $HOME/.keychain/$HOSTNAME-sh

