import QtQuick
import QtQuick.Controls.Material
import Typography 1.0

Popup{
    id: _signInErrorMsgPopup
    property string _text: "Error MSg Here"
    anchors.centerIn: parent
    width: _loginPage.width - 30
    height: 100
    dim: true
    Binding{
        target: _signInErrorMsgPopup.background
        property: "radius"
        value: 10
    }
    contentItem: Item{
        anchors.fill: parent
        Label{
            anchors.centerIn: parent
            font: Typography.regular.p
            width: parent.width
            wrapMode: "WordWrap"
            text: _signInErrorMsgPopup._text
            horizontalAlignment: "AlignHCenter"
            verticalAlignment: "AlignVCenter"
        }
    }
}
