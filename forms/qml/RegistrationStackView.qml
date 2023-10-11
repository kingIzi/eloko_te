import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import "./pages"



StackView {
    readonly property alias _regStack: _stack
    id: _stack
    initialItem: LoginPage{}
}
