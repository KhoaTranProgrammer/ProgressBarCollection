import QtQuick 2.0

Item {
    property int p_min: 0
    property int p_max: 100
    property int p_cur: 0
    property int p_interval: 20
    property int p_curFPS: 0
    property int p_actualFPS: 0

    signal fps(int target, int actual)

    Timer {
        id: id_timer
        repeat: true
        interval: p_interval
        running: true

        onTriggered: {
            if(p_cur == p_max){
                p_cur = p_min
            }
            p_cur++
        }
    }

    Timer {
        id: id_timer1s
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            p_actualFPS = p_curFPS
            p_curFPS = 0
            fps(getTargetFPS(), getActualFPS())
        }
    }

    function getTargetFPS(){
        return 1000 / p_interval;
    }

    function getActualFPS(){
        return p_actualFPS;
    }
}
