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
                # Nginx command not found
                echo "Failed to get deploy path because [ nginx ] command not found"
                echo "Please run this script again with deploy path as parameter."
                exit -1;
        else
                # Try to get conf-path
                p=${p#*conf-path=}
                p=${p%%--*}
                p=${p%/*}
                if [[ -d $p ]]; then
                    # Path is valid
                    deploypath=$p
                else
                    # Path is invalid
                    echo "Failed to get conf-path from 'nginx -V'."
                    echo "Please run this script again with deploy path as parameter."
                    exit -1;
                fi
        fi
fi

# Confirm to deploy
echo -e "Deploy inginx.conf to [ $deploypath ]? (y/n):\c"
read ok

if [[ $ok == "y" ]]; then
        # Deploy
        echo "Downloading inginx.conf ( from Github )..."
        sudo wget https://github.com/shenjia/inginx.conf/zipball/master --no-check-certificate -O /tmp/inginx.conf.zip 1>/dev/null 2>&1
        echo "Extracting inginx.conf ..."
        sudo unzip /tmp/inginx.conf.zip 1>/dev/null 2>&1
        echo "Deploying inginx.conf ..."
        sudo cp -Rf shenjia-inginx.conf*/conf/* $deploypath
        echo "Remove temporary files ..."
        sudo rm -rf shenjia-inginx.conf*
        sudo rm -rf /tmp/inginx.conf.zip
        echo "Deploy successful, please restart your nginx!"
        exit 0
else
        # Cancel
        exit -1
fi
