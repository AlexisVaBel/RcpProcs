import QtQuick 1.1
Item{
    property int iwidth:160
    property int iheight:225
    Rectangle {
        id: shadowRect
        x: 4
        y: 3
        width: iwidth
        height: iheight
        color: "#1d0101"
        opacity: 0.5
    }
    Rectangle {
        id: mainRect
        width: iwidth
        height: iheight
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }
            GradientStop {
                position: 1
                color: "#a29696"
            }
        }
    }

}
