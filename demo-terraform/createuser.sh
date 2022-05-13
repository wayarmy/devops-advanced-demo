#!/usr/bin/env bash

#Simple Script to Create Multiple Users in Linux

#Users list in a file. 
USERFILE=$1

if [ "USERFILE" = "" ]
  then
          echo "Please specify the input users file!"
          exit 35
elif test -e $USERFILE
  then
        for user in `cat $USERFILE`
        do 
                echo "Creating the "$user" user."
                        useradd -m $user --shell /bin/bash ; echo "$user:123456" | chpasswd
        done
        exit 40
else 
        echo "Invalid input users file"
        exit 45
fi