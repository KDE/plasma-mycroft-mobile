/* Copyright 2016 Aditya Mehra <aix.m@outlook.com>                            

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) version 3, or any
    later version accepted by the membership of KDE e.V. (or its
    successor approved by the membership of KDE e.V.), which shall
    act as a proxy defined in Section 6 of version 3 of the license.
    
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
    
    You should have received a copy of the GNU Lesser General Public
    License along with this library.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.9
import QtQml.Models 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.WebSockets 1.0
import QtWebKit 3.0
import Qt.labs.settings 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.private.mycroftplasmoidmobile 1.0 as PlasmaLa
import org.kde.plasma.private.volume 0.1

PlasmaComponents.ToolButton {
        id: rootIcon
        Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
        Plasmoid.toolTipMainText: i18n("Mycroft")
        Layout.preferredWidth: units.gridUnits * 2
        Layout.preferredHeight: units.gridUnits * 2
        iconSource: "audio-input-microphone"
        property variant getWidth
        property variant getHeight
        property variant getY
        property alias rDrawer: rootDrawer
        
            Timer {
                id: timer
            }
        
        function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }
        
        onClicked: {
            rootDrawer.open()
            } 
            
        Component.onCompleted: {
            delay(4000, function() {
            getHeight = plasmoid.availableScreenRect.height
            getWidth = plasmoid.availableScreenRect.width
            getY = plasmoid.availableScreenRect.y
            });
        }
        
Drawer {
    id: rootDrawer
    width: getWidth
    height: getHeight
    y: getY
    //edge: Qt.LeftEdge
    dragMargin: 0
    z: 1000
    
    MainPage{
        id: mainPageComponent
        anchors.fill: parent
        z: 1000
        }
    }
}
