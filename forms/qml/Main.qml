import QtQuick
import QtQuick.Controls.Material
import "./pages"

ApplicationWindow {
    id: _root
    width: 340
    height: 723
    visible: true
    title: qsTr("Hello World")
    Component.onCompleted: {
        contentItem.Keys.released.connect(function(event) {
            if (event.key === Qt.Key_Back) {
                event.accepted = true
                _root.back()
            }
        })
    }
    function back() {
        let stack = _appLoader.item
        if (stack.depth > 1) {
            stack.pop()
        }
        else if (stack.depth === 1) {
            _root.close()
        }
    }
    Component{
        id: _adminView
        StackView {
            id: _stack
            readonly property alias _adminViewStack: _stack
            initialItem: AdminsPage{}
        }
    }
    Component{
        id: _registration
        RegistrationStackView{}
    }
    Component{
        id: _homePageComponent
        StackView{
            id: _stack
            readonly property alias _mainStack: _stack
            initialItem: HomePage{
                id: _homePageItem
            }
        }
    }
    Loader {
        id: _appLoader
        anchors.fill: parent
        visible: true
        active: visible
        //state: _admin.isLoggedIn ? "Home" : "Default"
        state: "Home"
        //state: "Admin"
        sourceComponent: _registration
        states: [
            State {
                name: "Default"
                PropertyChanges {
                    target: _appLoader
                    sourceComponent: _registration
                }
            },
            State {
                name: "Home"
                PropertyChanges {
                    target: _appLoader
                    sourceComponent: _homePageComponent
                }
            },
            State {
                name: "Admin"
                PropertyChanges {
                    target: _appLoader
                    sourceComponent: _adminView
                }
            }
        ]
    }
}
