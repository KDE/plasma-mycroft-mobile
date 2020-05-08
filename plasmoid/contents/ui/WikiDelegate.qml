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
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtGraphicalEffects 1.0
                    
Rectangle {
    id: mainRect
    height: headrTitle.height + splitter.height + wikiImg.height + wikisum.height + units.gridUnit * 0.50
    width: cbwidth
    border.width: 1        
    border.color: Qt.darker(PlasmaCore.ColorScope.backgroundColor, 1.2)
    color: Qt.darker(PlasmaCore.ColorScope.backgroundColor, 1.2) 
    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 1
        radius: 10
        samples: 32
        spread: 0.1
        color: Qt.rgba(0, 0, 0, 0.3)
    }
     
Column{
    id: mainColWdel
    spacing: 2
    anchors.fill: parent
    
    Row {
        id: headerRowWiki
        anchors.left: parent.left
        anchors.right: parent.right
        height: headrTitle.height
        spacing: 2
        
    Image {
        id: headrTitleLogo
        width: parent.height
        height: parent.height
        source: "../images/wikip.png"
    }
    
    PlasmaCore.SvgItem {
        id: headerDivWiki
        anchors {
            top: parent.top
            topMargin: 0
            bottom: parent.bottom
            bottomMargin: 0
        }

        width: linetopleftvertSvg.elementSize("vertical-line").width
        z: 110
        elementId: "vertical-line"

        svg: PlasmaCore.Svg {
            id: linetopleftvertSvg;
            imagePath: "widgets/line"
        }
    }  
    
    PlasmaComponents.Label {
        id: headrTitle
        anchors.top: parent.top
        anchors.topMargin: units.gridUnits * 0.25
        text: i18n("Wikipedia")
        font.capitalization: Font.SmallCaps
        color: theme.textColor
        height: units.gridUnits * 2
        width: parent.width
        }
    }
    
    Rectangle {
        id: splitter
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: theme.textColor
    }
    
    Image {
        id: wikiImg
        width: parent.width
        height: units.gridUnit * 3
        source: model.image
    }
    
    PlasmaComponents.Label {
        id: wikisum
        text: i18n(model.summary)
        width: parent.width
        wrapMode: Text.Wrap
        }
    }
}
