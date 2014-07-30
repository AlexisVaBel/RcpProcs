import QtQuick 1.1

Rectangle {
    id:        valViewer
    property string textVal: ""
    width: 60
    height: 30

    color: "#504a4a"

    TextInput {        
        x: 2
        y: 7
        enabled: false
        color: "white";
        selectionColor: "blue"
        font.pixelSize: 14;
        width: parent.width-6
        horizontalAlignment: TextInput.AlignRight
        text:   textVal
    }
}
