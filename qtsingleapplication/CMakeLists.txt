# fix lib-dir for osx
# Jan 13, 2017, Jukka Lehtniemi (Cisco Systems, Inc.)

# CMake changes to build standalone
# Oct 14, 2016, Jukka Lehtniemi (Cisco Systems, Inc.)

# BTUC-8049: Remove support for building against Qt 4
# Mar 31, 2015, Juho Frits (Cisco Systems, Inc.)

# BTUC-1392: Use CMake policy CMP0020 only if it exists
# Jan 15, 2014, Juho Frits (Cisco Systems, Inc.)

# BTUC-1392: Set CMake policy regarding Qt::WinMain
# Setting the CMake policy prevents CMake 2.8.12 from
# complaining about the changed policy regarding linking
# against Qt::WinMain.
# Jan 14, 2014, Juho Frits (Cisco Systems, Inc.)

# BTUC-1392: Qt 5 build fixes for Windows
# Jan 3, 2014, Juho Frits (Cisco Systems, Inc.)

# BTUC-1392: Fixes for linking against externs built with Qt 5
# Dec 31, 2013, Juho Frits (Cisco Systems, Inc.)

# BTUC-1392: CMake fixes for building QtSingleApplication with Qt 5
# Dec 30, 2013, Juho Frits (Cisco Systems, Inc.)

# BTUC-742: changed BtbcCrashService to use QtSingleCoreApplication
# so we can ensure one running instance. Updated CrashReporter source
# accordingly.
# Dec 3, 2012, Teemu Patja (Cisco Systems, Inc.)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.9)
IF(POLICY CMP0020)
	CMAKE_POLICY(SET CMP0020 OLD)
ENDIF()

PROJECT(QtSingleApplication)

FIND_PACKAGE(Qt5 COMPONENTS Core Network Widgets REQUIRED)

SET(CMAKE_AUTOMOC ON)
SET(CMAKE_INCLUDE_CURRENT_DIR ON)

IF(WIN32)
	ADD_DEFINITIONS( -DUNICODE )
ENDIF()

SET(HEADERS
	src/qtlocalpeer.h
	src/qtsingleapplication.h
	src/qtsinglecoreapplication.h
	src/QtSingleApplication
)

SET(SOURCES
	src/qtlocalpeer.cpp
	src/qtsingleapplication.cpp
	src/qtsinglecoreapplication.cpp
)

ADD_LIBRARY(QtSolutions_SingleApplication SHARED
	${SOURCES}
	${HEADERS}
)

ADD_DEFINITIONS(-DQT_QTSINGLEAPPLICATION_EXPORT)

QT5_USE_MODULES(QtSolutions_SingleApplication Core Network Widgets)

IF(WIN32)
	set(LIBDEST bin)
ELSE()
	set(LIBDEST lib)
ENDIF()

INSTALL(TARGETS QtSolutions_SingleApplication
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION ${LIBDEST}
	ARCHIVE DESTINATION lib
)

install(FILES ${HEADERS} DESTINATION include)
