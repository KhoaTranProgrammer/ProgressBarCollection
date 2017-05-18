import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1
        property int p_Blocks: 8

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height) * 0.8
        width: height
        radius: width/2
        color: "transparent"

        Repeater {
            model: id_rec1.p_Blocks

            Item {
                height: id_rec1.height/2
                transformOrigin: Item.Bottom
                rotation: index * (360 / id_rec1.p_Blocks)
                x: id_rec1.width/2
                y: 0

                Rectangle {
                    property int p_cur: id_root.p_cur
                    height: id_rec1.height * 0.2
                    width: height
                    radius: width/2
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onP_curChanged: {
                        var cur_block = id_root.p_cur / (id_root.p_max / id_rec1.p_Blocks)
                        if((cur_block > index) && (cur_block < index + 1)){
                            height = id_rec1.height * 0.3
                        }else{
                            height = id_rec1.height * 0.2
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
