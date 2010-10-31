#!/bin/sh

# Holger Levsen, 2010, GPL2 licenced

#
# this is work in progress
# atm it still depends on the debian-edu builds running on a.skolelinux.no, which commits
# it's result to the debian-edu svn repo
#

set -e

# FIXME: ~holger is not the best path...
EDU_REPO=~holger/edu-build
DEBIAN_CD=~debian-cd/build/debian-cd

# FIXME: we also want to build the DVD, but later
suite=squeeze-test-amd64-i386-netinst

# update pkglists from debian-edu svn repo
cd $EDU_REPO && svn up

# actually build the image
cd $DEBIAN_CD
grep -v '^#' $EDU_REPO/CD-administrator/wantedpkglist-$suite.txt > debian-cd/tasks/squeeze/debian-edu
grep -v '^#' $EDU_REPO/CD-administrator/unwantedpkglist-$suite.txt > debian-cd/tasks/squeeze/debian-edu-exclude
# todo:

# call easy-build.sh correctly
# use sort_deps_edu instead of sort_deps
#
# depends on "svn up" in ~debian-cd on pettersson
