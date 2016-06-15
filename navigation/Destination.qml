// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "../pages"

// special Loader to load Destinations:
// Pages, Panes, StackView, SwipeView, TabBar
// loaded from Navigation at root: Bottom/Side Navigation or Drawer
// content at root is StackView with only one always replaced item
Loader {
    id: pageLoader
    active: false
    source: modelData.source
    onLoaded: {
        item.init()
        rootPane.replace(item)
        if(index == 0) {
            rootPane.firstDestinationLoaded()
        }
    }
}
