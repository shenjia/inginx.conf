#!/bin/bash
echo "-------------------------------------------------------------------" 
echo "Before you continue: "
echo ""
echo "    1. Make sure you already BACKUPED all of your nginx configs."
echo ""
echo "    2. Make sure you are in [ nginx/conf ] directory right now."
echo ""
echo "    3. [ wget ] and [ unzip ] installed."
echo "-------------------------------------------------------------------"

echo -e "Is everything ok? (y/n):\c"
read ok

if [ $ok = "y" ]
then
	echo "Downloading inginx.conf ( from Github )..."
	wget https://github.com/shenjia/inginx.conf/zipball/master --no-check-certificate -O /tmp/inginx.conf.zip 1>/dev/null 2>&1
	echo "Extracting inginx.conf ..."
	unzip /tmp/inginx.conf.zip 1>/dev/null 2>&1
	echo "Deploying inginx.conf ..."
	cp -Rf shenjia-inginx.conf*/conf/* .
	echo "Remove temporary files ..."
	rm -rf shenjia-inginx.conf*
	rm -rf /tmp/inginx.conf.zip
	echo "Done."
	exit 0
else
	exit -1
fi
