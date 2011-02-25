mlbackup - README



License:
-------------------------------------------------------------------------------
GNU general public license (GPLv3) 
You should have received a copy of the GPL with this software distribution. If not, you can find more information about the GPL at the official website of the free software foundation.
http://www.gnu.org/licenses/gpl.html



Disclaimer:
-------------------------------------------------------------------------------
This software is provided as-is. mlbackup has proven to work fine on _my_ servers and many 1other's, but please do not solely rely on the backups made with mlbackup. As usual, always have at least a second backup for vital data. Please use the wiki at the [mlbackup](https://github.com/MacLemon/mlbackup) github page to post your tips and tricks and how you use mlbackup!



Target Audience:
-------------------------------------------------------------------------------
Mac OS X Admins and Geek Users who like a nice intelligent and incremental backup through the shell. Can be run from launchd (or cron) if you like. This is NOT INTENDED for normal users. mlbackup is explicitly targeted at the Mac OS X (10.4 Tiger, 10.5 Leopard, 10.6 Snow Leopard and respective Server Versions) platform. It has not been tested on other software platforms! At least Mac OS X 10.4.11 is recommended.
mlbackup is not yet tested on the Mac OS X 10.7 Lion Developer Preview, but will support 10.7 in the future.



Download & Versioncheck:
-------------------------------------------------------------------------------
You can always get the latest version of mlbackup at the [mlbackup](https://github.com/MacLemon/mlbackup) GitHub page.
If you invoke mlbackup without a config file parameter it will check online for an updated version. It tries to connect to http://versioncheck.maclemon.at/mlbackup.txt to find out if there is a newer version available. At no point is ANY information sent to our servers to respect your privacy.



Installation:
-------------------------------------------------------------------------------
Just use install the installer package. See the INSTALL.txt file for not recommended other ways.



How to use mlbackup:
-------------------------------------------------------------------------------
Duplicate the provided sample configuration file found in /etc/maclemon/backup/demo.mlbackupconf.sample after installation. (Do NOT edit and use this file as your working configuration as it will be overwritten with a newer versions if you update mlbackup.)
The sample config is well documented and should be easy for an admin to fill out all the necessary variables to get a working configuration for your purpose. If you find any parameters complex or unintuitive to use send us feedback on how we can improve this!

To invoke mlbackup use a command like this:
mlbackup path/to/your/configuration-file.mlbackupconf

I recommend to use the following paths to store your config files:
- For system wide configurations: /etc/maclemon/backup/ or /etc/mlbackup
- For personal backups: ~/.mlbackup/



Additions:
-------------------------------------------------------------------------------
None of these are mandatory, but they provide some comfort and help to beautify your backups.

Growl:
NOTE: Growl notifications are currently NOT available until a later date in the development cycle.
If you have growl and growlnotify installed, mlbackup will try to make use of it. For more info on growl see http://growl.info/

	
fink project:
See http://fink.sf.net/ for info on fink.
You can use `fink install osxutils` to install osxutils if you have fink.



Known Issues:
-------------------------------------------------------------------------------
Still no manpage for mlbackup yet. (There still is hope and you should be able to get mlbackup up and running easily anyway.)

The backup set name may NOT include german umlaut characters. (I am still investigating why this is the case. If you have any information on how to make this work, please contact me!) This issue ONLY affects the naming of the backup sets. The files you intend to backup are not affected and will be backupped just fine!


If you are using Kerio mailserver be sure to check with the Kerio documentation on how to use the sendmail replacement wrapper for Kerio on your system. Otherwise mlbackup may not be able to send email. If you're using the Mac OS X postfix mailserver everything should just work. If you don't want to or cannot send email, just leave the $MLadminEmail=""


Versioncheck will not work if you need to connect to the web using a proxy server. This will hopefully be improved in a future version. (Patches welcome!)


If mlbackup cannot check for updates it will present you an Exit Code that it got from curl(1) but will not give you a helpful human readable error message. At the moment you need to look up the error in man curl.



Feedback:
-------------------------------------------------------------------------------
You can direct feedback to me in several ways:
- My GitHub Profile: https://github.com/MacLemon
- Twitter: https://twitter.com/mlbackup
- eMail: mlbackup@maclemon.at



Bug Reports:
-------------------------------------------------------------------------------
If you find a bug in mlbackup please open an issue at the [mlbackup issues](https://github.com/MacLemon/mlbackup/issues) page on Github!


When reporting a bug, please tell us how we can reproduce the bug. Please also include the configuration file you use when the bug occurs. Also include rsync.log and error.log of the backup where the bug showed up. To provide Debug output, please add MLdebug=1 to your config. This will spit out vast amounts of debugging information that will help track down the problem. Don't forget to remove that line again or set MLdebug=0 if you don't need it anymore. It will speed up your backups considerably.


Enjoy using mlbackup!

Best Regards
Pepi Zawodsky