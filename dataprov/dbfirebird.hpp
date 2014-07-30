#ifndef DBFIREBIRD_HPP
#define DBFIREBIRD_HPP

#include <QObject>
#include <QString>
#include <QStringList>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlTableModel>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QtSql/QSqlRelationalTableModel>

static const QString    STRUSER="SYSDBA";
static const QString    STRPSW="masterkey";

class dbfirebird : public QObject
{
    Q_OBJECT
public:
    explicit dbfirebird(QObject *parent = 0,QString strDB=0,QString strHost=0);
    bool     connectToDB();
    void     disConnectFrmDB();
signals:

public slots:
    void            editComponents();
    void            editReceipts();
    void            selectReceipt();
private:
    QString         m_strDB;
    QString         m_strHost;
    QString         m_strSQL;

    QString         m_strError;

    QSqlDatabase    m_db;

    QSqlTableModel  *m_modelRcp;
    QSqlTableModel  *m_modelCmp;
    QSqlRelationalTableModel  *m_modelRcpSlt;
};

#endif // DBFIREBIRD_HPP
