#!/bin/bash

PATH=/cygdrive/c/qt/2009.03/qt/bin:/cygdrive/c/qt/2009.03/mingw/bin/:$PATH
qmake glogg.pro -spec win32-g++ -r CONFIG+=release
mingw32-make
cp /cygdrive/c/qt/2009.03/qt/bin/{QtCore4,QtGui4}.dll release/
cp /cygdrive/c/qt/2009.03/mingw/bin/{libexpat-1,mingwm10}.dll release/
VERSION=`git describe`
echo Generating binary distribution for glogg-$VERSION
rm glogg-$VERSION-win32.zip
cd release
zip -9 ../glogg-$VERSION-win32.zip *.dll *.exe
cd ..
echo Generating installer for glogg-$VERSION
/cygdrive/c/Program\ Files/NSIS/makensis -DVERSION=$VERSION glogg.nsi
