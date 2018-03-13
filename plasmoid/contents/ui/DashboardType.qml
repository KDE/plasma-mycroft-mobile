import QtQuick 2.9
import QtQml.Models 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Rectangle {
    id: dashbdtypebg
    height: cbheight / 1.1
    width: cbwidth
    color: theme.backgroundColor
    property alias dashlvmodel: dashboardmodelview.model

ListView {
     id: dashboardmodelview
     anchors.fill: parent
     model: dashLmodel
     spacing: 4
     focus: false
     interactive: true
     clip: true;
     delegate: DashboardDelegate{}
     ScrollBar.vertical: ScrollBar {
        active: true
      }
    }
}

