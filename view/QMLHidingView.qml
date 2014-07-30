import QtQuick 1.1

Item{
    id:         hidingView
    property    int         iwidth:         100
    property    int         iheight:        32
    property    string   textVal:       ""
    property    bool      bHideDwn: true
    property    bool      bHideUp:    false

    Rectangle {
        id:       rectText
        x: 0
        y: 0
        width: iwidth
        height:1
        color: "#2f2222"

        TextInput {
            x: 2
            y: 7
            enabled: false
            color: "white";
            selectionColor: "blue"
            font.pixelSize: 14;
            width: parent.width-6
            height: parent.height
            horizontalAlignment: TextInput.AlignRight
            text:   textVal
        }
    }

    Image{
        id: showBtnUpDwn
        x: 42
        y: 1
        width:16
        height:16
        source: "images/dwn.png"

        MouseArea{
            anchors.fill:parent
            onClicked: {
                if((hidingView.state==="disableDown")){
                    hidingView.state="disableUp"
                }else{
                    hidingView.state="disableDown"
                }
            }
        }

    }

    states:[
        State{
            name: "disableUp"            
            PropertyChanges{
                target: rectText
                height: 1
            }
            PropertyChanges{
                target: showBtnUpDwn
                y: 1
            }
            PropertyChanges{
                target:showBtnUpDwn
                source: "images/dwn.png"
            }
        },
        State{
            name: "disableDown"            
            PropertyChanges{
                target: rectText
                height: iheight
            }
            PropertyChanges{
                target: showBtnUpDwn
                y: iheight
            }
            PropertyChanges{
                target:showBtnUpDwn
                source: "images/up.png"
            }
        }
    ]
        transitions: Transition{
            NumberAnimation{properties:"height"; duration:200}
            NumberAnimation{properties:"y"; duration:200}
        }
}
