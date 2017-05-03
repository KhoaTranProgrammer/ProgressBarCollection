import QtQuick 2.3
import "Menu.js" as Data

Item {
    id: id_root

    anchors.fill: parent

    Rectangle {
        anchors.fill: id_root
        color: "#B3E5FC"
    }

    ProgressBarGroupsArea {
        id: id_probar_group_area

        anchors {
            top: id_root.top
            left: id_root.left
            right: id_root.right
        }
        height: id_root.height / 7
        z: 1

        Component.onCompleted: {
            for(var i = 0; i < Data.probar_groups.length; i++){
                id_probar_group_area.addItem(Data.probar_groups[i])
            }
        }

        onP_curIndexChanged: {
            id_fpsArea.p_targetFPS = 0
            id_fpsArea.p_actualFPS = 0

            id_probar_style_area.addItems(id_probar_group_area.p_groupName)
            id_probar_style_area.p_curIndex = -1
            id_loader.source = ""
        }
    }

    ProgressBarStylesArea {
        id: id_probar_style_area

        anchors {
            bottom: id_root.bottom
            left: id_root.left
            right: id_root.right
        }
        height: id_probar_group_area.height * 1.1

        onSelected: {
            id_fpsArea.p_targetFPS = 0
            id_fpsArea.p_actualFPS = 0

            id_loader.source = "progbarstyles/" + p_curSource
            var scene = null
            scene = id_loader.item
            scene.parent = id_root
            scene.anchors.fill = id_displayProBarArea
            scene.fps.connect(newFPS)
        }
    }

    Item {
        id: id_displayProBarArea

        anchors {
            left: id_root.left
            top: id_probar_group_area.bottom
            right: id_root.right
            bottom: id_probar_style_area.verticalCenter
        }
    }

    FPSArea {
        id: id_fpsArea

        anchors {
            right: id_root.right
            top: id_probar_group_area.bottom
        }
        width: id_root.width * 0.2
        height: id_root.height * 0.2
    }

    Loader {
        id: id_loader
    }

    function newFPS(target, actual){
        id_fpsArea.p_targetFPS = target
        id_fpsArea.p_actualFPS = actual
    }
}
