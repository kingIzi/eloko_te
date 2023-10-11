#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtWebView/QtWebView>
#include <QSslSocket>
#include "admin.h"
#include "courseListModel.h"
#include "syllabusListModel.h"
#include "syllabussearchfilterproxymodel.h"

int main(int argc, char *argv[])
{
    QtWebView::initialize();
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts); // Set the required attribute
    qDebug() << "Device supports OpenSSL: " << QSslSocket::supportsSsl();
    QGuiApplication app(argc, argv);
    Admin admin("https://asia-southeast2-syllabustz-bd7fd.cloudfunctions.net/graphql");
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/eloko_te/forms/qml/Main.qml"_qs);
    qmlRegisterType<CourseListModel>("CourseListModel",1,0,"CourseListModel");
    qmlRegisterType<SyllabusListModel>("SyllabusListModel",1,0,"SyllabusListModel");
    qmlRegisterType<SyllabusSearchFilterProxyModel>("SyllabusSearchFilterProxyModel",1,0,"SyllabusSearchFilterProxyModel");
    qmlRegisterSingletonType(QUrl("qrc:/eloko_te/forms/qml/Assets.qml"), "Assets", 1, 0, "Assets");
    qmlRegisterSingletonType(QUrl("qrc:/eloko_te/forms/qml/Typography.qml"), "Typography", 1, 0, "Typography");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("_admin",&admin);
    engine.load(url);
    return app.exec();
}
