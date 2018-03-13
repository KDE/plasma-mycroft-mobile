import QtQuick 2.9
import QtQml.Models 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtGraphicalEffects 1.0
import org.kde.kirigami 2.1 as Kirigami

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
                width: units.gridUnit * 1
                height: units.gridUnit * 1
                Image {
                    id: innrnewitemcontxmenuimage
                    source: "../images/ctxmenu.png"
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gridUnit * 0.7
                    height: units.gridUnit * 0.7
                }
                ColorOverlay {
                    anchors.fill: innrnewitemcontxmenuimage
                    source: innrnewitemcontxmenuimage
                    color: theme.textColor
                }
                onClicked: {
                    mcmenuItem.open()
                }
            }

            Drawer {
                id: mcmenuItem
                width: parent.width
                height: units.gridUnit * 5
                edge: Qt.TopEdge
                dragMargin: 0

                Rectangle {
                    anchors.fill: parent
                    color: theme.textColor

                        Rectangle {
                            id: readaloudRectbtn
                            width: parent.width
                            height: units.gridUnit * 2
                            color: theme.textColor
                            anchors.top: parent.top
                            anchors.topMargin: units.gridUnit * 0.25
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
                                   color: theme.linkColor
                               }
                               Label {
                                   id: readAloudLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Listen To/Play The Selected Article"
                                   color: theme.backgroundColor
                               }
                            }
                        }

                        Rectangle {
                            id: btnshorzSepr
                            width: parent.width
                            height: 1
                            color: theme.linkColor
                            anchors.top: readaloudRectbtn.bottom
                            anchors.topMargin: units.gridUnit * 0.25
                        }

                        Rectangle{
                            id: shareNwsBtn
                            width: parent.width
                            height: units.gridUnit * 2
                            color: theme.textColor
                            anchors.top: btnshorzSepr.bottom
                            anchors.topMargin: units.gridUnit * 0.25
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
                                   color: theme.linkColor
                               }
                               Label {
                                   id: shareNewsLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Share"
                                   color: theme.backgroundColor
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
                text: newsTitle
                color: theme.textColor
                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: units.gridUnit * -0.2
                       }
                    height: 1
                    color: theme.linkColor
                   }
                }

            Item {
            id: dashinner
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.top: dashHeader.bottom
            anchors.topMargin: units.gridUnit * 0.6
            anchors.bottom: parent.bottom

            Label {
                wrapMode: Text.WordWrap;
                anchors.right: ctxImgIcon.left
                anchors.left: parent.left
                anchors.leftMargin: units.gridUnit * 0.25
                color: theme.textColor ;
                text: newsDescription
               }

              Image {
                    id: ctxImgIcon
                    anchors.right: parent.right
                    anchors.margins: units.gridUnit * 0.5
                    source: newsImgURL
                    width: 64
                    height: 64
                 }

         Rectangle {
             id: dashItemSrcMeta
             implicitWidth: dashItemSrcName.implicitWidth + units.gridUnit * 1
             anchors.bottom: parent.bottom
             anchors.left: parent.left
             color: theme.linkColor
             height: units.gridUnit * 1.25

              Label {
                  id: dashItemSrcName
                  anchors.centerIn: parent
                  color: theme.textColor ;
                  text: newsSource
                 }
                }
                    }
                        }
                            }
                                }
