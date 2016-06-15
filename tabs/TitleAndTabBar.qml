// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

ColumnLayout {
    property alias text: myTitleBar.text
    property alias currentIndex: myTabBar.currentIndex
    spacing: 6
    SwipeTextTitle {
        id: myTitleBar
        backToolButtonVisible: false
        Layout.fillWidth: true
    }
    TabBar {
        id: myTabBar
        anchors.left: parent.left
        anchors.right: parent.right
        currentIndex: 0
        onCurrentIndexChanged: {
            navPane.currentIndex = currentIndex
        }
        Repeater {
            model: tabButtonModel
            TabButton {
                focusPolicy: Qt.NoFocus
                text: modelData.name
                width: tabBarIsFixed? myTabBar.width / tabButtonModel.length  : Math.max(112, myTabBar.width / tabButtonModel.length)
            }
        } // repeater

    }
}
