PROJECT(QtSingleApplication)

QT4_WRAP_CPP(QtSingleApplication_mocs src/qtlocalpeer.h src/qtsingleapplication.h src/qtsinglecoreapplication.h)

IF(USE_SHARED_OBJECTS)
	ADD_LIBRARY(QtSolutions_SingleApplication SHARED
	        src/qtlocalpeer.cpp
	        src/qtsingleapplication.cpp
	        src/qtsinglecoreapplication.cpp
	        ${QtSingleApplication_mocs}
	)
ELSE(USE_SHARED_OBJECTS)
	ADD_LIBRARY(QtSolutions_SingleApplication STATIC
	        src/qtlocalpeer.cpp
	        src/qtsingleapplication.cpp
	        src/qtsinglecoreapplication.cpp
	        ${QtSingleApplication_mocs}
	)
ENDIF(USE_SHARED_OBJECTS)

SET_TARGET_PROPERTIES(QtSolutions_SingleApplication PROPERTIES
	COMPILE_DEFINITIONS QT_QTSINGLEAPPLICATION_EXPORT)

TARGET_LINK_LIBRARIES(QtSolutions_SingleApplication
	${QT_LIBRARIES}
)

IF(USE_SHARED_OBJECTS)
	INSTALL(
		TARGETS QtSolutions_SingleApplication
		RUNTIME DESTINATION .
		LIBRARY DESTINATION .
	)
ENDIF(USE_SHARED_OBJECTS)
