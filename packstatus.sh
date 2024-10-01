#!/usr/bin/env bash
#author: rangapv@yahoo.com
# this scipt can be used universaly for getting the status of a package present 


dependsit() {

echo "Checking to see if you have \"bc\" and \"certbot\" installed in the box"

chkifinsta bc certbot 

}

chkifinsta() {

cmd1=("$@")
tcmd="$#"
insdep=0

echo "the total depedency to check is $tcmd"

for i in "${cmd1[@]}"
do

wc=`which $i`
wcs="$?"

if [[ ( $wcs == "0" ) ]]
then
    echo "\"$i\" is installed proceeding with other checks"
else
    echo "\"$i\"  is not installed .pls install it and then re-run this script for other tasks"
    insdep=1 
fi

done

if (( $insdep == 1 ))
then
   echo "Install all the dependencies and proceed after, exiting now"
   exit
fi

}

chkifinsta bc certbot 