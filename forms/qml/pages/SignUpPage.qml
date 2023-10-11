import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0



Page{
    id: _loginPage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    Flickable{
        id: _flick
        anchors.fill: parent
        contentHeight: _col1.implicitHeight
        contentWidth: availableWidth
        ColumnLayout{
            id: _col1
            anchors.fill: parent
            anchors.topMargin: 40
            Text {
                id: _welcomeBacktext
                text: qsTr("Register")
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                font: Typography.regular.h1
            }
            Text {
                id: name
                text: qsTr("Fill the form to continue")
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                font: Typography.regular.p
                color: Assets.colors.darkGray
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: _col2.implicitHeight
                Layout.topMargin: 40
                ColumnLayout{
                    id: _col2
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 12
                    TextField{
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.accent: Material.Teal
                        placeholderText: qsTr("Full name")
                    }
                    TextField{
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.accent: Material.Teal
                        placeholderText: qsTr("Phone number (Optional)")
                    }
                    TextField{
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.accent: Material.Teal
                        placeholderText: qsTr("Email Address")
                    }
                    TextField{
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.accent: Material.Teal
                        placeholderText: qsTr("Password")
                        echoMode: "Password"
                    }
                    TextField{
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.accent: Material.Teal
                        placeholderText: qsTr("Confirm Password")
                        echoMode: "Password"
                    }
                    Button{
                        id: _loginBtn
                        Layout.fillWidth: true
                        Material.background: Assets.colors.black
                        text: qsTr("Sign up")
                        Material.foreground: Assets.colors.white
                        font: Typography.regular.h6
                        Binding{
                            target: _loginBtn.background
                            property: "radius"
                            value: 30
                        }
                    }
                    Label {
                        Layout.topMargin: 100
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Login")
                        font.underline: _hover.hovered ? true : false
                        font.family: Typography.primaryFont.name
                        font.pixelSize: 14
                        background: Item{}
                        HoverHandler{
                            id: _hover
                            enabled: true
                        }
                        MouseArea{
                            id: _mouse2
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: {
                                _regStack.pop()
                            }
                        }
                    }
                }
            }
        }
    }
}
