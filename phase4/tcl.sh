# Tcl Phase 4
tar -xf ../$(basename $PKG_TCLDOCS) --strip-components=1
SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man

make

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.9|/usr/lib/tdbc1.1.9|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9/library|/usr/lib/tcl9.0|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9|/usr/include|"            \
    -i pkgs/tdbc1.1.9/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.3.1|/usr/lib/itcl4.3.1|" \
    -e "s|$SRCDIR/pkgs/itcl4.3.1/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.3.1|/usr/include|"            \
    -i pkgs/itcl4.3.1/itclConfig.sh

unset SRCDIR

if $RUN_TESTS
then
    set +e
    make test
    set -e
fi

make install

chmod u+w /usr/lib/libtcl9.0.so

make install-private-headers

ln -sf tclsh9.0 /usr/bin/tclsh

mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

mkdir -p /usr/share/doc/tcl-9.0.0
cp -r  ../html/* /usr/share/doc/tcl-9.0.0

