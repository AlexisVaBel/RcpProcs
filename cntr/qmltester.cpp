#include "qmltester.hpp"

qmlTester::qmlTester(QObject *parent,int iCntLim) :
    QObject(parent),
    m_iCntLimit(iCntLim){
    m_timer = new QTimer(this);
    connect(m_timer, SIGNAL(timeout()), this, SLOT(procs()));
}

void qmlTester::startProcs(){
    m_iCurShot=0;
    m_timer->start(1000);
}

void qmlTester::stopProcs(){
    m_timer->stop();
    emit stoped();
}

void qmlTester::procs(){
    m_iCurShot++;
    if(m_iCurShot>m_iCntLimit){
        stopProcs();
        return;
    }
    emit processed(m_iCurShot);
}
