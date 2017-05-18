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
        height: id_root.height * 0.8
        width: height
        rotation: 270

        onPaint: {
            var context = id_canvas.getContext('2d');
            context.strokeStyle = "#26A69A";

            context.lineWidth = id_canvas.height * 0.1;
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 2 * 0.85, 0, Math.PI * 2, false);
            context.stroke();

            context.strokeStyle = "#1DE9B6";
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 2 * 0.85, Math.PI * 2 * id_root.p_cur / id_root.p_max, Math.PI * 2 * 0.15 + Math.PI * 2 * id_root.p_cur / id_root.p_max, false);
            context.stroke();

            p_curFPS++;
        }
    }

    onP_curChanged: {
        id_canvas.requestPaint()
    }
}
