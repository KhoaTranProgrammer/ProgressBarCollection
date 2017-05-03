import QtQuick 2.0
import QtGraphicalEffects 1.0
import "Config.js" as Data

Item {
    id: id_root

    property string p_text
    property string p_image
    property color p_bgColor: Data.bgColor_default_imagebt
    property color p_bgColorSelected: Data.bgColor_clicked
    property color p_textColor: Data.fontColor_default
    property color p_textColorSelected: Data.fontColor_clicked
    property int p_fontSize: 14
    property int p_radius: 10
    property int p_index: -1
    property int p_curIndex: -1

    signal clicked

    Rectangle {
        id: id_boundary
        anchors.fill: parent
        radius: width / 2

        color: "transparent"
    }

    Rectangle {
        id: id_rec
        anchors.fill: id_boundary
        anchors.margins: id_boundary.height * 0.05
        radius: width / 2

        color: p_bgColor
    }

    Image {
        id: id_image

        anchors.fill: id_rec
        anchors.margins: id_rec.height * 0.05
        fillMode: Image.PreserveAspectFit
        smooth: true
        z: 1

        source: "images/" + id_root.p_image
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            id_root.clicked()
        }

        onEntered: {
            id_boundary.color = id_rec.color
        }

        onExited: {
            id_boundary.color = "transparent"
        }
    }

    onP_curIndexChanged: {
        if(id_root.p_index == id_root.p_curIndex){
            id_rec.color = id_root.p_bgColorSelected
            id_boundary.color = id_rec.color
        }else{
            id_rec.color = id_root.p_bgColor
            id_boundary.color = "transparent"
        }
    }
}
