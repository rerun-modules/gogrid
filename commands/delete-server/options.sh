# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Sun Jan  6 11:03:10 PST 2013
#
#/ usage: gogrid:delete-server  --server-name <>  --apikey <>  --secret <> 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {

    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --server-name) rerun_option_check $# $1; SERVER_NAME=$2 ; shift ;;
            --apikey) rerun_option_check $# $1; APIKEY=$2 ; shift ;;
            --secret) rerun_option_check $# $1; SECRET=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.
    [ -z "$APIKEY" ] && APIKEY="$(rerun_property_get $RERUN_MODULE_DIR/options/apikey DEFAULT)"
    # Check required options are set
    [ -z "$SERVER_NAME" ] && { echo >&2 "missing required option: --server-name" ; return 2 ; }
    [ -z "$APIKEY" ] && { echo >&2 "missing required option: --apikey" ; return 2 ; }
    [ -z "$SECRET" ] && { echo >&2 "missing required option: --secret" ; return 2 ; }
    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
SERVER_NAME=
APIKEY=
SECRET=


