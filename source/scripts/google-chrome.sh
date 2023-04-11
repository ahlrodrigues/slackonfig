#!/bin/sh

# Copyright 2009-2010  Erik Hanson, Minneapolis, MN, USA
# Copyright 2011, 2015, 2019  Patrick J. Volkerding, Sebeka, MN, USA
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


PKGNAM=google-chrome
RELEASE=${RELEASE:-stable}    # stable, beta, or unstable

# Wget .deb pkg
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Allow $ARCH to be preset before running the script.  This is useful in the
# case where someone is running a 32-bit chroot environment under an x86_64
# kernel:
ARCH=${ARCH:-$(uname -m)}

case "$ARCH" in
  i?86) DEBARCH="i386" ; LIBDIRSUFFIX="" ; ARCH=i386 ;;
  x86_64) DEBARCH="amd64" ; LIBDIRSUFFIX="64" ; ARCH=x86_64 ;;
  *) echo "Package for $(uname -m) architecture is not available." ; exit 1 ;;
esac
# Get the version from the Debian/Ubuntu .deb (thanks to Fred Richards):
VERSION=$(ar p google-chrome-${RELEASE}_current_${DEBARCH}.deb control.tar.xz 2> /dev/null | tar JxO ./control 2> /dev/null | grep Version | awk '{print $2}' | cut -d- -f1)
if [ -z "$VERSION" ]; then # try to use control.tar.gz instead:
  VERSION=$(ar p google-chrome-${RELEASE}_current_${DEBARCH}.deb control.tar.gz 2> /dev/null | tar zxO ./control 2> /dev/null | grep Version | awk '{print $2}' | cut -d- -f1)
fi
BUILD=${BUILD:-1}

if [ ! $UID = 0 ]; then
  cat << EOF

This script must be run as root.

EOF
  exit 1
fi

if ! /bin/ls google-chrome-*.deb 1> /dev/null 2> /dev/null ; then
  cat << EOF

This is a script to repackage a Debian/Ubuntu Google Chrome .deb package
for Slackware.  Run this script in the same directory as one of these
binary packages:

  google-chrome-stable_current_amd64.deb  (for 64-bit x86_64)
  google-chrome-stable_current_i386.deb   (for 32-bit x86)
  
This will create a Slackware .txz package.  Install it with installpkg
or use upgradepkg to upgrade from a previous version.

EOF
  exit 1
fi

CWD=$(pwd)
TMP=${TMP:-/tmp}
PKG=$TMP/package-$PKGNAM
OUTPUT=${OUTPUT:-/tmp}

rm -rf $PKG
mkdir -p $TMP $PKG $OUTPUT
cd $PKG
ar p $CWD/google-chrome-${RELEASE}_current_${DEBARCH}.deb data.tar.xz | tar xJv || exit 1
chown -R root:root .
chmod -R u+w,go+r-w,a-s .

# Make sure top-level perms are correct:
chmod 0755 .
# This needs to be setuid root:
chmod 4711 opt/google/chrome/chrome-sandbox
# The cron job is for Debian/Ubuntu only:
rm -rf etc

# Link to the standard Mozilla library names:
sed -i 's,libnss3.so.1d,libnss3.so\x00\x00\x00,g;
        s,libnssutil3.so.1d,libnssutil3.so\x00\x00\x00,g;
        s,libsmime3.so.1d,libsmime3.so\x00\x00\x00,g;
        s,libssl3.so.1d,libssl3.so\x00\x00\x00,g;
        s,libplds4.so.0d,libplds4.so\x00\x00\x00,g;
        s,libplc4.so.0d,libplc4.so\x00\x00\x00,g;
        s,libnspr4.so.0d,libnspr4.so\x00\x00\x00,g;' opt/google/chrome/chrome

# --mandir=/usr/man:
mv $PKG/usr/share/man $PKG/usr/man
# Compress manual pages:
find $PKG/usr/man -type f -exec gzip -9 {} \;
for i in $( find $PKG/usr/man -type l ) ; do
  ln -s $( readlink $i ).gz $i.gz
  rm $i
done

# Install a .desktop launcher:
sed -i -e "s#Icon=google-chrome#Icon=/opt/google/chrome/product_logo_256.png#" \
  $PKG/usr/share/applications/google-chrome.desktop

mkdir -p $PKG/install
cat $CWD/slack-desc > $PKG/install/slack-desc

cd $PKG
/sbin/makepkg -l y -c n $OUTPUT/$PKGNAM-$VERSION-$ARCH-$BUILD.txz

