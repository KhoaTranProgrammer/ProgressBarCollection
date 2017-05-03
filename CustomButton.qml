import QtQuick 2.0
import "Config.js" as Data

Item {
    id: id_root

    property string p_text
    property color p_bgColor: Data.bgColor_default
    property color p_bgColorSelected: Data.bgColor_clicked
    property color p_textColor: Data.fontColor_default
    property color p_textColorSelected: Data.fontColor_clicked
    property int p_fontSize: 14
    property int p_radius: 10
    property int p_index: -1
    property int p_curIndex: -1

    signal clicked

    Rectangle {
        id: id_bgr
        anchors.fill: parent
        radius: p_radius
        color: p_bgColor

        Text {
            id: id_text
            anchors.centerIn: parent
            text: id_root.p_text
            font.pixelSize: p_fontSize
            color: p_textColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                id_root.clicked()
            }
        }
    }

    onP_curIndexChanged: {
        if(id_root.p_index == id_root.p_curIndex){
            id_bgr.color = id_root.p_bgColorSelected
            id_text.color = id_root.p_textColorSelected
        }else{
            id_bgr.color = id_root.p_bgColor
            id_text.color = id_root.p_textColor
        }
    }
}
