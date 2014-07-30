import QtQuick 1.1


QMLMainForm {
    objectName:     "mainForm"

    property string textWesCur: "value"
    property string textWesNeed: "value"

    property string textCompName: "component"
    property string textRcpName    : "receipt"
    property string textCompProcsCnt: "comp.procs cnt"

    property    bool bStartDisable: false
    property    bool bRcpDisable: false

    property    string textCompStartNum: "1";
    property    int      iMaxCnt:10;

    signal  startPressed()
    signal  rcpPressed()

    QMLFrame{
        x: 8
        y: 8
        iwidth: 260
        iheight: 225

        QMLButton{
            objectName: "btnLoad"
            x: 52
            y: 177
            text: "Загрузить рцп"
            disabled: bRcpDisable
            onButtonClick:
                rcpPressed();
        }

        QMLButton{
            objectName: "btnStart"
            x: 158
            y: 177
            text: "Старт"
            disabled: bStartDisable
            onButtonClick:
                startPressed();
        }

        QMLValView{            
            x: 14
            y: 7
            width: 80
            height: 30
            textVal: textWesCur
        }

        QMLValView{
            x: 164
            y: 7
            width: 80
            height: 30
            textVal: textWesNeed
        }

        QMLValView{
            x: 14
            y: 65
            width: 230
            height: 30
            textVal: textCompName
        }


        QMLHidingView{
            x: 124
            y: 96
            textVal: textRcpName
        }

    }

    QMLIncDec {
        id: qmlincdec1
        x: 17
        y: 140
        iniVal:iMaxCnt
        onDwnClick: {
            iMaxCnt=iMaxCnt-1;
            iniVal=iMaxCnt;
        }
        onUpClick:{
            iMaxCnt=iMaxCnt+1;
            iniVal=iMaxCnt;
        }
    }

}
