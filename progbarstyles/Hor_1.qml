import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1

        anchors {
            left: id_root.left
            right: id_root.right
            verticalCenter: id_root.verticalCenter
            leftMargin: id_root.width * 0.01
            rightMargin: id_root.width * 0.01
        }
        height: id_root.height * 0.1

        color: "white"
    }

    Rectangle {
        id: id_rec2

        anchors {
            left: id_rec1.left
            top: id_rec1.top
            bottom: id_rec1.bottom
            margins: id_rec1.height * 0.1
        }
        width: id_root.p_cur * id_rec1.width / id_root.p_max

        color: "blue"
    }

    Text {
        anchors {
            left: id_rec1.left
            bottom: id_rec1.top
            bottomMargin: id_rec1.height * 0.1
        }
        text: "On loading, please waiting......"
        font.pixelSize: id_rec1.height * 0.5
    }

    Text {
        id: id_curPercent
        anchors {
            centerIn: id_rec1
            margins: id_rec2.height * 0.08
        }
        text: id_root.p_cur + " %"
        font.pixelSize: id_rec1.height * 0.5
    }

    onP_curChanged: {
        p_curFPS++
    }
}
