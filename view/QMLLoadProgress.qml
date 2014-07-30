// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    width: 50
    height: 50

    QMLArcButton {
        anchors.centerIn: parent
        Component.onCompleted: start();
    }

}
