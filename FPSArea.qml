import QtQuick 2.0

Item {
    id: id_root
    property int p_actualFPS: 0
    property int p_targetFPS: 0

    Item {
        anchors.fill: parent
        anchors.margins: parent.height * 0.01

        Rectangle {
            id: id_header
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            height: parent.height * 0.25
            color: "black"
            opacity: 0.5
            radius: height * 0.2
        }

        Text {
            anchors.centerIn: id_header
            text: "FPS"
            font.pixelSize: id_header.height * 0.7
            color: "white"
        }

        Rectangle {
            id: id_left
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: id_header.bottom
            }
            height: parent.height * 0.25
            color: "black"
            radius: height * 0.2
            anchors.rightMargin: height * 0.02

            Text {
                anchors.centerIn: parent
                text: "Target"
                font.pixelSize: parent.height * 0.6
                color: "white"
            }
        }

        Rectangle {
            id: id_right
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: id_header.bottom
            }
            height: parent.height * 0.25
            color: "black"
            radius: height * 0.2
            anchors.leftMargin: height * 0.02

            Text {
                anchors.centerIn: parent
                text: "Actual"
                font.pixelSize: parent.height * 0.6
                color: "white"
            }
        }

        Rectangle {
            id: id_targetFPSArea
            anchors {
                left: parent.left
                right: id_left.right
                top: id_left.bottom
            }
            height: parent.height * 0.5
            color: "black"
            opacity: 0.5
            radius: height * 0.2
        }

        Text {
            anchors.centerIn: id_targetFPSArea
            text: p_targetFPS
            font.pixelSize: id_targetFPSArea.height * 0.8
            color: "white"
        }

        Rectangle {
            id: id_actualFPSArea
            anchors {
                left: id_right.left
                right: id_right.right
                top: id_right.bottom
            }
            height: parent.height * 0.5
            color: "black"
            opacity: 0.5
            radius: height * 0.2
        }

        Text {
            anchors.centerIn: id_actualFPSArea
            text: p_actualFPS
            font.pixelSize: id_actualFPSArea.height * 0.8
            color: "white"
        }
    }

}
