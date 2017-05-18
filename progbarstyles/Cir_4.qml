import QtQuick 2.0
import "../"

CustomItem {
    id: id_root

    Canvas {
        id: id_canvas

        anchors {
            horizontalCenter: id_root.horizontalCenter
            verticalCenter: id_root.verticalCenter
        }
        contextType: "2d"
        antialiasing: true
        height: id_root.height * 1.5
        width: height
        rotation: 270

        onPaint: {
            var context = id_canvas.getContext('2d');

            context.clearRect(0, 0, id_canvas.width, id_canvas.height);
            context.strokeStyle = "blue";
            context.lineWidth = id_canvas.height / 2;
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 1024, 0, Math.PI * 2 * id_root.p_cur / id_root.p_max, false);
            context.stroke();

            p_curFPS++;
        }
    }

    onP_curChanged: {
        id_canvas.requestPaint()
    }
}
