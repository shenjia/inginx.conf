#!/bin/bash
echo "-------------------------------------------------------------------" 
echo "Before you continue: "
echo ""
echo "    1. Make sure you already BACKUPED all of your nginx configs."
echo ""
echo "    2. Make sure you got [ wget ] and [ unzip ] installed."
echo "-------------------------------------------------------------------"

# Get [ nginx/conf ] path
if [ ! $1 = '' ]; then
        # Get deploy path from shell parameter
        deploypath=$1
else
        # Try to get deploy path from `nginx -V`
        p=`nginx -V 2>&1`

        if [[ ${p##*: } == "command not found" ]]; then
                # Fail to get deploy path
                echo "Failed to get deploy path because [ nginx ] command not found"
                echo "Please run this script again with deploy path as parameter."
                exit -1;
        else
                # We have deploy path now
                p=${p#*conf-path=}
                p=${p%%--*}
                p=${p%/*}
                deploypath=$p
        fi
fi

# Confirm to deploy
echo -e "Deploy inginx.conf to [ $deploypath ]? (y/n):\c"
read ok

if [ $ok = "y" ]; then
        # Deploy
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
        # Cancel
        exit -1
fi
