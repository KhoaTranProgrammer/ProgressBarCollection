import QtQuick 2.0
import SysInfoQML 1.0
import "Menu.js" as Data
import "AutoData.js" as AutoData

Item {
    id: id_root

    property bool isAutoRun: false

    anchors.fill: parent

    Rectangle {
        anchors.fill: id_root
        color: "#B3E5FC"
    }

    SysInfoQML {
        id: id_sysInfo
    }

    //use for auto run function - start
    property int p_autoIndex: 0

    Timer {
        id: id_timerAuto
        repeat: true
        interval: 5000
        running: false

        onTriggered: {
            id_root.state = "fadeOut"
            id_loader.source = "progbarstyles/" + AutoData.list_styles[p_autoIndex++]
            var scene = null
            scene = id_loader.item
            scene.parent = id_root
            scene.anchors.fill = id_displayProBarArea
            scene.fps.connect(newFPS)
            if(p_autoIndex == AutoData.list_styles.length) p_autoIndex = 0;
        }
    }

    Item {
        id: id_autoRun

        anchors {
            right: id_root.right
            top: id_root.top
        }
        height: id_root.height / 7
        width: height

        Rectangle {
            anchors.fill: parent
            radius: height / 2
            color: "black"
            opacity: 0.5
            anchors.margins: id_autoRun.height * 0.05

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onClicked: {
                    startAutoRun()
                }
            }
        }

        Text {
            anchors.centerIn: id_autoRun
            text: "Auto\nRun"
            font.pixelSize: id_autoRun.height * 0.3
            color: "red"
        }
    }

    function startAutoRun(){
        isAutoRun = true
        id_probar_style_area.p_curIndex = -1

        //Disable some GUI controls
        id_autoRun.height = 0
        id_autoRun.visible = false
        id_probar_group_area.height = 0
        id_probar_group_area.visible = false
        id_probar_style_area.visible = false

        //Enable some GUI
        id_stopAutoRun.visible = true

        //enable Timer for Auto run
        id_timerAuto.running = true

        //Set source qml file
        id_loader.source = "progbarstyles/" + AutoData.list_styles[p_autoIndex++]
        var scene = null
        scene = id_loader.item
        scene.parent = id_root
        scene.anchors.fill = id_displayProBarArea
        scene.fps.connect(newFPS)
    }

    function endAutoRun(){
        isAutoRun = false

        //Enable some GUI controls
        id_autoRun.height = id_root.height / 7
        id_autoRun.visible = true
        id_probar_group_area.height = id_root.height / 7
        id_probar_group_area.visible = true
        id_probar_style_area.visible = true

        //Disable some GUI
        id_stopAutoRun.visible = false

        //enable Timer for Auto run
        id_timerAuto.running = false

        id_loader.source = ""

        p_autoIndex = 0
    }
    //use for auto run function - end

    ProgressBarGroupsArea {
        id: id_probar_group_area

        anchors {
            top: id_root.top
            left: id_root.left
            right: id_autoRun.left
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

    PerformanceArea {
        id: id_perfArea

        anchors {
            left: id_root.left
            top: id_probar_group_area.bottom
        }
        width: id_root.width * 0.2
        height: id_root.height * 0.2
    }

    Item {
        id: id_stopAutoRun
        anchors {
            bottom: id_root.bottom
            left: id_root.left
            right: id_root.right
        }
        height: id_root.height * 0.15
        visible: false

        Text {
            anchors.centerIn: parent
            text: "Please click to stop AutoRun"
            font.pixelSize: parent.height * 0.5
            color: "red"

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    endAutoRun()
                }
            }
        }
    }

    Loader {
        id: id_loader

        onLoaded: {
            if(isAutoRun) id_root.state = "fadeIn"
        }

    }

    states: [
        State {
            name: "fadeOut";
            PropertyChanges { target: id_loader.item; opacity: 0.1; }
        },
        State {
            name: "fadeIn";
            PropertyChanges { target: id_loader.item; opacity: 1; }
        }
    ]

    transitions: [
        Transition {
            to: "fadeIn"
            NumberAnimation { properties: "opacity"; from: 0.0; to: 0.99; duration: 2000 }
        },
        Transition {
            to: "fadeOut"
            NumberAnimation { properties: "opacity"; from: 0.99; to: 0; duration: 2000 }
        }
    ]

    Timer {
        id: id_timer1s
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            id_sysInfo.update()
            id_perfArea.p_cpuUsage = id_sysInfo.cpuUsage
            id_perfArea.p_memUsage = id_sysInfo.memUsage * 100 / id_sysInfo.memTotal
        }
    }

    function newFPS(target, actual){
        id_fpsArea.p_targetFPS = target
        id_fpsArea.p_actualFPS = actual
    }
}
