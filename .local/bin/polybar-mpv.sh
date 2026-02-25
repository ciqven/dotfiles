#!/bin/bash

if pidof mpv > /dev/null
    then
	    POSITION=$(echo '{ "command": ["get_property_string", "time-pos"] }' | socat - /tmp/mpvsocket | jq -r .data | cut -d'.' -f 1)
	    TOTAL=$(echo '{ "command": ["get_property_string", "duration"] }' | socat - /tmp/mpvsocket | jq -r .data | cut -d'.' -f 1)
	    TITLE=$(echo '{ "command": ["get_property", "media-title"] }' | socat - /tmp/mpvsocket | jq -r .data | cut -b 1-40)

		    printf "$TITLE"
		    printf ' | %d:%02d:%02d' $(($POSITION/3600)) $(($POSITION%3600/60)) $(($POSITION%60))
		    printf ' - %d:%02d:%02d\n' $(($TOTAL/3600)) $(($TOTAL%3600/60)) $(($TOTAL%60))
    else
	    echo ""
fi
