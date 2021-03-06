#!/bin/bash

rm archive*

wget http://pastebin.com/archive
cat archive | grep i_p0 > swap

cat swap \
	|sed "s/<a href/\\n<a href/g" \
	|sed 's/\"/\"><\/a>\n/2' \
	|grep href \
	|sed -e :a -e 's/<a href="//g' \
	|sed "s/\"><\/a>//g" \
	|uniq \
	> archive

rm swap
