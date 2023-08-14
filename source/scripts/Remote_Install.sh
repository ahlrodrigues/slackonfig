#!/bin/bash
USERNAME=someUser
HOSTS="host1 host2 host3"
SCRIPT="pwd; ls"
for HOSTNAME in ${HOSTS} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done




#When ssh'ing to the remote machine, how to handle when it prompts for RSA fingerprint authentication.
#
#You can add the StrictHostKeyChecking=no option to ssh:
#
#ssh -o StrictHostKeyChecking=no -l username hostname "pwd; ls"
#
#This will disable the host key check and automatically add the host key to the list of known hosts. If you do not want to have the host added to the known hosts file, add the option -o UserKnownHostsFile=/dev/null.
