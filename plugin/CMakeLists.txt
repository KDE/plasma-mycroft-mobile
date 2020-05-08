find_package(PkgConfig)

kde_enable_exceptions()

set(mycroftplasmoidmobileplugin_SRCS mycroftplasmoidmobileplugin.cpp launchapp.cpp notify.cpp filereader.cpp msmapp.cpp mycroftplasmoid_dbus.cpp)

add_library(mycroftplasmoidmobileplugin SHARED ${mycroftplasmoidmobileplugin_SRCS})

target_link_libraries(mycroftplasmoidmobileplugin Qt5::Gui Qt5::Core Qt5::Qml Qt5::DBus KF5::Plasma KF5::I18n KF5::Notifications)

install(TARGETS mycroftplasmoidmobileplugin DESTINATION ${QML_INSTALL_DIR}/org/kde/private/mycroftplasmoidmobile)

install(FILES qmldir DESTINATION ${QML_INSTALL_DIR}/org/kde/private/mycroftplasmoidmobile)

install(FILES mycroftPlasmoidMobile.notifyrc DESTINATION ${KNOTIFYRC_INSTALL_DIR})
