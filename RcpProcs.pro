QT          +=  core sql declarative
TARGET      =   RcpProcs
TEMPLATE    =   app

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    cmn/str_oper.cpp \
    cmn/num_oper.cpp \
    cmn/crc16.cpp \
    cntr/qmltester.cpp \
    dataprov/dbfirebird.cpp

HEADERS += \
    mainwindow.hpp \
    cmn/num_oper.h \
    cmn/crc16.h \
    cmn/str_oper.h \
    cntr/qmltester.hpp \
    dataprov/dbfirebird.hpp

OTHER_FILES += \
    view/WesView.qml \
    view/QMLButton.qml \
    view/QMLFrame.qml \
    view/QMLValView.qml \
    view/QMLHidingView.qml

RESOURCES += \
    res.qrc

FORMS +=
