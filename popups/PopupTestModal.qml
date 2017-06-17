import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "../common"

Popup {
    id: popup
    closePolicy: Popup.NoAutoClose
    property alias text: popupLabel.text
    property alias buttonText: okButton.text
    z: 3
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    implicitHeight: 240
    implicitWidth: parent.width * .9
    modal: true
    ColumnLayout {
        anchors.right: parent.right
        anchors.left: parent.left
        spacing: 10
        RowLayout {
            LabelSubheading {
                id: popupLabel
                topPadding: 20
                leftPadding: 8
                rightPadding: 8
                text: ""
                color: popupTextColor
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            } // popupLabel
        } // row label
        RowLayout {
            ButtonFlat {
                id: okButton
                text: "Close"
                textColor: accentColor
                onClicked: {
                    popup.close()
                }
            } // okButton
        } // row button
    } // col layout

    onAboutToHide: {
        appWindow.backKeyBlocked = false
    }
    onAboutToShow: {
        appWindow.backKeyBlocked = true
    }


} // popup
