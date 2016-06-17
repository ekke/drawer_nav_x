// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

ToolButton {
    id: myButton
    // as default this Button is uncolored and lives inside a color Bar
    property bool isColored: false
    property bool isActive: modelData == navigationIndex
    property string myIconFolder: isColored? iconFolder : iconOnPrimaryFolder
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus
    height: 56
    width: myBar.width / (favoritesModel.length + 1)
    Column {
        spacing: 0
        topPadding: myButton.isActive ? 0 : 6
        anchors.horizontalCenter: parent.horizontalCenter
        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 24
            height: 24
            Image {
                id: contentImage
                width: 24
                height: 24
                verticalAlignment: Image.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/images/"+myIconFolder+"/"+ navigationModel[modelData].icon
                opacity: isActive? myBar.activeOpacity : myBar.inactiveOpacity
            }
            ColorOverlay {
                id: colorOverlay
                visible: myButton.isColored && myButton.isActive
                anchors.fill: contentImage
                source: contentImage
                color: primaryColor
            }
        } // image and coloroverlay
        Label {
            visible: myButton.isActive
            anchors.horizontalCenter: parent.horizontalCenter
            text: navigationModel[modelData].name
            opacity: isColored? (isActive? 1.0 : 0.7) : (isActive? myBar.activeOpacity : myBar.inactiveOpacity)
            color: isColored? (isActive? primaryColor : flatButtonTextColor) : textOnPrimary
            font.pixelSize: myButton.isActive? fontSizeActiveNavigationButton : fontSizeInactiveNavigationButton
        } // label
    } // column
    onClicked: {
        navigationIndex = modelData
    }
} // myButton
