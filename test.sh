#!/bin/bash
if [ ! $1 = '' ]
then
	ppp=$1
else
	ppp=`nginx -V 2>&1`
fi
ppp=${ppp#*conf-path=}
ppp=${ppp%%--*}
ppp=${ppp%/*}
echo $ppp
