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
        transformOrigin: Item.Center
        rotation: 270
        color: "transparent"

        Repeater {
            model: id_rec1.p_Blocks

            Item {
                anchors.fill: parent
                Canvas {
                    property int p_cur: id_root.p_cur

                    anchors.fill: parent
                    contextType: "2d"
                    antialiasing: true

                    onPaint: {
                        var context = getContext('2d');

                        if(id_root.p_cur > (index * id_root.p_max / id_rec1.p_Blocks)){
                            context.strokeStyle = "#76FF03";
                        }else{
                            context.strokeStyle = "#757575";
                        }

                        context.lineWidth = id_rec1.height / 2 / id_rec1.p_Blocks * 0.7;
                        context.beginPath();
                        context.arc(id_rec1.height / 2, id_rec1.height / 2, id_rec1.height / 2 * index / id_rec1.p_Blocks, 0, Math.PI * 2 , false);
                        context.stroke();

                        if(index == (id_rec1.p_Blocks - 1)){
                            p_curFPS++
                        }
                    }

                    onP_curChanged: {
                        requestPaint()
                    }
                }
            }
        }
    }
}
