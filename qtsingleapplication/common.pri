# BTUC-1392: Upgrade qtsingleapplication sources
# Dec 27, 2013, Juho Frits (Cisco Systems, Inc.)

exists(config.pri):infile(config.pri, SOLUTIONS_LIBRARY, yes): CONFIG += qtsingleapplication-uselib
TEMPLATE += fakelib
QTSINGLEAPPLICATION_LIBNAME = $$qtLibraryTarget(QtSolutions_SingleApplication-head)
TEMPLATE -= fakelib
QTSINGLEAPPLICATION_LIBDIR = $$PWD/lib
unix:qtsingleapplication-uselib:!qtsingleapplication-buildlib:QMAKE_RPATHDIR += $$QTSINGLEAPPLICATION_LIBDIR
