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

        onPaint: {
            var context = id_canvas.getContext('2d');
            context.clearRect(0, 0, id_canvas.width, id_canvas.height);
            context.strokeStyle = "#CDDC39";

            context.lineWidth = id_canvas.height * 0.1;
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 2 * 0.85, 0, Math.PI * 2 * 0.85, false);
            context.stroke();

            context.beginPath();
            context.lineWidth = id_canvas.height * 0.05;
            context.arc(id_canvas.height / 2 + Math.cos(0) * id_canvas.height / 2 * 0.85, id_canvas.height / 2 + Math.sin(0) * id_canvas.height / 2 * 0.85, id_canvas.height * 0.05 / 2, 0, Math.PI * 2, false);
            context.stroke();

            context.beginPath();
            context.lineWidth = id_canvas.height * 0.05;
            context.arc(id_canvas.height / 2 + Math.cos(Math.PI * 2 * 0.15) * id_canvas.height / 2 * 0.85, id_canvas.height / 2 - Math.sin(Math.PI * 2 * 0.15) * id_canvas.height / 2 * 0.85, id_canvas.height * 0.05 / 2, 0, Math.PI * 2, false);
            context.stroke();
        }
    }

    onP_curChanged: {
        id_canvas.rotation = 360 * id_root.p_cur / id_root.p_max;
        p_curFPS++;
    }
}
