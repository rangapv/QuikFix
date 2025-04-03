#!/usr/bin/env bash
while (true)
do
        {
        pid1=`pidof /usr/bin/dpkg`
        if [[ ( ! -z "$pid1" ) ]]
        then
        ki1=`sudo kill -9 $pid1`
        pid2=`sudo rm -r /var/lib/dpkg/lock`
        pid3=`sudo rm -r /var/lib/dpkg/lock-frontend`
        else
                break
        fi
        }
done
