import QtQuick 2.0

Item {
    id: id_root

    property int p_min: 0
    property int p_max: 100
    property int p_cur: 0
    anchors.fill: parent

    Timer {
        id: id_timer
        repeat: true
        interval: 20
        running: true

        onTriggered: {
            if(id_root.p_cur == id_root.p_max){
                id_root.p_cur = id_root.p_min
            }
            id_root.p_cur++
        }
    }

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

                        context.lineWidth = id_rec1.height * 0.2;
                        context.beginPath();
                        context.arc(id_rec1.height / 2, id_rec1.height / 2, id_rec1.height / 2 * 0.6, index * Math.PI * 2 * (360 / id_rec1.p_Blocks / 360) + Math.PI * 2 * 0.003, index * Math.PI * 2 * (360 / id_rec1.p_Blocks / 360) + Math.PI * 2 * (360 / id_rec1.p_Blocks / 360), false);
                        context.stroke();
                    }

                    onP_curChanged: {
                        requestPaint()
                    }
                }
            }
        }
    }
}
