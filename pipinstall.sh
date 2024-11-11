#!/usr/bin/env bash
#author:rangapv@yahoo.com
#11-11-2024

#This script will check if the pip package is installed else it will install the same
#this can also be sourced to other program and just call the function pipi_nstall pkg1 pkg2 ...

#usuage: ./pipinstall.sh numpy torch sklearn

pipi_nstall() {

cl=("$@")
cln="$#"
pipv="pip3"
inscnt=0

echo "the total pip packages to check is $cln"

for i in "${cl[@]}"
do
wc=`$pipv show $i`
wcs="$?"

if [[ ( $wcs != "0" ) ]]
then
    echo "\"$i\"  is not installed , proceeding to install the same with $pipv"
    ins_pippak=`$pipv install $i`
else
    echo "\"$i\" is installed proceeding with other checks"
fi
done

}

#pipi_nstall torch numpy
