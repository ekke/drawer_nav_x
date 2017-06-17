// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../common"

ToolBar {
    id: myTitleBar
    property alias text: titleLabel.text

    RowLayout {
        focus: false
        spacing: 6
        anchors.fill: parent
        Item {
            width: 4
        }

        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                anchors.centerIn: parent
                source: "qrc:/images/"+iconOnPrimaryFolder+"/menu.png"
            }
            onClicked: {
                navigationBar.open()
            }
        }
        LabelTitle {
            id: titleLabel
            text: "ekke's Drawer APP"
            leftPadding: 6
            rightPadding: 6
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: textOnPrimary
        }
        ToolButton {
            focusPolicy: Qt.NoFocus
            enabled: false
        }
    } // end RowLayout
} // end ToolBar


