import QtQuick 1.1

Item{
    id:         incdec
    property    int         iwidth:        100
    property    int         iheight:       32
    property    int         iniVal:         0
    property    string   textVal:       ""
    signal upClick()
    signal dwnClick()
    Rectangle {
        id:       rectText
        x: 0
        y: 0
        width: iwidth
        height:iheight
        color: "#2f2222"

        TextInput {
            id: textinput1
            x: 10
            y: 7
            width: 65
            enabled: false
            color: "white";
            selectionColor: "blue"
            font.pixelSize: 14;

            height: parent.height-8
            horizontalAlignment: TextInput.AlignRight
            text:   iniVal
        }
    }

    Image{
        id: decBtn
        x: 84
        y: 16
        width:16
        height:16
        source: "images/dwn.png"
        MouseArea{
            anchors.fill:parent
            onClicked: {
                dwnClick()
//                incdec.iniVal= incdec.iniVal-1
            }
        }
    }

    Image{
        id: incBtn
        x: 84
        y: 0
        width:16
        height:16
        source: "images/up.png"
        MouseArea{
            anchors.fill:parent
            onClicked: {
                upClick()
//                incdec.iniVal= incdec.iniVal+1
            }
        }
    }


}
