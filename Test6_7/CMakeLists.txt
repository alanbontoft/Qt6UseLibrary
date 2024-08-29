cmake_minimum_required(VERSION 3.16)

project(Test6_7 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(HOME_PROJECT_DIR /home/alan/github)
set(LIB_INCLUDE_DIR ${HOME_PROJECT_DIR}/Qt6UseLibrary/Test6_7/libraries/inc)
set(LIB_LINK_DIR ${HOME_PROJECT_DIR}/Qt6UseLibrary/Test6_7/libraries/lib)
set(MYQTLIB MyQtLib)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick SerialPort)

# Note: It is important to place this before the call to add_executable!
link_directories(${PROJECT_NAME} PRIVATE ${LIB_LINK_DIR})


qt_standard_project_setup()

qt_add_executable(appTest6_7
    main.cpp
)

qt_add_qml_module(appTest6_7
    URI Test6_7
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES myclass.h myclass.cpp
        QML_FILES UI/Navigator.qml
        RESOURCES Images/searchdoc.png
        RESOURCES Images/cross.png
        QML_FILES UI/TitleBar.qml
        QML_FILES UI/MainScreen.qml
        QML_FILES UI/ScreenOne.qml
        QML_FILES UI/ScreenTwo.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTest6_7 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTest6_7
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include_directories(${PROJECT_NAME} PRIVATE ${LIB_INCLUDE_DIR})

target_link_libraries(appTest6_7
    PRIVATE Qt6::Quick Qt6::SerialPort ${MYQTLIB}
)

include(GNUInstallDirs)

install(TARGETS appTest6_7
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
