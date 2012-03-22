#!/bin/bash
###############################################################################
# Name: install.sh, an installer script for mlbackup
# Author: Pepi Zawodsky
# Authors eMail: mlbackup@maclemon.at
# Website: http://maclemon.at/mlbackup
# License: GNU general public license (GPL) http://www.gnu.org/licenses/gpl.html
###############################################################################
# install.sh, an installer script for mlbackup
# Copyright (C) 2005-2008 Pepi Zawodsky
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
###############################################################################

MLbackupInstallerVersion="0.0.2"
# MLbackupBuild=__CCUURREENNTT__RREEVVIISSIIOONN__
MLbackupBuild=$(git log --pretty=format:'' | wc -l | sed "s/[ \t]//g")

###############################################################################
# Must be run as root

MLbinDir=/usr/local/bin
MLconfigDir=/etc/maclemon/backup
MLcpFlags="-vp"
MLlnFlags="-vi"
MLsed=/usr/bin/sed


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
	cp $MLcpFlags mlbackup $MLbinDir
    $MLsed -i "" "s/__CCUURREENNTT__RREEVVIISSIIOONN__/$MLbackupBuild/g" "$MLbinDir/mlbackup"

	cp $MLcpFlags globalexclusions $MLconfigDir/
	cp $MLcpFlags demo.mlbackupconf.sample $MLconfigDir/


	# Setting correct Ownership of files

	chown root:wheel $MLbinDir/mlbackup $MLconfigDir/globalexclusions $MLconfigDir

	echo
	echo Setting correct privileges and file modes
	# Setting correct file modes
	chmod 755 $MLbinDir/mlbackup $MLconfigDir
	chmod 644 $MLconfigDir/globalexclusions $MLconfigDir/demo.mlbackupconf.sample

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
echo Done installing the MacLemon backup scripts. See the README for more info
fi
#EOF
