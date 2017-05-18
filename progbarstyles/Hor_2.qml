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
        radius: id_rec1.height

        color: "gray"
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
        radius: id_rec1.radius

        color: "green"
    }

    onP_curChanged: {
        p_curFPS++
    }
}
