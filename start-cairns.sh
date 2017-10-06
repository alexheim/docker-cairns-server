#!/bin/bash
WEBREPO=http://etractive.de/cairns
BOOTJAR=cairns.jar
BOOTCFG=application.properties

cd /application

if [ -e $BOOTJAR ]
then
    curl -o $BOOTJAR -z cairns.jar $WEBREPO/$BOOTJAR
else
    curl -o $BOOTJAR $WEBREPO/$BOOTJAR 
fi

if [ -e $BOOTCFG ]
then
    curl -o $BOOTCFG -z cairns.jar $WEBREPO/$BOOTCFG
else
    curl -o $BOOTCFG $WEBREPO/$BOOTCFG 
fi

java -jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $BOOTJAR