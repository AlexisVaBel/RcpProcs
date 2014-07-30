#ifndef QMLTESTER_HPP
#define QMLTESTER_HPP

#include <QObject>
#include <QTimer>
#include <QDebug>

class qmlTester : public QObject
{
    Q_OBJECT
public:
    explicit qmlTester(QObject *parent = 0,int iCntLim=0);

signals:
    void    processed(int iRes);
    void    stoped();
public slots:
    void    procs();
    void    startProcs();
    void    stopProcs();
private:
    int     m_iCurShot;
    int     m_iCntLimit;
    QTimer  *m_timer;
};

#endif // QMLTESTER_HPP
