import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.1 as Kirigami
import QtGraphicalEffects 1.0

Kirigami.AbstractListItem {
        id: dashDelegateItm
        height: Kirigami.Units.gridUnit * 6
        width: cbwidth

        ColumnLayout {
            id: contentdlgtitem
            Layout.fillWidth: true;
            Layout.fillHeight: true;

            RowLayout {
            id: skillTopRowLayout
            spacing: 5
            anchors.fill: parent

            ToolButton {
                id: contxtnewsitemmenu
                anchors.top: parent.top
                anchors.right: parent.right
                width: Kirigami.Units.gridUnit * 1
                height: Kirigami.Units.gridUnit * 1
                Image {
                    id: innrnewitemcontxmenuimage
                    source: "../images/ctxmenu.png"
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: Kirigami.Units.gridUnit * 0.7
                    height: Kirigami.Units.gridUnit * 0.7
                }
                ColorOverlay {
                    anchors.fill: innrnewitemcontxmenuimage
                    source: innrnewitemcontxmenuimage
                    color: Kirigami.Theme.textColor
                }
                onClicked: {
                    mcmenuItem.open()
                }
            }

            Drawer {
                id: mcmenuItem
                width: parent.width
                height: Kirigami.Units.gridUnit * 5
                edge: Qt.TopEdge
                dragMargin: 0

                Rectangle {
                    anchors.fill: parent
                    color: Kirigami.Theme.textColor

                        Rectangle {
                            id: readaloudRectbtn
                            width: parent.width
                            height: Kirigami.Units.gridUnit * 2
                            color: Kirigami.Theme.textColor
                            anchors.top: parent.top
                            anchors.topMargin: Kirigami.Units.gridUnit * 0.25
                            Row {
                               spacing: 5
                               Image {
                                   id: readAloudIcon
                                   anchors.verticalCenter: parent.verticalCenter
                                   source: "../images/readaloud.png"
                                   width: 32
                                   height: 32
                               }
                               Rectangle {
                                   id: readAloudSeperater
                                   width: 1
                                   height: parent.height
                                   color: Kirigami.Theme.linkColor
                               }
                               Label {
                                   id: readAloudLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Listen To/Play The Selected Article"
                                   color: Kirigami.Theme.backgroundColor
                               }
                            }
                        }

                        Rectangle {
                            id: btnshorzSepr
                            width: parent.width
                            height: 1
                            color: Kirigami.Theme.linkColor
                            anchors.top: readaloudRectbtn.bottom
                            anchors.topMargin: Kirigami.Units.gridUnit * 0.25
                        }

                        Rectangle{
                            id: shareNwsBtn
                            width: parent.width
                            height: Kirigami.Units.gridUnit * 2
                            color: Kirigami.Theme.textColor
                            anchors.top: btnshorzSepr.bottom
                            anchors.topMargin: Kirigami.Units.gridUnit * 0.25
                            Row {
                               spacing: 5
                               Image {
                                   id: shareNewsIcon
                                   anchors.verticalCenter: parent.verticalCenter
                                   source: "../images/share.png"
                                   width: 32
                                   height: 32
                               }
                               Rectangle {
                                   id: shareNewsSeperater
                                   width: 1
                                   height: parent.height
                                   color: Kirigami.Theme.linkColor
                               }
                               Label {
                                   id: shareNewsLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Share"
                                   color: Kirigami.Theme.backgroundColor
                               }
                        }
                    }
                }
            }

            Label {
                id: dashHeader
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                wrapMode: Text.WordWrap;
                font.bold: true;
                text: itemWeatherTempType
                color: Kirigami.Theme.textColor
                Kirigami.Separator {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: Kirigami.Units.gridUnit * -0.2
                            }
                    color: Kirigami.Theme.linkColor
                            }
                        }

            Label {
                id: weatherDshTempMinLabel
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                color: Kirigami.Theme.textColor
                wrapMode: Text.WordWrap;
                font.bold: true;
                text: "Min Temp: " + itemWeatherTempMin
                    }

            Label {
                id: weatherDshTempCurrentLabel
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter:parent.horizontalCenter
                wrapMode: Text.WordWrap;
                font.bold: true;
                font.pixelSize: 18
                text: "Temp: " + itemWeatherTemp
                color: Kirigami.Theme.textColor
                    }

            Label {
                id: weatherDshTempMaxLabel
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                wrapMode: Text.WordWrap;
                font.bold: true;
                color: Kirigami.Theme.textColor
                text:"Max Temp: " + itemWeatherTempMax
                    }
                }
            }
}
