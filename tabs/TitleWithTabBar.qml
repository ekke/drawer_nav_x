// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import "../common"

ToolBar {
    property alias text: titleLabel.text
    property bool backToolButtonVisible: false
    property alias currentIndex: myTabBar.currentIndex
    // explains how to calculate the height:
    property int defaultToolBar: 48
    property int defaultTabBar: 48
    // without this selected tab not marked
    property int landscapeExtra: isLandscape? 1 : 0
    height: defaultToolBar + defaultTabBar + landscapeExtra
    RowLayout {
        id: topRow
        focus: false
        spacing: 6
        anchors.left: parent.left
        anchors.right: parent.right
        ToolButton {
            enabled: backToolButtonVisible
            focusPolicy: Qt.NoFocus
            Image {
                id: backImageImage
                visible: backToolButtonVisible
                anchors.centerIn: parent
                source: "qrc:/images/"+iconOnPrimaryFolder+"/arrow_back.png"
            }
            onClicked: {
                navPane.onePageBack()
            }
        }
        LabelTitle {
            id: titleLabel
            text: "ekke"
            // leftPadding: 16
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: textOnPrimary
        }
        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                id: buttonImage
                anchors.centerIn: parent
                source: "qrc:/images/"+iconOnPrimaryFolder+"/more_vert.png"
            }
            onClicked: {
                optionsMenu.open()
            }
            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight
                MenuItem {
                    text: isDarkTheme? qsTr("Light Theme") : qsTr("Dark Theme")
                    onTriggered: {
                        themePalette = myApp.swapThemePalette()
                    }
                }
                MenuItem {
                    text: qsTr("Select Primary Color")
                    onTriggered: {
                        popup.selectAccentColor = false
                        popup.open()
                    }
                }
                MenuItem {
                    text: qsTr("Select Accent Color")
                    onTriggered: {
                        popup.selectAccentColor = true
                        popup.open()
                    }
                }
                onAboutToHide: {
                    appWindow.resetFocus()
                }
            } // end optionsMenu

        } // end ToolButton
    } // end RowLayout

    TabBar {
        id: myTabBar
        // we cannot customize the selectionBar, it's always accentColor
        // so we ov erwrite the accent
        Material.accent: textOnPrimary
        anchors.top: topRow.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        currentIndex: 0
        onCurrentIndexChanged: {
            navPane.currentIndex = currentIndex
        }
        background: Rectangle {
            color: primaryColor
        }
        Repeater {
            model: tabButtonModel
            TabButton {
                focusPolicy: Qt.NoFocus
                height: 48
                contentItem:
                    Item {
                    LabelBody {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Medium
                        color: textOnPrimary
                        opacity: index == navPane.currentIndex? toolBarActiveOpacity : toolBarInactiveOpacity
                        text: modelData.name
                    }
                } // content item
                text: modelData.name
                width: tabBarIsFixed? myTabBar.width / tabButtonModel.length  : Math.max(112, myTabBar.width / tabButtonModel.length)
            }
        } // repeater

    } // myTabBar

}// end ToolBar


