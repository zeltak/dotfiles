#### zsh environment settings

export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$HOME/bin:$PATH"
export BROWSER=firefox 

#use vim in visudo
export SUDO_EDITOR="/usr/bin/vim -p -X"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -nw"
export VISUAL=$EDITOR

export PERL_LOCAL_LIB_ROOT="/home/zeltak/perl5";
export PERL_MB_OPT="--install_base /home/zeltak/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/zeltak/perl5";
export PERL5LIB="/home/zeltak/perl5/lib/perl5/x86_64-linux-thread-multi:/home/zeltak/perl5/lib/perl5";
export PATH="/home/zeltak/perl5/bin:$PATH";


