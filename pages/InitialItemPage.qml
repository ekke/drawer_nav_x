import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "../common"

Pane {
    width: rootPane.width
    LabelHeadline {
        id: initLabel
        anchors.left: parent.left
        anchors.right: parent.right
        topPadding: 12
        wrapMode: Label.WordWrap
        horizontalAlignment: Qt.AlignHCenter
        text: "Welcome to ekkes APP demonstrating Bottom and Side Navigation"
    }
    BusyIndicator {
        topPadding: 24
        readonly property int size: Math.min(rootPane.availableWidth, rootPane.availableHeight) / 5
        width: size
        height: size
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: initLabel.bottom
    }
} // initialItem
