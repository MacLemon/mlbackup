#!/bin/sh
###############################################################################
# rsync autodiscovery script
#
# by Pepi Zawodsky
#
# Used to find a suitable version or rsync on a Mac system, and allowing to 
# autodiscover if it supports extended attributes of HFS (ResourceForks, etc.)
#
# Last Modified: 2005.10.17. 16:07
###

# initing our Environment:
MLrsync=""

MLreturnValue=0
# If we cannot find any rsync to use we will return 1, if we can find a useable rsync we just return 0



# local rsync autodiscovery, defining the possible candidates

#Rsync X (by Kevin Boyde, with HFS+ ResourceFork support)
MLrsyncCandidate[1]="/usr/local/bin/rsync"

# Mac OS X rsync (Panther does not support HFS extended attributes, Tiger does, Jaguar unknown, but unlikely as well)
MLrsyncCandidate[2]="/usr/bin/rsync"

# fink installed Rsync (doesn't support HFS extended attributes)
MLrsyncCandidate[3]="/sw/bin/rsync"

# Darwin Ports version of rsync (hfsrsync) touting HFS ResourceFork support. From the --help or man pages I couldn't find out how to trigger this. Hence it's left as a fallback version here. This may change in the future.
# Darwin Ports currently installs hfsrsync 2.5.5
MLrsyncCandidate[4]="/opt/local/bin/hfsrsync"

# Just as a fallback, if we cannot find an rsync we like, maybe there is still one lurking somewhere on this system, to save our user from configuration issues, we search in the users PATH, maybe we could use the locate db as well sometime, but I doubt it would actually be necessary
MLrsyncCandidate[5]=`which rsync`
MLrsyncCandidate[6]=`whereis rsync`

# repeat through the candidates to find the one we will use

# echo looping through the candidates, determining which one we will use.
MLrsyncFound=0 # Making sure our loop doesn't get tricked somehow
MLloopIndex=1 # Our array starts with index 1, so do we while checking through
while [ $MLloopIndex -le ${#MLrsyncCandidate[@]} ] && [ $MLrsyncFound -eq 0 ]
do
    if [ -e "${MLrsyncCandidate[$MLloopIndex]}" ]
    then # We found a suitable rsync
    	MLrsync=${MLrsyncCandidate[$MLloopIndex]}
    	MLrsyncFound=1
    fi
    ((MLloopIndex++)) #Incrementing the Loop Index to walk through the array
done
    
if [ "$MLrsync" == "" ] && [ $MLrsyncFound -eq 0 ] # We couldn't find ANY rsync
then
	MLreturnValue=1
fi

# echo Return Value= $MLreturnValue
return $MLreturnValue
#EOF