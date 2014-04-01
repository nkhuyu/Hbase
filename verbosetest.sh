# Option defaults
OPT="value"
 
# getopts string
# This string needs to be updated with the single character options (e.g. -f)
opts="fvo:"
 
# Gets the command name without path
cmd(){ echo `basename $0`; }
 
# Help command output
usage(){
echo "\
`cmd` [OPTION...]
-f, --flag; Set a flag
-o, --opt; Set an option with argument (default: $OPT)
-v, --verbose; Enable verbose output (include multiple times for more
             ; verbosity, e.g. -vvv)
" | column -t -s ";"
}
 
# Error message
error(){
    echo "`cmd`: invalid option -- '$1'";
    echo "Try '`cmd` -h' for more information.";
    exit 1;
}
 
## There's two passes here. The first pass handles the long options and
## any short option that is already in canonical form. The second pass
## uses `getopt` to canonicalize any remaining short options and handle
## them
#for pass in 1 2; do
#    while [ -n "$1" ]; do
#        case $1 in
#            --) shift; break;;
#            -*) case $1 in
#                -f|--flag)     FLAG=1;;
#                -o|--opt)      OPT=$2; shift;;
#                -v|--verbose)  VERBOSE=$(($VERBOSE + 1));;
#                --*)           error $1;;
#                -*)            if [ $pass -eq 1 ]; then ARGS="$ARGS $1";
#                               else error $1; fi;;
#                esac;;
#            *)  if [ $pass -eq 1 ]; then ARGS="$ARGS $1";
#                else error $1; fi;;
#        esac
#        shift
#    done
#    if [ $pass -eq 1 ]; then ARGS=`getopt $opts $ARGS`
#        if [ $? != 0 ]; then usage; exit 2; fi; set -- $ARGS
#    fi
#done
# 
## Handle positional arguments
#if [ -n "$*" ]; then
#    echo "`cmd`: Extra arguments -- $*"
#    echo "Try '`cmd` -h' for more information."
#    exit 1
#fi
# 
## Set verbosity
#if [ "0$VERBOSE" -eq 0 ]; then
#    # Default, quiet
#    :
#fi
#if [ $VERBOSE -eq 1 ]; then
#    # Enable log messages
#    :
#fi
#if [ $VERBOSE -ge 2 ]; then
#    # Enable high verbosity
#    :
#fi
#if [ $VERBOSE -ge 3 ]; then
#    # Enable debug verbosity
#    :
#fi
