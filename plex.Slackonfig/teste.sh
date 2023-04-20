#!/bin/bash

newpkg=$(ls /tmp/plexmediaserver*.t?z)
oldpkg=$(ls /var/lib/pkgtools/packages/plexmediaserver*)



echo $oldpkg
echo $newpkg


upgradepkg "$oldpkg"%"$newpkg"
up
