TARGET = amqpcpp_example1
TEMPLATE = app
QT = core network xml
CONFIG += console
CONFIG += c++14
CONFIG -= debug_and_release_target

SOURCES += \
        src/example_publish.cpp 


INCLUDEPATH += $$PWD/src/rabbitmq_client/amqpcpp/include
DEPENDPATH += $$PWD/src/rabbitmq_client/amqpcpp/include

INCLUDEPATH += $$PWD/src/rabbitmq_client/rabbitmq-c
DEPENDPATH += $$PWD/src/rabbitmq_client/rabbitmq-c

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/win32/ -llibrabbitmq
win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/win32/ -llibrabbitmqd
unix:CONFIG(release, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/unix/ -llibrabbitmq
unix:CONFIG(debug, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/unix/ -llibrabbitmqd

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/win32/liblibrabbitmq.a
win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/win32/liblibrabbitmqd.a
unix:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/unix/liblibrabbitmq.so
unix:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/unix/liblibrabbitmqd.so

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/win32/ -lamqpcpp
win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/win32/ -lamqpcppd
unix:CONFIG(release, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/unix/ -lamqpcpp
unix:CONFIG(debug, debug|release): LIBS += -L$$PWD/src/rabbitmq_client/lib/unix/ -lamqpcppd

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/win32/libamqpcpp.a
win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/win32/libamqpcppd.a
unix:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/unix/libamqpcpp.so
unix:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/src/rabbitmq_client/lib/unix/libamqpcppd.so
