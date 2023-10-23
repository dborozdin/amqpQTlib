CONFIG(release, debug|release):  TARGET = librabbitmq
CONFIG(debug, debug|release):  TARGET = librabbitmqd

TEMPLATE = lib
QT = core network xml
CONFIG += console
CONFIG += c++14
CONFIG -= debug_and_release_target
CONFIG += skip_target_version_ext

INCLUDEPATH += $$PWD/openssl/include
DEPENDPATH += $$PWD/openssl/include
DEFINES+= HAVE_CONFIG_H
DEFINES+= WITH_SSL=1
DEFINES+= AMQP_BUILD
DEFINES+= AMQP_STATIC
DEFINES+= rabbitmq_EXPORTS


HEADERS += \
	amqp.h \
	amqp_framing.h \
	amqp_hostcheck.h \
	amqp_openssl_bio.h \
	amqp_openssl_hostname_validation.h \
	amqp_private.h \
	amqp_socket.h \
	amqp_ssl_socket.h \
	amqp_table.h \
	amqp_tcp_socket.h \
	amqp_time.h \
        config.h


SOURCES += \
        amqp_api.c \
	amqp_connection.c \
	amqp_consumer.c \
	amqp_framing.c \
	amqp_hostcheck.c \
	amqp_mem.c \
	amqp_openssl.c \
	amqp_openssl_bio.c \
	amqp_openssl_hostname_validation.c \
	amqp_socket.c \
	amqp_table.c \
	amqp_tcp_socket.c \
	amqp_time.c \
        amqp_url.c

win32: HEADERS +=win32/threads.h
unix: HEADERS += unix/threads.h
win32: SOURCES +=win32/threads.c


#----------------------------
# version info
VERSION = 1.0.0

DEFINES += APP_VERSION=\\\"$$VERSION\\\"
#----------------------------

win32: LIBS += -L$$PWD/openssl/lib/win64/ -lssl
win32: LIBS += -L$$PWD/openssl/lib/win64/ -lcrypto
unix: LIBS += -lssl
unix: LIBS += -lcrypto

win32: LIBS += -lws2_32
win32: LIBS += -lwinspool
win32: LIBS += -lwinspool
win32: LIBS += -lkernel32
win32: LIBS += -luser32
win32: LIBS += -lgdi32
win32: LIBS += -lwinspool
win32: LIBS += -lshell32
win32: LIBS += -loleaut32
win32: LIBS += -luuid
win32: LIBS += -lcomdlg32
win32: LIBS += -ladvapi32

win32: PRE_TARGETDEPS += $$PWD/openssl/lib/win64/libssl.a
win32: PRE_TARGETDEPS += $$PWD/openssl/lib/win64/libcrypto.a

win32: DESTDIR = $$PWD/../lib/win32
win32: DLLDESTDIR= $$PWD/../lib/win32
unix: DESTDIR = $$PWD/../lib/unix
unix: DLLDESTDIR= $$PWD/../lib/unix
