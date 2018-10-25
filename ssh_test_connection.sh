#!/bin/bash

##Shell script for entering yes while promting for ssh add known host enties.
##Date: 22nd OCT 2018
##Add username which will be used for making ssh connection from source to target server.

username=vagrant

echo "=========START Verification [`date`]===========" >> status.out

###2: Read IP from server.txt file.

for server in $(cat server.txt);do
#timeout 4s
echo -e "Server" $server
echo yes yes | sudo -S ssh -T $username@$server

if [ $? -ne 0 ] ;then
        echo "$server verification failed" >> status.out
else
        echo "$server verification sucess" >> status.out
fi
done

echo "=========END verification [`date`]===========" >> status.out

