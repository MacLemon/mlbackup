#!/bin/sh
####################################
# Author: Pepi Zawodsky
# eMail: pepi@maclemon.at
# License: GNU Public License (GPL)
####################################
# This is a wrapper around /usr/local/bin/growlnotify
# This scriptchecks if growlnotify is installed on the system and will notify
# with growl if possible. It will fallback to logging if growl is unavailable.
# As the author of a script making use of this wrapper you do not have to care
# if growl is available anymore. Ths wrapper handles it all.
#
# Info on the Growl notification framework: http://growl.info
###############

MLgrowlNotify="/usr/local/bin/growlnotify"
MLgrowlNotifyInstalled=0

if [ -e $MLgrowlNotify ] # Standard path for growlnotify
then # Growl installed, so let's make some use of it
	MLgrowlNotifyInstalled=1

	# defining a working growlnotify function here
	function growlnotify()
	{
	
	# We should also check for an environment variable MLgrowlEnabled and just growl if the user wants us to growl by setting the variable in the environment.
	# To make sure we only and only growl if the user wants us to, we check the variable every time we would growl, so the user has precise control over notifications.
	
		if [ "$*" ]
		then
			$MLgrowlNotify "$@"
			MLgrowlReturnValue=$? # Getting the retunrvalue of growlnotify
		else # No parameters were passed
		echo Useage of growlnotify wrapper function: See the man page for /usr/local/bin/growlnotify to see how to use this function. It works the same, you just do not need to care if growlnotify is installed on the target system. NO error checking is done at the moment.
		MLgrowlReturnValue=0
		fi
		return $MLgrowlReturnValue # Returning growlnotify returnvalue
	}
else # growlnotify is not available
	# Cleaning our Variable
	unset MLgrowlNotify
	MLgrowlNotifyInstalled=0
	
	# No growlnotify installed, creating a dummy function, with logging
	function growlnotify()
	{
		# growlnotify is not installed, so we will fallback to simple logging
		/usr/bin/logger "$@"
		MLloggerReturnValue=$?
		return $MLloggerReturnValue # passing over logger returnvalue
	}
fi

# Testing Example
# growlnotify -n "MacLemon Backup" -s -m "This is the Message" The Title
#EOF