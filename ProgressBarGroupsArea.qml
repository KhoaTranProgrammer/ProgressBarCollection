import QtQuick 2.0

Item {
    id: id_root

    property int p_curIndex: -1
    property string p_groupName

    Rectangle {
        anchors {
            bottom: id_root.bottom
            left: id_root.left
            right: id_root.right
        }
        height: id_root.height / 20

        color: "black"
    }

    ListModel {
        id: id_listOfGroup
    }

    Component {
        id: id_displayDelegate

        Item {
            width: id_root.width / 6
            height: id_root.height

            CustomButton {
                id: id_button
                anchors.fill: parent
                anchors {
                    topMargin: id_root.height / 10
                    leftMargin: id_root.height / 10
                    rightMargin: id_root.height / 10
                    bottomMargin: id_root.height / 10
                }

                p_text: name
                p_fontSize: id_root.height / 4
                p_radius: id_root.height / 2
                p_index: index
                p_curIndex: id_root.p_curIndex

                onClicked: {
                    id_root.p_groupName = id_button.p_text
                    id_root.p_curIndex = index
                }
            }
        }
    }

    Flickable {
        anchors.fill: parent
        contentWidth: id_root.width + 100
        clip: true

        Row {
            anchors.fill: parent
            Repeater {
                model: id_listOfGroup
                delegate: id_displayDelegate
            }
        }
    }

    function addItem(name)
    {
        id_listOfGroup.append({"name": name})
    }
}
