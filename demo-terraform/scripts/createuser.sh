#!/bin/bash
# This script will create multiple user in the file name "userlist"
# Default password is 123456

set -e
set -o pipefail

if [[ ! -f userlist ]]
then
        echo "We cannot find list user"
        exit 1
fi

if [[ ! -s userlist ]]
then
        echo "File userlist is empty, we didn't create any users!."
        exit 1
fi

while read user
do
        echo "Creating user ${user}"
        # Create user <user>
        useradd -ms /bin/bash ${user}
        # Create the default password 123456
        echo "${user}:123456" | chpasswd
done<userlist
