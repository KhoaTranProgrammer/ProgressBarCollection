import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1
        property int p_Blocks: 15

        anchors {
            left: id_root.left
            right: id_root.right
            verticalCenter: id_root.verticalCenter
            leftMargin: id_root.width * 0.01
            rightMargin: id_root.width * 0.01
        }
        height: id_root.height * 0.1
        color: "white"

        Repeater {
            model: id_rec1.p_Blocks

            Item {
                width: id_rec1.width / id_rec1.p_Blocks
                height: id_rec1.height
                x: id_rec1.width / id_rec1.p_Blocks * index
                y: 0

                Rectangle {
                    property int p_cur: id_root.p_cur
                    anchors {
                        fill: parent
                        topMargin: parent.height * 0.1
                        bottomMargin: parent.height * 0.1
                        leftMargin: parent.height * 0.05
                        rightMargin: parent.height * 0.05
                    }
                    color: "white"

                    onP_curChanged: {
                        if(id_root.p_cur < (index * id_root.p_max / id_rec1.p_Blocks)){
                            color = "white"
                        }else{
                            color = "blue"
                        }
                        if(index == (id_rec1.p_Blocks - 1)){
                            p_curFPS++
                        }
                    }
                }
            }
        }
    }
}
