#!/bin/bash
p=`aoeu 2>&1`
p=${p##*: }
if [[ ${p##*: } == "command not found" ]]; then
	echo "no"
fi 
