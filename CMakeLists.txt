cmake_minimum_required(VERSION 3.16)

project(eloko_te VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick WebView Network)

qt_standard_project_setup()

set(CPP_SOURCES
    include/admin.h
    include/request.h
    include/response.h
    include/operations.h
    include/courseListData.h
    include/courseListModel.h
    include/syllabusListData.h
    include/syllabusListModel.h
    include/syllabussearchfilterproxymodel.h

    src/admin.cpp
    src/request.cpp
    src/response.cpp
    src/operations.cpp
    src/courseListData.cpp
    src/courseListModel.cpp
    src/syllabusListData.cpp
    src/syllabusListModel.cpp
    src/syllabussearchfilterproxymodel.cpp
)

include_directories(include/)
include(libs/android_openssl/android_openssl.cmake)

qt_add_executable(appeloko_te
    src/main.cpp
    ${CPP_SOURCES}
)

set(QML_FONTS
    forms/fonts/static/Montserrat-Regular.ttf
    forms/fonts/static/Montserrat-Bold.ttf
    forms/fonts/static/Montserrat-Light.ttf
    forms/fonts/static/Montserrat-Thin.ttf
)

set(QML_IMG
    forms/assets/login-banner.jpg
    forms/assets/maths.png
    forms/assets/back.png
    forms/assets/pdf.png
    forms/assets/user.png
    forms/assets/plus.png
    forms/assets/plus-1.png
    forms/assets/minus-button.png
    forms/assets/info.png
)

set(QML_SINGLETON
    forms/qml/Typography.qml
    forms/qml/Assets.qml
)

set(QML_SOURCES
    forms/qml/Main.qml
    forms/qml/RegistrationStackView.qml
    forms/qml/pages/LoginPage.qml
    forms/qml/pages/SignUpPage.qml
    forms/qml/pages/HomePage.qml
    forms/qml/pages/SyllabusPage.qml
    forms/qml/components/CourseItemDelegate.qml
    forms/qml/components/SyllabusItemDelegate.qml
    forms/qml/pages/SyllabusLessonsPage.qml
    forms/qml/components/SyllabusLessonItemDelegate.qml
    forms/qml/pages/ReadingPage.qml
    forms/qml/components/ProfileMenu.qml
    forms/qml/components/ErrorMsg.qml
    forms/qml/components/IsLoadingItem.qml
    forms/qml/pages/AdminsPage.qml
    forms/qml/components/CourseForm.qml
    forms/qml/components/SyllabusForm.qml
    forms/qml/components/AddLessonForm.qml
    ${QML_SINGLETON}
)

set_source_files_properties(${QML_SINGLETON} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appeloko_te
    URI eloko_te
    VERSION 1.0
    RESOURCES ${QML_IMG}
    RESOURCES ${QML_FONTS}
    QML_FILES ${QML_SOURCES}
)

if (ANDROID)
    add_android_openssl_libraries(appeloko_te)
endif()


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appeloko_te PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appeloko_te
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appeloko_te
    PRIVATE Qt6::Quick Qt6::WebView Qt6::Network
)

include(GNUInstallDirs)
install(TARGETS appeloko_te
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
