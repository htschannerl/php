# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

ORACLE_HOME=/usr/lib/oracle/18.5/client64
PATH=$PATH:$ORACLE_HOME/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/oracle/18.5/client64/lib/
TNS_ADMIN=$ORACLE_HOME/network/admin
NLS_LANG=AMERICAN_AMERICA.TH8TISASCII

export ORACLE_HOME
export PATH
export LD_LIBRARY_PATH64
export LD_LIBRARY_PATH
export TNS_ADMIN
