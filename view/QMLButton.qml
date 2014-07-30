import QtQuick 1.1

Item {
    id   : baseButton
    width: 100
    height: 30

    smooth: true
    property string text: "button"
    property bool disabled: false
    signal buttonClick()


    Rectangle{
        id: normal
        anchors.fill:parent
        border.color: "#999999"
        border.width: 1
        radius: 10
        smooth: true
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#c19ee6"
            }

            GradientStop {
                position: 1
                color: "#4e1c71"
            }
        }
    }

    Rectangle{
        id: pressed
        anchors.fill:parent
        border.color: "#999999"
        border.width: 1
        radius: 10
        smooth: true
        opacity: 0
        gradient: Gradient {
            GradientStop {
                id: gradientstop1
                position: 0
                color: "#c0bfe4"
            }

            GradientStop {
                id: gradientstop2
                position: 1
                color: "#1a7554"
            }
        }
    }

    Rectangle{
        id: disabled
        anchors.fill:parent
        border.color: "#999999"
        border.width: 1
        radius: 10
        smooth: true
        opacity: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#999999"
            }

            GradientStop {
                position: 1
                color: "#4e1111"
            }
        }
    }

    Text{
        anchors.centerIn: parent
        text: parent.text
    }

    MouseArea{
        anchors.fill:parent
        onClicked: {
            if(!baseButton.disabled)
            buttonClick()
        }
        onPressed:{
            if(!baseButton.disabled)
                baseButton.state="pressed"
        }
        onReleased: {
            if(!baseButton.disabled)
                baseButton.state=""
        }
    }

    states:[
        State{
            name: "pressed"
            PropertyChanges {target:pressed; opacity:1}
        },
        State{
            name: "disabled"
            when: baseButton.disabled==true
            PropertyChanges{ target:disabled;opacity:1}
        }
    ]
    transitions: Transition{
        NumberAnimation{properties:"opacity"; duration:200}
    }
}
