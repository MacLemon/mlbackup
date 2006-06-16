#!/bin/bash
###############################################################################
# Name: MacLemon Backup installer
# Author: Pepi Zawodsky
# eMail: pepi@maclemon.at
# Copyright 2005, 2006: All Rights reserved

# Status: ALPHA

MLbackupInstallerVersion="0.0.1"
MLbackupInstallerBuild="1"
MLbackupBuild=46

# LastChange: 2006.05.01.
###############################################################################
# Must be run as root

MLbinDir=/usr/local/bin
MLconfigDir=/etc/maclemon/backup
MLcpFlags="-vp"
MLlnFlags="-vi"

MLrootUID=0
if [ "$UID" -ne "$MLrootUID" ]
	then # We are not root
		MLweAreRoot=0
		echo $0 must be run as root.

		# install.sh should check if the user is able to provide a password that can be used.
		# Member of group admin or wheel on Mac OS X should be enough, maybe check the sudoers file as well.
		sudo $0
		
		
	else # Yes, we are root.
		MLweAreRoot=1
	echo
	echo Creating directories
	# Creating the directory to keep the scripts
	mkdir -p $MLbinDir	
	
	# Creating the directory to keep the configs
	mkdir -p $MLconfigDir
	
	echo
	echo copying files
	# copying the files
	cp $MLcpFlags rsyncautolocator.sh $MLbinDir/
	cp $MLcpFlags growler.sh $MLbinDir/
	cp $MLcpFlags mlbackup-v$MLbackupBuild $MLbinDir/
	ln -s $MLlnFlags $MLbinDir/mlbackup-v$MLbackupBuild $MLbinDir/mlbackup

	cp $MLcpFlags globalexclusions-v$MLbackupBuild $MLconfigDir/
	ln -s $MLlnFlags $MLconfigDir/globalexclusions-v$MLbackupBuild $MLconfigDir/globalexclusions
	cp $MLcpFlags demo.mlbackupconf.sample $MLconfigDir/

	# Setting correct Ownership of files
	chown root:wheel $MLbinDir/mlbackup-v$MLbackupBuild $MLbinDir/growler.sh $MLbinDir/rsyncautolocator.sh $MLconfigDir/globalexclusions $MLconfigDir
	
	echo
	echo Setting correct privileges and file modes
	# Setting correct file modes
	chmod 755 $MLbinDir/mlbackup-v$MLbackupBuild $MLbinDir/growler.sh $MLbinDir/rsyncautolocator.sh $MLconfigDir
	chmod 644 $MLconfigDir/globalexclusions $MLconfigDir/demo.mlbackupconf.sample

	echo Done installing MacLemon backup scripts. See the README or http://maclemon.at/ for more info
fi

#EOF