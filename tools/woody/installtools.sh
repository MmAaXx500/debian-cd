#!/bin/bash

# Install files in /install and some in /doc
# 26-dec-99 changes for i386 (2.2.x) bootdisks --jwest
# 11-mar-00 added sparc to boot-disk documentation test  --jwest
# 30-jun-00 synced with potato updates --jwest
# 05-JUL-00 added CODENAME1 and test for existance of woody bootdisks --jwest
set -e

# The location of the tree for CD#1, passed in
DIR=$1

DOCDIR=doc

if [ -e $MIRROR/dists/$CODENAME/main/disks-$ARCH/current/$DOCDIR ] ; then
        CODENAME1=$CODENAME
else
        echo "Using potato bootdisk documentation"
        CODENAME1=potato
fi


# Put the install documentation in /install
cd $MIRROR/dists/$CODENAME1/main/disks-$ARCH/current/$DOCDIR
mkdir -p $DIR/install/$DOCDIR
cp -a * $DIR/install/$DOCDIR/
ln -sf install.en.html $DIR/install/$DOCDIR/index.html

# Put the boot-disk documentation in /doc too
mkdir -p $DIR/doc/install
cd $DIR/doc/install
for file in ../../install/$DOCDIR/*.{html,txt}
do
	ln -s $file
done

