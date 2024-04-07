#!/bin/bash


echo -e "
+-+-+-+-+-+ +-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+
    _              ___                      _     
| |   ___  ___ | __> ___  _ _  ___ ._ _ <_>__  
| |_ / . \/ . || _> / . \| '_>/ ._>| ' || |\ \/
|___|\___/\_. ||_|  \___/|_|  \___.|_|_||_|/\_\
  <Made By Azam > '                                                                                                                                                           
+-+-+-+-+-+-+-+-+-+ +-+ +-+-+-+-+-+-+-+-+-+-+-+
" 

echo -e " Collecting necessary logs.. \n"

#Creating folder & files
mkdir /opt/lf
mkdir /opt/lf/var_logs
mkdir /opt/lf/tmp_files
mkdir /opt/lf/root_bashhistory
mkdir /opt/lf/user_bashhistory
mkdir /opt/lf/cron_copy
mkdir /opt/lf/accounts
touch /opt/lf/timezone
touch /opt/lf/netstat_out
touch /opt/lf/ipaddr
touch /opt/lf/ifconfig
touch /opt/lf/crontab_out
touch /opt/lf/ps_out
touch /opt/lf/release
touch /opt/lf/wtmp
touch /opt/lf/utmp
touch /opt/lf/lastlog
touch /opt/lf/accounts/passwd 
touch /opt/lf/accounts/shadow
touch /opt/lf/accounts/sudoers
touch /opt/lf/accounts/group  

#Copying logs
cp -R /var/log/* /opt/lf/var_logs
cp -R /tmp/* /opt/lf/tmp_files
cp /root/.bash_history /opt/lf/root_bashhistory

#Loop over each user and copy their bash_history.
for user in $(cut -f1 -d: /etc/passwd); do cp /home/$user/.bash_history /opt/lf/user_bashhistory/$user &> /dev/null; done

cat /etc/*-release > /opt/lf/release

#Network Connections/Socket Stats
#netstat checking mechanism
NETSTATINSTALLED=$(netstat | grep -cs 'Active Internet connections')
if [[ $NETSTATINSTALLED == 1 ]]
then
	echo -e " netstat installed!"
	netstat -antp > /opt/lf/netstat_out
else
	echo -e " netstat not installed!"
	sudo apt-get install net-tools -y #for debian-based os
	netstat -antp > /opt/lf/netstat_out
fi

#grab host network interface configuration
DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
if [[ $DISTRO == "debian" ]]
then
	IPAINSTALLED=$(ip a | grep -cs 'command not found')

	if [[ $IPAINSTALLED == 1 ]]
	then
		echo -e " ip a not installed!"
		sudo apt-get install net-tools -y
		ip a > /opt/lf/ipaddr
	else
		echo -e " ip a installed!"
		ip a > /opt/lf/ipaddr
	fi
elif [[ $DISTRO == "ubuntu" ]]
then
	IFCONFIGINSTALLED=$(ifconfig | grep -cs 'command not found')

	if [[ $IFCONFIGINSTALLED == 1 ]]
	then
		echo -e " ifconfig not installed!"
		sudo apt-get install net-tools -y
		ifconfig > /opt/lf/ifconfig
	else
		echo -e " ifconfig installed!"
		ifconfig > /opt/lf/ifconfig
	fi
elif [[ $DISTRO == '"rhel"' ]]
then
	IFCONFIGINSTALLED=$(ifconfig | grep -cs 'command not found')

	if [[ $IFCONFIGINSTALLED == 1 ]]
	then
		echo -e " ifconfig not installed!"
		sudo yum -y install net-tools
		ifconfig > /opt/lf/ifconfig
	else
		echo -e " ifconfig installed!"
		ifconfig > /opt/lf/ifconfig
	fi
else
	echo -e "\n Unknown distro! Collect host network info manually."
	uname -a
fi

#List process tree
ps -auxwf > /opt/lf/ps_out

#Dumping utmp & wtmp
for f in $(ls /var/log/wtmp*); do utmpdump $f >> /opt/lf/wtmpdump_output.txt; done
for f in $(ls /var/run/utmp*); do utmpdump $f >> /opt/lf/utmpdump_output.txt; done
cp /var/run/utmp* /opt/lf/var_logs

#Deleted binaries which are still running
ls -alr /proc/*/exe 2> /dev/null | grep deleted

#Hidden Directories and Files
find / -type d -name ".*"

#Executables on file system
find / -type f -exec file -p '{}' \; |  grep ELF

#Hidden Executables on file system
find / -name ".*" -exec file -p '{}' \; | grep ELF

cp -R /etc/cron* /opt/lf/cron_copy
for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l &> /dev/null > /opt/lf/crontab_out; done
#Loop over each username and list out their crontab.

#Copying user accounts details
cat /etc/passwd > /opt/lf/accounts/passwd
cat /etc/shadow > /opt/lf/accounts/shadow
cat /etc/sudoers > /opt/lf/accounts/sudoers
cat /etc/group > /opt/lf/accounts/group

#Host time zone
timedatectl > /opt/lf/timezone

#Lastlog
lastlog > /opt/lf/lastlog

#List folder contents
find /opt/lf/ -print > /opt/lf/list_files

#Compressing folder
cd /opt/
tar -czf $(hostname).tar.gz lf

#MD5sum tar file
echo -e "\n MD5 = ` md5sum $(hostname).tar.gz `\n"

#Removing files & folder after completion
rm -rf /opt/lf

#Changing file owner
currentuser=$(who | awk '{print $1}')
sudo chown -R $currentuser:$currentuser /opt/$(hostname).tar.gz

echo -e " Done! File located at: /opt/$(hostname).tar.gz\n"
