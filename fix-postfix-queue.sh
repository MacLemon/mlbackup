#!/bin/bash
# fixes the postfix queue on Mac OS X Client
# Never touches postfix on Mac OS X Server.

if [ ! $(sw_vers | grep -q "Server") ]
then
    if [ $(sw_vers | grep -q "10.[456]") ]
    then
        echo
        echo Fixing the postifx queue system on Mac OS X client
        /etc/postfix/post-install create-missing
    fi
else
     echo
    echo This is Mac OS X Server, not touching the postfix system.
fi
#EOF
