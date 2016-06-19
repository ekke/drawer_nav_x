// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "../pages"

// special Loader to load Destinations:
// Pages, Panes, StackView, SwipeView, TabBar
// loaded from Navigation at root: Bottom/Side Navigation or Drawer
// root is StackView with only one Item, always replaced()
Loader {
    id: pageLoader
    property int pageActivationPolicy: modelData.a_p
    active: pageActivationPolicy == activationPolicy.IMMEDIATELY
    source: modelData.source
    onLoaded: {
        item.init()
        if(pageActivationPolicy != activationPolicy.IMMEDIATELY) {
            rootPane.replaceDestination(pageLoader)
        }
    }
}
