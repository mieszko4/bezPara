#!/bin/sh
if ps -ef | grep -v grep | grep bezPara/index.js ; then
	exit 0
else
	/usr/local/bin/node /home/milosz/projects/bezPara/index.js >> /home/milosz/projects/bezPara/output.log &
	exit 0
fi
