// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 640
    height: 480
    gradient: Gradient {
        GradientStop {
            position: 0.020
            color: "#32abdb"
        }

        GradientStop {
            position: 0.160
            color: "#79b5e2"
        }

        GradientStop {
            position: 0.480
            color: "#adcee6"
        }

        GradientStop {
            position: 1
            color: "#438fbe"
        }
    }

}
