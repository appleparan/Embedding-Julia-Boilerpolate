#!/bin/sh

# inspired by CMockery autogen.sh
# https://github.com/google/cmockery/blob/master/autogen.sh

# If julia not exists or Julia version is lower than 1.1.1, download julia
#if test ! -e julia; then
#    echo "Julia not exists. Download julia-1.1.1 from the web..."
#    curl -L https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.1-linux-x86_64.tar.gz | tar xf
#    rm -rf thirdparty/julia
#    mv julia-1.1.1 thirdparty/julia
##else
##    JULIA_VERSION=`julia -e "print(Base.VERSION)"`
##    echo JULIA_VERSION
#fi

set -ex
rm -rf autom4te.cache

trap 'rm -f aclocal.m4.tmp' EXIT

# Use version 1.9 of aclocal and automake if available.
ACLOCAL=`which aclocal`
if test -z $ACLOCAL; then
	echo "*** No aclocal found, please install the autotools package ***"
	exit 1
fi

AUTOMAKE=`which automake`
if test -z $AUTOMAKE; then
	echo "*** No automake found, please install the autotools package ***"
	exit 1
fi

AUTORECONF=`which autoreconf`
if test -z $AUTORECONF; then
    echo "*** No autoreconf found, please install it ***"
    exit 1
fi

# glibtoolize is used for Mac OS X
LIBTOOLIZE=`which libtoolize`
if test -z $LIBTOOLIZE; then
    LIBTOOLIZE=glibtoolize
fi

if test -z $LIBTOOLIZE; then
    echo "*** No libtool found, please install it ***"
    exit 1
fi

# aclocal tries to overwrite aclocal.m4 even if the contents haven't
# changed, which is annoying when the file is not open for edit (in
# p4).  We work around this by writing to a temp file and just
# updating the timestamp if the file hasn't change.
#"$ACLOCAL" --force -I m4 --output=aclocal.m4.tmp
#if cmp aclocal.m4.tmp aclocal.m4; then
#  touch aclocal.m4               # pretend that we regenerated the file
#  rm -f aclocal.m4.tmp
#else
#  mv aclocal.m4.tmp aclocal.m4   # we did set -e above, so we die if this fails
#fi

# submodule for cmocka, but not working now
# if submodule could get tags (not only branch), it will works
#if ! test -z `which git` && test -d .git; then
#    git submodule update --init --recursive
#
#    if [ $? != 0 ]; then
#        echo "*** Failed to download submodules. Maybe you have a bad connection or a submodule was not forked?"
#        exit 1
#    fi
#fi

#grep -q LIBTOOL configure.ac && "$LIBTOOLIZE" -c -f
#autoconf -f -W all,no-obsolete
#autoheader -f -W all
#"$AUTOMAKE" -a -c -f -W all
autoreconf -Wall,no-obsolete --install --force

echo 
echo "Now type '$srcdir/configure' and 'make' to compile."
echo

rm -rf autom4te.cache
exit 0
