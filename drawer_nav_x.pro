# ekke (Ekkehard Gentz) @ekkescorner
TEMPLATE = app
TARGET = drawer_nav_x

QT += qml quick core
CONFIG += c++11

HEADERS += \
    applicationui.hpp \
    uiconstants.hpp

SOURCES += main.cpp \
    applicationui.cpp

OTHER_FILES +=  main.qml \
    common/*.qml \
    navigation/*.qml \
    pages/*.qml \
    popups/*.qml \
    tabs/*.qml

OTHER_FILES += images/black/*.png \
    images/black/x18/*.png \
    images/black/x36/*.png \
    images/black/x48/*.png \
    images/white/*.png \
    images/white/x18/*.png \
    images/white/x36/*.png \
    images/white/x48/*.png \
    images/extra/*.png \
    translations/*.* \
    images/LICENSE \
    LICENSE \
    *.md

RESOURCES += \
    translations.qrc \
    qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

# T R A N S L A T I O N S

# if languages are added:
# 1. rebuild project to generate *.qm
# 2. add existing .qm files to translations.qrc

# if changes to translatable strings:
# 1. Run Tools-External-Linguist-Update
# 2. Run Linguist and do translations
# 3. Build and run on iOS and Android to verify translations
# 4. Optional: if translations not done: Run Tools-External-Linguist-Release

# Supported languages
LANGUAGES = de en

# used to create .ts files
 defineReplace(prependAll) {
     for(a,$$1):result += $$2$${a}$$3
     return($$result)
 }
# Available translations
tsroot = $$join(TARGET,,,.ts)
tstarget = $$join(TARGET,,,_)
TRANSLATIONS = $$PWD/translations/$$tsroot
TRANSLATIONS += $$prependAll(LANGUAGES, $$PWD/translations/$$tstarget, .ts)
# run LRELEASE to generate the qm files
qtPrepareTool(LRELEASE, lrelease)
 for(tsfile, TRANSLATIONS) {
     command = $$LRELEASE $$tsfile
     system($$command)|error("Failed to run: $$command")
 }
