#!/bin/bash


newpkg=$(ls /tmp/plexmediaserver*)
oldpkg=$(ls /var/lib/pkgtools/packages/plexmediaserver*)

upgradepkg $oldpkg%$newpkg
