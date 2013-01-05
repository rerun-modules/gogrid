# Shell functions for the gogrid module.
#/ usage: source RERUN_MODULE_DIR/lib/functions.sh command
#

# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}

# Check usage. Argument should be command name.
[[ $# = 1 ]] || rerun_option_usage

# Source the option parser script.
#
if [[ -r $RERUN_MODULE_DIR/commands/$1/options.sh ]] 
then
    . $RERUN_MODULE_DIR/commands/$1/options.sh || {
        rerun_die "Failed loading options parser."
    }
fi

_GTIME=`date +%s`


#APIKEY="XXX"
#SECRET="YYY"
#GTIME=`date +%s`
#SERVER="https://api.gogrid.com/api"
#QVERSION=1.9
#FORMAT=json
#FORMAT=xml
#METHOD='/grid/server/list?'
#METHOD='/grid/ip/list?ip.type=Public'
#METHOD='/grid/ip/list?'

#METHOD=/XXX/YYY/ZZZ
#   XXX = grid|common

#
# produce an md5 checksum `signature' based on the concatenated set of apikey, secret, and time seed
# key:  apikey
# secret:  api secret
# gtime:  arbitrary, such as `date +%s` which is seconds since unix epoch
#
getMD5sum() {
   key=$1
   secret=$2

   HASH="${key}${secret}${_GTIME}"

   echo -n ${HASH} | md5sum | cut -d' ' -f1
}

#
# produce an api base url 
# server: root api url
# method: api method
# sig:  md5 based signature
# format: data format to produce such as "json" or "xml"
# version: api version
# apikey: api key
#
buildBaseURL() {
   server=$1
   method=$2
   sig=$3
   format=$4
   version=$5
   apikey=$6

   echo "${server}${method}&sig=${sig}&format=${format}&v=${version}&api_key=${apikey}"
}

#
# execute the api over the url
#
getURL() {
   url="$1"

   curl -skf "${url}"
}






#
# required params:
#    APIKEY
#    SECRET
#    METHOD
# optional params:
#    SERVER (https://api.gogrid.com/api)
#    FORMAT (json)
#    VERSION (1.9)

#&api_key=${API_KEY}
#&v=${API_VERSION}

#EXAMPLE

#SIG=$(getMD5sum ${APIKEY} ${SECRET} ${_GTIME})
#URL=$(buildBaseURL $SERVER $METHOD $SIG $FORMAT $VERSION $APIKEY)
#if ! getURL $URL
#then
#   echo ERROR getURL ${URL} 1>&2
#   exit 1
#fi


#get-avail-ip
#   public/private


# See rerun gogrid:api --apikey XXX --secret YYY --method '/common/lookup/list?lookup=lookups' |jq '.'
# for types of lookups
#US-West-1
