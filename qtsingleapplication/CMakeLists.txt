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

INSTALL(TARGETS QtSolutions_SingleApplication
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION bin
	ARCHIVE DESTINATION lib
)

install(FILES ${HEADERS} DESTINATION include)
