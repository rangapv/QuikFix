#!/usr/bin/env bash
#author:rangapv@yahoo.com
#02-11-24

#TO-run
#vercheck new-version-number command-to-execute-to-get-current-version library-call

vercheck() {

vrchk=("$@")
#echo "vrchk is $vrchk"
vrchk21="${vrchk[1]}"
newver="${vrchk[0]}"
libadd="${vrchk[2]}"

vrchk2=`eval "$vrchk21"`
vrarg3=($(echo ${vrchk2} | awk '{len=split($0,a,"."); for (n=0;n<=len;n++) print a[n]}'))
vrarg4=($(echo ${newver} | awk '{len=split($0,a,"."); for (n=0;n<=len;n++) print a[n]}'))
lvrarg3=${#vrarg3[@]}
lvrarg4=${#vrarg4[@]}

upgradeflag="0"

if [ "$newver" == "$vrchk2" ]
then
        echo "No upgrade required"
        echo "The requested version $newver and the current version $vrchk2 are the SAME"
else

 if [ "$lvrarg3" -gt "$lvrarg4" ]
 then
 for ((n=0;n<$lvrarg3;n++))
 do
    if [ "$lvrarg4" -eq "$n" ]
    then
	    break
    fi

    if [ "${vrarg4[n]}" -eq "${vrarg3[n]}" ]
    then
       n=+1
    fi

    if [ "${vrarg4[n]}" -gt "${vrarg3[n]}" ]
    then
        echo "Upgrade required 1"
        upgradeflag="1"
        break
    fi
    echo "comparing ${vrarg4[n]} and ${vrarg3[n]}"
 done
 fi

 if [ "$lvrarg3" -lt "$lvrarg4" ]
 then
 for((n=0;n<$lvrarg4;++n))
 do 
    if [ "$lvrarg3" -eq "$n" ]
    then
         upgradeflag="1"
         break
    fi

    if [ "${vrarg4[n]}" -gt "${vrarg3[n]}" ]
    then
        echo "Upgrade required 2"
        upgradeflag="1"
        break
    fi
 done
 fi

 if [ "${lvrarg3}" -eq "${lvrarg4}" ]
 then
 for ((n=0;n<$lvrarg4;n++))
 do

    if [ "${vrarg4[n]}" -gt "${vrarg3[n]}" ]
    then
        echo "Upgrade required 2"
        upgradeflag="1"
        break
    fi
 done
 fi


 if [ $upgradeflag -eq 1 ]
 then
         echo "The current version $vrchk2 is behind than the requested version $newver "
         echo "Upgrading package"
         #un-comment the following variable when ready to execute the library
         #$libadd
 else
	 echo "No upgrade required"
	 echo "The current version $vrchk2 is newer than the requested version $newver "
 fi

fi
}

print_echo() {
echo "newver is $newver"
echo "vrchk21 is $vrchk21"
echo "libadd is $libadd"
echo "lvrarg3 is $lvrarg3"
echo "lvrarg4 is $lvrarg4"
echo "vrchk1 is $vrchk2"
echo "vrchk2 is $newver"
echo "vrarg3 is ${vrarg3[@]}"
echo "vrarg4 is ${vrarg4[@]}"
}

vercheck 1.4.0 "python3 -c \"import zlib;print(zlib.ZLIB_RUNTIME_VERSION)\"" zlibadd
#print_echo
