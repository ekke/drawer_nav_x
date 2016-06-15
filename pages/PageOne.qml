// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../common"

Flickable {
    id: flickable
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    property string name: "PageOne"
    property string title: qsTr("Car")

    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Drive by Car")
            }
            IconInactive {
                imageName: modelData.icon
                imageSize: 48
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Navigate between Destinations:\n* Tap on a Button from ToolBar at Bottom (Portrait) or left side (Landscape)\n\nTap on 'Settings' Button to configure Navigation\n\nFrom 'Option Menu' (three dots) placed top right in Title you can switch Theme and change primary / accent colors\n\nIn Landscape mode Title is scrollable.\n\nBluetooth keyboard attached or BlackBerry PRIV?\n* Type '1', '2', '3', '4', '5' to go to Button 1...5")
                }
            }
            HorizontalDivider {}
            RowLayout {
                LabelBodySecondary {
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("In a real-life APP from each Navigation Button you will load StackViews, SwipeViews, TabBars, ... This Example APP only loads simple Pages to demo.")
                }
            }
            HorizontalDivider {}
        } // col layout
    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    // emitting a Signal could be another option
    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        console.log(qsTr("Init done from One [0]"))
    }
    // called from Component.destruction
    function cleanup() {
        console.log(qsTr("Cleanup done from One [0]"))
    }
} // flickable
