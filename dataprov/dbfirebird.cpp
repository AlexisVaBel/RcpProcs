#include "dbfirebird.hpp"


#include <QTableView>
#include <QDebug>


dbfirebird::dbfirebird(QObject *parent, QString strDB, QString strHost) :
    QObject(parent),
    m_strDB(strDB),
    m_strHost(strHost){
    qDebug()<<m_strDB;
    qDebug()<<m_strHost;

}

bool dbfirebird::connectToDB(){
    m_db=QSqlDatabase::addDatabase("QIBASE","QIBASE_MAIN");
    m_db.setDatabaseName(m_strDB);
    m_db.setHostName(m_strHost);
    m_db.setUserName(STRUSER);
    m_db.setPassword(STRPSW);
    if(!m_db.open()){
        m_strError=m_db.lastError().text();
        qDebug()<<m_strError;
        qDebug()<<m_db.drivers();
        return false;
    }
    qDebug()<<"connected";
    qDebug()<<m_db.tables();
    return true;
}

void dbfirebird::disConnectFrmDB(){
    qDebug()<<"disconnected";
    if(m_db.isOpen()) m_db.close();
}

void dbfirebird::editComponents(){
    m_modelCmp=new QSqlTableModel(this,m_db);
    m_modelCmp->setTable("KK_PRODUCT");
    m_modelCmp->select();
    qDebug()<<m_modelCmp->lastError().text();
    QTableView *tbl=new QTableView();
    tbl->setModel(m_modelCmp);
    tbl->show();
}

void dbfirebird::editReceipts(){
    m_modelRcp=new QSqlTableModel(this,m_db);
    m_modelRcp->setTable("KK_RECEIPT");
    m_modelRcp->select();
    qDebug()<<m_modelRcp->lastError().text();
    QTableView *tbl=new QTableView();
    tbl->setModel(m_modelRcp);
    tbl->show();
}

void dbfirebird::selectReceipt(){
    m_modelRcpSlt=new QSqlRelationalTableModel(this,m_db);
    m_modelRcpSlt->setTable("KK_RCPPROD");
    m_modelRcpSlt->setRelation(1,QSqlRelation("KK_RECEIPT","ID","NAME"));
    m_modelRcpSlt->setRelation(2,QSqlRelation("KK_PRODUCT","ID","NAME"));
    m_modelRcpSlt->select();
    qDebug()<<m_modelRcpSlt->lastError().text();
    QTableView *tbl=new QTableView();
    tbl->setModel(m_modelRcpSlt);
    tbl->show();
}
