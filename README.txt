mlbackup - README

Contact and feedback:
--------------------------------------------------------------------------------
Do you like mlbackup? Tell us why, we love to be praised and worshipped!
Don't like mlbackup? Tell us how we can improve it!
Send an email to mlbackup@maclemon.at (english or german language please)
mlbackup is on Twitter as well! http://twitter.com/mlbackup


License:
--------------------------------------------------------------------------------
GNU general public license (GPL)
You should have received a copy of the GPL with this software distribution. If not, you can find more information about the GPL at the official website of the free software foundation.
http://www.gnu.org/licenses/gpl.html


Disclaimer:
--------------------------------------------------------------------------------
This software is provided as-is. It is in beta status and should be treated as such. mlbackup has proven to work fine on _my_ servers and other's, but please do not solely rely on the backups made with mlbackup. As usual, always have at least a second backup for vital data. Some support via email or the web site can be given at the moment. I hope to have user self-support (wiki/trac or similar) available in the future. I will post relevant information on the mlbackup website.


Target Audience:
--------------------------------------------------------------------------------
Mac OS X Admins and Geek Users who like a nice intelligent and incremental backup through the shell. Can be run from launchd (or cron) if you like. This is NOT INTENDED for normal users (yet). mlbackup is explicitly targeted at the Mac OS X (10.4 Tiger and 10.5 Leopard) platform. It has not been tested on other software platforms! Mac OS X 10.4.11 or Leopard (Server as well) is recommended.


Download:
--------------------------------------------------------------------------------
You can always get the latest version of mlbackup at http://maclemon.at/mlbackup


Installation:
--------------------------------------------------------------------------------
See INSTALL on how to install all the necessary files to use mlbackup.


Usage:
--------------------------------------------------------------------------------
Duplicate the provided sample configuration file found in /etc/maclemon/backup/demo.mlbackupconf.sample after installation. (Do NOT edit and use this file as your working configuration as it will be overwritten with a newer version if you update mlbackup.)
The sample config is well documented and should be easy for an admin to fill out all the necessary variables to get a working configuration for your purpose. If you find any parameters complex or unintuitive to use send us feedback on how we can improve this!

To invoke mlbackup use a command like this:
mlbackup path/to/your/configuration-file.mlbackupconf


Additions:
--------------------------------------------------------------------------------
None of these are mandatory, but they provide some comfort and help to beautify your backups.

Growl:
NOTE: Growl notifications are currently NOT available until a later date in the development cycle.
If you have growl and growlnotify installed, mlbackup will try to make use of it. For more info on growl see http://growl.info/


OSXutils:
If you have osxutils installed via fink, mlbackup will try to make use of them. 	For more info on osxutils see http://sourceforge.net/projects/osxutils/

	
fink project:
See http://fink.sf.net/ for info on fink.
You can use `fink install osxutils` to install osxutils if you have fink.


Known Issues:
--------------------------------------------------------------------------------
Still no manpage for mlbackup yet. (There still is hope and you should be able to get mlbackup up and running easily anyway.)

The backup set name may NOT include german umlaut characters. (I am still investigating why this is the case. If you have any information on how to make this work, please contact me!) This issue ONLY affects the naming of the backup sets. The files you intend to backup are not affected and will be backupped just fine!


If you are using Kerio mailserver be sure to check with the Kerio documentation on how to use the sendmail replacement wrapper for Kerio on your system. Otherwise mlbackup may not be able to send email. If you're using the Mac OS X postfix mailserver everything should just work. If you don't want to or cannot send email, just leave the $MLadminEmail=""


Feedback:
--------------------------------------------------------------------------------
Please direct all feedback, bug-reports, feature-requests and suggestions to mlbackup@maclemon.at . (In english or german language.) Support requests can handled in a limited way, depending on how much spare time I can afford.


Enjoy using mlbackup!

Best Regards
Pepi Zawodsky