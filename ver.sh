#!/usr/bin/env bash
#author:rangapv@yahoo.com
#02-11-24
#To Check the package version currently installed versus the new version required

vercheck() {
#vrchk=("$@")
#echo "vrchk is $vrchk"
vrchk2="${vrchk[2]}"
vrchk1="$@"
vrchk2=`${vrchk1} -c "import zlib ; print(zlib.ZLIB_RUNTIME_VERSION)"`
newver="1.3.1"
#newver="${vrchk[1]}"

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
  echo "Upgrading package"
  #zlibadd
 else
	 echo "No upgrade required"
 fi

fi
}



print_echo() {
echo "lvrarg3 is $lvrarg3"
echo "lvrarg4 is $lvrarg4"
echo "vrchk1 is $vrchk2"
echo "vrchk2 is $newver"
echo "vrarg3 is ${vrarg3[@]}"
echo "vrarg4 is ${vrarg4[@]}"

}

#clarg1="1.3.2"
#clarg2="python3 -c "import zlib ; print(zlib.ZLIB_RUNTIME_VERSION)"
#vercheck "\${clarg1}" "\${clarg2}"
vercheck python3
#print_echo
