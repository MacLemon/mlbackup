#!/bin/bash
###############################################################################
# Name: MacLemon Backup installer
# Author: Pepi Zawodsky
# eMail: pepi@maclemon.at
# Copyright 2005, 2006: All Rights reserved

# Status: ALPHA

MLbackupInstallerVersion="0.0.1"
MLbackupBuild=26

###############################################################################
# Must be run as root

MLbinDir=/usr/local/bin
MLconfigDir=/etc/maclemon/backup
MLcpFlags="-vp"
MLlnFlags="-vi"

MLrootUID=0
if [ "$UID" -ne "$MLrootUID" ]
	then # We are not root
		echo Sorry, $(basename $0) must be run as root.

		# install.sh should check if the user is able to provide a password that can be used.
		# Member of group admin or wheel on Mac OS X should be enough, maybe check the sudoers file as well.
		exit 1	
	else # Yes, we are root.
	echo
	echo Creating directories
	# Creating the directory to keep the scripts
	mkdir -p $MLbinDir	
	
	# Creating the directory to keep the sample config and globalexclusions
	mkdir -p $MLconfigDir
	
	echo
	echo copying files
	# copying the files
	cp $MLcpFlags growler.sh $MLbinDir/
	cp $MLcpFlags mlbackup $MLbinDir/

	cp $MLcpFlags globalexclusions $MLconfigDir/
	cp $MLcpFlags demo.mlbackupconf.sample $MLconfigDir/

	# Setting correct Ownership of files
	chown root:wheel $MLbinDir/mlbackup $MLbinDir/growler.sh $MLconfigDir/globalexclusions $MLconfigDir
	
	echo
	echo Setting correct privileges and file modes
	# Setting correct file modes
	chmod 755 $MLbinDir/mlbackup $MLbinDir/growler.sh $MLconfigDir
	chmod 644 $MLconfigDir/globalexclusions $MLconfigDir/demo.mlbackupconf.sample

	echo Done installing the MacLemon backup scripts. See the README for more info
fi
#EOF