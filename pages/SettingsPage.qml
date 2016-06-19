// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../common"

Flickable {
    property string name: "SettingsPage"
    // index to get access to Loader (Destination)
    property int myIndex: index
    contentHeight: root.height
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    clip: true

    Pane {
        id: root
        anchors.fill: parent
        padding: 24

        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Settings Drawer Navigation")
            }
            IconInactive {
                imageName: modelData.icon
                imageSize: 48
            }
            HorizontalDivider {}
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    topPadding: 6
                    leftPadding: 12
                    text: qsTr("Highlight Active Navigation Selection")
                    checked: highlightActiveNavigationButton
                    onCheckedChanged: {
                        highlightActiveNavigationButton = checked
                    }
                } // switch highlightActiveNavigationButton
            } // row switch highlightActiveNavigationButton
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    leftPadding: 12
                    text: qsTr("Hide TitleBar")
                    checked: hideTitleBar
                    onCheckedChanged: {
                        hideTitleBar = checked
                    }
                } // switch hideTitleBar
            } // row switch hideTitleBar
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    leftPadding: 12
                    text: qsTr("Show Favorites at Bottom in Portrait")
                    checked: showFavorites
                    onCheckedChanged: {
                        showFavorites = checked
                    }
                } // switch showFavorites
            } // row switch showFavorites

        } // col layout

    } // root

    ScrollIndicator.vertical: ScrollIndicator { }

    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        console.log(qsTr("Init done from Settings"))
    }
    // called from Component.destruction
    function cleanup() {
        console.log(qsTr("Cleanup done from Settings"))
    }

} // flickable
