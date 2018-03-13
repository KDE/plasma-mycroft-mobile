import QtQuick 2.9
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id: bgrectA
    
    function aniRunWorking(){
        animtimer.start()
        topCircle.inneranimtopworking.start()
        maskItem.inneranimworking.start()
    }

    function aniRunTransition(){
        animtimer.start()
        topCircle.inneranimtoptransition.start()
        maskItem.inneranimtransition.start()
    }


    function aniRunHappy (){
       animtimer.start()
       topCircle.inneranimtophappy.start()
       maskItem.inneranimhappy.start()
    }

    function aniRunError(){
        animtimer.start()
        topCircle.inneranimtopsad.start()
        maskItem.inneranimsad.start()
    }

Item{
    id: customIndicatorBusy
    anchors.fill: parent
    visible: true

    RotationAnimator {
        target:topCircle
        id: antoWorking
        from: 0;
        to: 360;
        duration: 500
        running: false
        alwaysRunToEnd: true
    }

    RotationAnimator {
        target:topCircle
        id: antoTransition
        from: 0;
        to: 0;
        duration: 500
        running: false
        alwaysRunToEnd: true
    }

    RotationAnimator {
        target:topCircle
        id: antoSad
        from: 0;
        to: 180;
        duration: 500
        direction: RotationAnimator.Counterclockwise
        running: false
        alwaysRunToEnd: true;

    }

    RotationAnimator {
        target:topCircle
        id: antoHappy
        from: 0;
        to: 360;
        duration: 500
        running: false
        alwaysRunToEnd: true;
    }

    SequentialAnimation {
        id: seqmaskanimworking
        running: false
        loops: Animation.Infinite
        PropertyAction { target: myRot; property: "origin.x"; value: units.gridUnit * 0.78 }
        PropertyAction { target: myRot; property: "origin.y"; value: units.gridUnit * 0.78 }
       NumberAnimation { target: myRot; property: "angle"; from:0; to: -360; duration: 500}

       onStopped: {
           myRot.angle = 0
       }
    }

    SequentialAnimation {
        id: seqmaskanimtransition
        running: false
        loops: Animation.Infinite
        PropertyAction { target: myRot; property: "origin.x"; value: units.gridUnit * 0.78 }
        PropertyAction { target: myRot; property: "origin.y"; value: units.gridUnit * 0.78 }
        NumberAnimation { target: myRot; property: "angle"; from: 0; to: 0; duration: 500}
    }

    SequentialAnimation {
        id: colrmeonAnsHappy
        ParallelAnimation {
        PropertyAnimation { target: innerCircleSurround; property: "color"; from: "#ffffff"; to: "lightgreen"; duration: 500; }
        PropertyAnimation { target: circ; property: "color"; from: "#ffffff"; to: "lightgreen"; duration: 500; }
        PropertyAnimation { target: topCircle.circle; property: "color"; from: "#ffffff"; to: "lightgreen"; duration: 500; }
        }
        ParallelAnimation {
        PropertyAnimation { target: innerCircleSurround; property: "color"; from: "lightgreen"; to: "#fff"; duration: 500; }
        PropertyAnimation { target: circ; property: "color"; from: "lightgreen"; to: "#fff"; duration: 500; }
        PropertyAnimation { target: topCircle.circle; property: "color"; from: "lightgreen"; to: "#fff"; duration: 500; }
        }
    }

    SequentialAnimation {
        id: colrmeonAnsSad
        ParallelAnimation {
        PropertyAnimation { target: innerCircleSurround; property: "color"; from: "#ffffff"; to: "red"; duration: 500; }
        PropertyAnimation { target: circ; property: "color"; from: "#ffffff"; to: "red"; duration: 1000; }
        PropertyAnimation { target: topCircle.circle; property: "color"; from: "#ffffff"; to: "red"; duration: 500; }
        }
        ParallelAnimation {
        PropertyAnimation { target: innerCircleSurround; property: "color"; from: "red"; to: "#fff"; duration: 500; }
        PropertyAnimation { target: circ; property: "color"; from: "red"; to: "#fff"; duration: 1000; }
        PropertyAnimation { target: topCircle.circle; property: "color"; from: "red"; to: "#fff"; duration: 500; }
        }
    }

    SequentialAnimation {
        id: seqmaskanimhappy
        running: false
        loops: Animation.Infinite
        PropertyAction { target: myRot; property: "origin.x"; value: units.gridUnit * 0.74 }
        PropertyAction { target: myRot; property: "origin.y"; value: units.gridUnit * 0.76 }
        NumberAnimation { target: myRot; property: "angle"; from:0; to: -360; duration: 500 }

       onStopped: {
           myRot.angle = -90
           transtimer.start()
       }

       onStarted: {
           colrmeonAnsHappy.running = true
       }
    }

    SequentialAnimation {
        id: seqmaskanimsad
        running: false
        loops: Animation.Infinite
        PropertyAction { target: myRot; property: "origin.x"; value: units.gridUnit * 0.76 }
        PropertyAction { target: myRot; property: "origin.y"; value: units.gridUnit * 0.76 }
        NumberAnimation { target: myRot; property: "angle"; from:0; to: 360; duration: 500}

       onStopped: {
           myRot.angle = 90
           transtimer.start()
       }

       onStarted: {
           colrmeonAnsSad.running = true
       }
    }

    Item{
        anchors.fill: parent

    Rectangle {
             id: topCircle
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
             color: "#00000000"
             radius: 1
             opacity: 1
             implicitWidth: units.gridUnit * 3
             implicitHeight: units.gridUnit * 3
             property alias inneranimtopworking: antoWorking
             property alias inneranimtophappy: antoHappy
             property alias inneranimtopsad: antoSad
             property alias inneranimtoptransition: antoTransition
             property alias circle: innerSqr

             Rectangle{
                id: innerSqr
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#fff"
                radius: 100
                width: units.gridUnit * 0.3
                height: units.gridUnit * 0.3
             }
                    }

    Rectangle {
         id: innerCircleSurround
         anchors.centerIn: parent
         color: "#ffffff"
         radius: 100
         implicitWidth: units.gridUnit * 2
         implicitHeight: units.gridUnit * 2
         opacity: 1
        }

    Rectangle {
         id: innerCircleSurroundOutterRing
         anchors.centerIn: parent
         color: theme.linkColor
         radius: 100
         implicitWidth: units.gridUnit * 1.833
         implicitHeight: units.gridUnit * 1.833
         opacity: 1
        }

    Rectangle {
        id: maskItem
         anchors.verticalCenter: parent.verticalCenter
         anchors.left: innerCircleSurroundOutterRing.left
         anchors.leftMargin: units.gridUnit * 0.2
         color: "#00000000"
         radius: 1000
         implicitWidth: units.gridUnit * 0.833
         implicitHeight: units.gridUnit * 1.6
         clip: true
         property alias cc: semicirc
         property alias inneranimworking: seqmaskanimworking
         property alias inneranimtransition: seqmaskanimtransition
         property alias inneranimhappy: seqmaskanimhappy
         property alias inneranimsad: seqmaskanimsad
         opacity: 1

         transform: Rotation {
                     id: myRot
                 }

    Item {
           id: semicirc
           anchors.left: parent.left
           anchors.top: parent.top
           anchors.bottom: parent.bottom
           width: units.gridUnit * 3.133
           clip:true
           opacity: 1

           Rectangle{
               id: circ
               width: parent.width
               height: parent.height
               radius:100
               color: "white"
         }
       }
      }

    Timer {
        id: animtimer
        interval: 500;
        repeat: false
        onTriggered: {
            maskItem.inneranimworking.stop()
            maskItem.inneranimtransition.stop()
            maskItem.inneranimhappy.stop()
            maskItem.inneranimsad.stop()
            topCircle.inneranimtopworking.stop()
            topCircle.inneranimtoptransition.stop()
            topCircle.inneranimtophappy.stop()
            topCircle.inneranimtopsad.stop()
            }
        }

    Timer {
        id: transtimer
        interval: 500;
        repeat: false
        onTriggered: {
            myRot.angle = 0
            antoTransition.running = true
                    }
                }
            }
        }
      }
