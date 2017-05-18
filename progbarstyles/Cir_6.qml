import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1
        property int p_Blocks: 8
        property int p_CurBlock: 0

        QtObject {
            id: id_obj
            property var colorList : ["#80CBC4", "#4DB6AC", "#26A69A", "#009688", "#00897B", "#00796B", "#00695C", "#004D40"]
        }

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
                    color: "#80CBC4"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onP_curChanged: {
                        if(index == id_rec1.p_CurBlock){
                            color = id_obj.colorList[id_obj.colorList.length - 1]
                        }else{
                            var step = index - id_rec1.p_CurBlock
                            if(step < 0){
                                color = id_obj.colorList[id_obj.colorList.length + step]
                            }else{
                                color = id_obj.colorList[step]
                            }
                        }
                        if(index == (id_rec1.p_Blocks - 1)){
                            p_curFPS++
                        }
                    }
                }
            }
        }
    }

    onP_curChanged: {
        id_rec1.p_CurBlock = id_root.p_cur / (id_root.p_max / id_rec1.p_Blocks)
    }
}
