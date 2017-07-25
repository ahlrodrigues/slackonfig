#!/bin/sh
# Cleanup /tmp however, do not remove sockets for X

# No lost+found with reiserfs
find /tmp/lost+found -exec /bin/touch {} \;
find /tmp -type s -exec  /bin/touch {} \;
find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;
find /tmp -type f -mtime +37 -exec rm -rf {} \; 
