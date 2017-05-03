import QtQuick 2.0
import "Menu.js" as Data

Item {
    id: id_root

    //maximum items are displayed
    property int p_maxItems: 8
    property int p_remainItems: 0
    property int p_curIndex: -1
    property string p_curSource
    property string p_curGroup
    signal selected

    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    ListModel {
        id: id_listOfStyle
    }

    Component {
        id: id_displayDelegate

        Item {
            id: id_delegateItem

            height: id_root.height
            width: height

            CustomImageButton {
                id: id_button
                anchors.fill: parent

                p_text: name
                p_fontSize: id_root.height / 20
                p_radius: id_root.height / 2
                p_index: index
                p_image: image
                p_curIndex: id_root.p_curIndex

                onClicked: {
                    id_root.p_curIndex = index
                    id_root.p_curSource = source
                    id_root.selected()
                }
            }
        }
    }

    Flickable {
        id: id_container

        anchors {
            top: id_root.top
            bottom: id_root.bottom
            horizontalCenter: id_root.horizontalCenter
        }
        width: 0
        contentWidth: width + height * p_remainItems
        clip: true

        Row {
            anchors.fill: parent
            Repeater {
                model: id_listOfStyle
                delegate: id_displayDelegate
            }
        }
    }

    function addItems(group)
    {
        id_listOfStyle.clear()
        p_curGroup = group
        id_container.width = id_container.height * Math.min(p_maxItems, elementsInGroup(group))
        p_remainItems = 0
        if((elementsInGroup(group) - p_maxItems) > 0){
            p_remainItems = elementsInGroup(group) - p_maxItems
        }

        switch(group){
            case Data.bar_group: {
                for (var i = 0; i < Data.bar_styles.length; i+=3) {
                    id_listOfStyle.append({"name": Data.bar_styles[i], "image": Data.bar_styles[i + 1],"source": Data.bar_styles[i + 2]})
                }
                break;
            }
            case Data.cir_group: {
                for (var i = 0; i < Data.cir_styles.length; i+=3) {
                        id_listOfStyle.append({"name": Data.cir_styles[i], "image": Data.cir_styles[i + 1],"source": Data.cir_styles[i + 2]})
                }
                break;
            }
        }
    }

    function elementsInGroup(group) {
        switch(group){
            case Data.bar_group: {
                return Data.bar_styles.length / 3;
            }
            case Data.cir_group: {
                return Data.cir_styles.length / 3;
            }
        }
    }
}
