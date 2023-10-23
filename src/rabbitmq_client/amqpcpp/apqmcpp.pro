CONFIG(release, debug|release):  TARGET = amqpcpp
CONFIG(debug, debug|release):  TARGET = amqpcppd
TEMPLATE = lib
QT = core network xml
CONFIG += console
CONFIG += c++14

INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include

HEADERS += \
        include/AMQPcpp.h

SOURCES += \
        src/AMQP.cpp \
        src/AMQPBase.cpp \
        src/AMQPException.cpp \
        src/AMQPExchange.cpp \
        src/AMQPMessage.cpp \
        src/AMQPQueue.cpp


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../lib/win32 -llibrabbitmq
win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../lib/win32 -llibrabbitmqd
unix:CONFIG(release, debug|release): LIBS += -L$$PWD/../lib/unix -llibrabbitmq
unix:CONFIG(debug, debug|release): LIBS += -L$$PWD/../lib/unix -llibrabbitmqd

INCLUDEPATH += $$PWD/../rabbitmq-c
DEPENDPATH += $$PWD/../rabbitmq-c

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../lib/win32/liblibrabbitmq.a
win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../lib/win32/liblibrabbitmqd.a
unix:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../lib/unix/liblibrabbitmq.so
unix:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../lib/unix/liblibrabbitmqd.so

win32: DESTDIR = $$PWD/../lib/win32
win32: DLLDESTDIR= $$PWD/../lib/win32
unix: DESTDIR = $$PWD/../lib/unix
unix: DLLDESTDIR= $$PWD/../lib/unix
