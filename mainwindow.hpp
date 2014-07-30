#ifndef MAINWINDOW_HPP
#define MAINWINDOW_HPP

#include <QtGui>
#include <QMainWindow>
#include <QtDeclarative/QDeclarativeView>
#include <QGraphicsObject>
#include <QtDeclarative/QDeclarativeContext>
#include "cntr/qmltester.hpp"
#include "dataprov/dbfirebird.hpp"

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
signals:    
public slots:
    void procsWes(int iWes);
    void setLimit();
    void startProcs();
    void stopProcs();
    void stopCatch();
private:
    qmlTester               *tester;
    QObject                 *m_Root;
    QDeclarativeView *vwWes;
    dbfirebird              *dbAccess;

    void prepareWindow();
    void prepareSignSlots();
    void preparePort();
    void prepareDB();
};

#endif // MAINWINDOW_HPP
