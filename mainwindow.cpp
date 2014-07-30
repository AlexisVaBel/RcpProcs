#include "mainwindow.hpp"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent){
    prepareWindow();
    preparePort();
    prepareSignSlots();
    prepareDB();
}

MainWindow::~MainWindow()
{

}

void MainWindow::procsWes(int iWes){
    qDebug()<<QString::number(iWes);
    m_Root->setProperty("textWesCur",QString::number(iWes));
}

void MainWindow::setLimit(){
    int iVal=m_Root->property("iMaxCnt").toInt();
    qDebug()<<iVal;
    tester->setMaxTime(iVal);
}

void MainWindow::startProcs(){
    tester->startProcs();
    m_Root->setProperty("bRcpDisable",true);
}

void MainWindow::stopProcs(){
    tester->stopProcs();
}

void MainWindow::stopCatch(){
    m_Root->setProperty("bRcpDisable",false);
}

void MainWindow::prepareWindow(){
    setMinimumSize(1024,860);
    vwWes=new QDeclarativeView;
    vwWes->setSource(QUrl("qrc:/view/WesView.qml"));
    vwWes->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(vwWes);
    m_Root=vwWes->rootObject();
    vwWes->rootContext()->setContextProperty("window",this);
}

void MainWindow::prepareSignSlots(){
    connect(tester,SIGNAL(stoped()),this,SLOT(stopCatch()));
    connect(tester,SIGNAL(processed(int)),this,SLOT(procsWes(int)));
    connect(m_Root,SIGNAL(startPressed()),this,SLOT(startProcs()));
    connect(m_Root,SIGNAL(rcpPressed()),this,SLOT(setLimit()));
}

void MainWindow::preparePort(){
    // read config file before
    tester=new qmlTester(this,10);
}

void MainWindow::prepareDB(){
    dbAccess=new dbfirebird(this,"/media/asutp/promauto/promauto/inst/cpp/qt/db/kkormrcp2.fdb","localhost");
    dbAccess->connectToDB();
    dbAccess->selectReceipt();
}
