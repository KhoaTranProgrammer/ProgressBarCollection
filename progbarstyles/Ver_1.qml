import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1
        property int p_Blocks: 15

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        width: parent.width * 0.15
        height: parent.height * 0.8
        color: "#757575"

        Repeater {
            model: id_rec1.p_Blocks

            Item {
                property int p_cur: id_root.p_cur

                width: id_rec1.width
                height: id_rec1.height / id_rec1.p_Blocks
                x: 0
                y: id_rec1.height - id_rec1.height / id_rec1.p_Blocks * index - id_rec1.height / id_rec1.p_Blocks

                Rectangle {
                    id: id_left
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.horizontalCenter
                        margins: parent.height * 0.1
                    }
                    color: "#757575"
                }

                Rectangle {
                    id: id_right
                    anchors {
                        left: parent.horizontalCenter
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                        margins: parent.height * 0.1
                    }
                    color: "#757575"
                }

                onP_curChanged: {
                    if(id_root.p_cur < (index * id_root.p_max / id_rec1.p_Blocks)){
                        id_left.color = "#757575"
                        id_right.color = "#757575"
                    }else{
                        id_left.color = "#76FF03"
                        id_right.color = "#76FF03"
                    }
                    if(index == (id_rec1.p_Blocks - 1)){
                        p_curFPS++
                    }
                }
            }
        }
    }
}
