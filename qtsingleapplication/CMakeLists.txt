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

IF(STANDALONE_EXTERN_BUILD)

	INSTALL(TARGETS QtSolutions_SingleApplication
		RUNTIME DESTINATION ${EXTERN_BIN_DIRECTORY}
		LIBRARY DESTINATION ${EXTERN_BIN_DIRECTORY}
		ARCHIVE DESTINATION ${EXTERN_LIB_DIRECTORY}
	)

ELSE(STANDALONE_EXTERN_BUILD)

	IF(USE_SHARED_OBJECTS)

		IF(UNIX AND NOT APPLE)
			INSTALL(TARGETS QtSolutions_SingleApplication
				RUNTIME DESTINATION /usr/local/movial/lib
				LIBRARY DESTINATION /usr/local/movial/lib
				)
		ELSE(UNIX AND NOT APPLE)
			INSTALL(TARGETS QtSolutions_SingleApplication
				RUNTIME DESTINATION .
				LIBRARY DESTINATION .
				)
		ENDIF(UNIX AND NOT APPLE)

	ENDIF(USE_SHARED_OBJECTS)

ENDIF(STANDALONE_EXTERN_BUILD)

