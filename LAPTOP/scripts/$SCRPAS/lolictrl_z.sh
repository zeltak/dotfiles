#!/bin/sh
# dmenu access to loliclip daemon
#

# binaries and their parameters
DMENU="dmenu -i -l 15 -fn 'Roboto-Bold-r-normal11*-iso8859-11' -nf '#FFFFFF'  -sf '#FFFFFF' -sb '#33B5E5'"
LOLICLIP="loliclip"

# clipboard to copy to
# primary   = XA_PRIMARY
# secondary = XA_SECONDARY
# clipboard = XA_CLIPBOARD
CLIPBOARD="clipboard"

err() { echo -e "$@" 1>&2; exit 1; }

# usage
usage() {
   echo "usage: $(basename $@) [-us]"
   echo -e "\t-u : url mode"
   echo -e "\t-s : sync selection to another selection"
   echo -e "\t\t-spc : sync primary to clipboard"
   echo -e "\t\t-scp : sync clipboard to primary"
   echo -e "\t\t-ssc : sync secondary to clipboard"
   echo -e "\t\t-scs : sync clipboard to secondary"
   echo -e "\t\t-sps : sync primary to secondary"
   echo -e "\t\t-ssp : sync secondary to primary"
   exit 0
}

# urls
urlmode() {
   local protos="https?|ftps?|mailto|ssh|git|file"
   local url="$("$LOLICLIP" -l --${CLIPBOARD} |\
      grep -aoP "((($protos):\/\/|www\..*\.)[-/.\?=&%()#@~:\w]+)" | $DMENU -p "loliurl")"
   [[ -n "$url" ]] || exit 1
   echo "#LC:skip_history:$url" | "$LOLICLIP" --${CLIPBOARD}
   echo "$url"
   exit 0
}

# syncmode
syncmode() {
   local synf="$(echo -e "primary\nsecondary\nclipboard" |\
      $DMENU -p "sync_from")"
   [[ -n "$synf" ]] || exit 1
   local synt="$(echo -e "primary\nsecondary\nclipboard" |\
      $DMENU -p "sync_to")"
   [[ -n "$synt" ]] || exit 1
   "$LOLICLIP" --${synf} | "$LOLICLIP" --${synt}
   sleep 0.25
   "$LOLICLIP" --${synt}
   exit 0
}

# clipmode
clipmode() {
   id="$("$LOLICLIP" -m --${CLIPBOARD} | $DMENU -p "loliclip" |\
      sed 's/^[^0-9]*\([^:]*\):.*/\1/g')"
   [[ -n "$id" ]] || exit 1
   echo "$id" | "$LOLICLIP" -g | "$LOLICLIP" --${CLIPBOARD}
   sleep 0.25
   "$LOLICLIP" --${CLIPBOARD}
   exit 0
}

# sync
sync() {
   "$LOLICLIP" --$1 | "$LOLICLIP" --$2
   sleep 0.25
   "$LOLICLIP" --$2
   exit 0;
}

# main
main() {
   [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] && usage "$0"
   "$LOLICLIP" -q &> /dev/null ||
      err "loliclip returned non zero.\ncheck that it's installed and daemon is running."
   [[ "$1" == "-u" ]] && urlmode
   [[ "$1" == "-spc" ]] && sync "primary"    "clipboard"
   [[ "$1" == "-scp" ]] && sync "clipboard"  "primary"
   [[ "$1" == "-ssc" ]] && sync "secondary"  "clipboard"
   [[ "$1" == "-scs" ]] && sync "clipboard"  "secondary"
   [[ "$1" == "-sps" ]] && sync "primary"    "secondary"
   [[ "$1" == "-ssp" ]] && sync "secondary"  "primary"
   [[ "$1" == "-s" ]] && syncmode
   clipmode
}
main "$@"

# vim: set ts=8 sw=3 tw=0 :
