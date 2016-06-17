// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ToolButton {
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus
    height: 56
    implicitWidth: 36
    Item {
        anchors.horizontalCenter: parent.horizontalCenter
        height: 36
        Image {
            height: 24
            width: 24
            verticalAlignment: Image.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/images/"+iconFolder+"/menu.png"
        }
    }
    onClicked: {
        navigationBar.open()
    }
}
