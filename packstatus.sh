#!/usr/bin/env bash
#author: rangapv@yahoo.com
# this scipt can be used universaly for getting the status of a package present 

source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) > /dev/null 2>&1

dependsit() {

echo "Checking to see if you have \"bc\" and \"certbot\" installed in the box"

chkifinsta bc certbot vgb 

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
    yesinstall $i
    insdep=1 
fi

done

if (( $insdep == 1 ))
then
   echo "Install all the dependencies and proceed after, exiting now"
   exit
fi

}

yesinstall() {
   cmd3="$@"
   echo "press \"y\" key to nstall $cmd3"
   read input

   if [ "$input" == "y" ]
   then
      echo "Since this is a \"$ki\" box using \"$cm1\" to install \"$cmd3\""
      sudo $cm1 -y install $cmd3
   else
     echo "user pressed \"no\" for \"$cmd3\" install"
   fi
}

chkifinsta bc certbot vgb 
