import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Rectangle {
        id: id_rec1
        property int p_Blocks: 16

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

                        if(id_root.p_cur < (index * id_root.p_max / id_rec1.p_Blocks)){
                            context.strokeStyle = "#FFCC80";
                        }else{
                            context.strokeStyle = "#FF9800";
                        }

                        context.lineWidth = id_rec1.height * 0.1;
                        context.beginPath();
                        context.arc(id_rec1.height / 2, id_rec1.height / 2, id_rec1.height / 2 * 0.85, index * Math.PI * 2 * (360 / id_rec1.p_Blocks / 360) + Math.PI * 2 * 0.003, index * Math.PI * 2 * (360 / id_rec1.p_Blocks / 360) + Math.PI * 2 * (360 / id_rec1.p_Blocks / 360), false);
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
