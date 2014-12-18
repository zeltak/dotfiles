#### zsh environment settings

export PATH=/usr/bin:/usr/local/bin:/usr/local/sbin:/home/zeltak/.gem/ruby/1.9.1/bin:/home/zeltak/bin/
export BROWSER=firefox 

#use vim in visudo
export SUDO_EDITOR="/usr/bin/vim -p -X"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient"
export VISUAL=$EDITOR

export PERL_LOCAL_LIB_ROOT="/home/zeltak/perl5";
export PERL_MB_OPT="--install_base /home/zeltak/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/zeltak/perl5";
export PERL5LIB="/home/zeltak/perl5/lib/perl5/x86_64-linux-thread-multi:/home/zeltak/perl5/lib/perl5";
export PATH="/home/zeltak/perl5/bin:$PATH";
