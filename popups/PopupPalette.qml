// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

Popup {
    id: popup
    property bool selectAccentColor: false
    Material.elevation: 8

    x: parent.width - width
    width: Math.min(appWindow.width, appWindow.height) / 3 * 2
    height: header? appWindow.height - header.height - 12 : appWindow.height -12
    transformOrigin: Popup.TopRight
    // Hint: as of Qt 5.7 Beta because of bug in dark theme,
    // background is too dark
    // https://bugreports.qt.io/browse/QTBUG-53266

    ListView {   
        id: listView
        // Attention: clip should be used carefully,
        // but using a ListView inside a Popup
        // you must set it to true
        // otherwise content will appear outside while scrolling
        // don't clip at Paopup: will cut the elevation shadow
        clip: true

        currentIndex: -1
        anchors.fill: parent
        implicitHeight: popup.height
        delegate: Item {
            id: itemDelegate
            width: parent.width
            implicitHeight: 40
            Row {
                spacing: 0
                leftPadding: 10
                Rectangle {
                    visible: selectAccentColor
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: 32
                    implicitWidth: 48
                    color: primaryColor
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: 32
                    implicitWidth: 32
                    color: model.bg
                }
                LabelBody {
                    leftPadding: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.title
                }
            } // end Row
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (selectAccentColor) {
                        appWindow.switchAccentPalette(index)
                    } else {
                        appWindow.switchPrimaryPalette(index)
                    }
                    popup.close()
                }
            } // mouse
        } // end delegateItem

        model: ListModel {
            ListElement { title: qsTr("Material Red"); bg: "#F44336" }
            ListElement { title: qsTr("Material Pink"); bg: "#E91E63" }
            ListElement { title: qsTr("Material Purple"); bg: "#9C27B0" }
            ListElement { title: qsTr("Material DeepPurple"); bg: "#673AB7" }
            ListElement { title: qsTr("Material Indigo"); bg: "#3F51B5" }
            ListElement { title: qsTr("Material Blue"); bg: "#2196F3" }
            ListElement { title: qsTr("Material LightBlue"); bg: "#03A9F4" }
            ListElement { title: qsTr("Material Cyan"); bg: "#00BCD4" }
            ListElement { title: qsTr("Material Teal"); bg: "#009688" }
            ListElement { title: qsTr("Material Green"); bg: "#4CAF50" }
            ListElement { title: qsTr("Material LightGreen"); bg: "#8BC34A" }
            ListElement { title: qsTr("Material Lime"); bg: "#CDDC39" }
            ListElement { title: qsTr("Material Yellow"); bg: "#FFEB3B" }
            ListElement { title: qsTr("Material Amber"); bg: "#FFC107" }
            ListElement { title: qsTr("Material Orange"); bg: "#FF9800" }
            ListElement { title: qsTr("Material DeepOrange"); bg: "#FF5722" }
            ListElement { title: qsTr("Material Brown"); bg: "#795548" }
            ListElement { title: qsTr("Material Grey"); bg: "#9E9E9E" }
            ListElement { title: qsTr("Material BlueGrey"); bg: "#607D8B" }
        }
        ScrollIndicator.vertical: ScrollIndicator { }
    } // end listView
} // end popup
