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
            property var colorList : ["#757575", "#757575", "#BDBDBD", "#BDBDBD", "#EEEEEE", "#EEEEEE", "#FAFAFA", "#FAFAFA"]
        }

        anchors {
            left: id_root.left
            right: id_root.right
            verticalCenter: id_root.verticalCenter
            leftMargin: id_root.width * 0.01
            rightMargin: id_root.width * 0.01
        }
        height: id_root.height * 0.6
        color: "transparent"

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
                        leftMargin: parent.height * 0.02
                        rightMargin: parent.height * 0.02
                    }
                    color: "#757575"

                    onP_curChanged: {
                        if(index == id_rec1.p_CurBlock){
                            color = id_obj.colorList[0]
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
