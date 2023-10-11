import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import "../components"


Page{
    id: _loginPage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    Component{
        id: _signUpPageComponent
        SignUpPage{}
    }
    QtObject {
        id: _loginForm
        readonly property string email: _email.text
        readonly property string password: _password.text
    }
    ErrorMsg{
        id: _signInErrorMsgPopup
    }
    IsLoadingItem{
        id: _busyPopup
    }
    Flickable{
        id: _flick
        anchors.fill: parent
        contentHeight: _col1.implicitHeight
        contentWidth: availableWidth
        Connections {
            target: _admin
            function onDisplayErrorMessage(errorMsg){
                console.log(errorMsg)
                _busyPopup.close()
                _signInErrorMsgPopup._text = "Your email or password is incorrect. Please try again."
                _signInErrorMsgPopup.open()
            }
        }

        ColumnLayout{
            id: _col1
            anchors.fill: parent
            anchors.topMargin: 40
            Text {
                id: _welcomeBacktext
                text: qsTr("Welcome back!")
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                font: Typography.regular.h1
            }
            Text {
                id: name
                text: qsTr("Please enter your details")
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
                        id: _email
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        placeholderText: qsTr("Email Address")
                        Material.accent: Qt.color("#000000")
                        Material.foreground: Assets.colors.white
                        selectedTextColor: Assets.colors.white
                    }
                    TextField{
                        id: _password
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        placeholderText: qsTr("Password")
                        echoMode: "Password"
                        Material.accent: Qt.color("#000000")
                        Material.foreground: Assets.colors.white
                        selectedTextColor: Assets.colors.white
                    }
                    Item{
                        Layout.fillWidth: true
                        Layout.preferredHeight: _row.implicitHeight
                        RowLayout{
                            id: _row
                            anchors.fill: parent
                            layoutDirection: "RightToLeft"
                            Label{
                                text: qsTr("Forgot password?")
                                font: Typography.regular.p
                                Material.foreground: Material.LightBlue
                                MouseArea{
                                    id: _mouse
                                    anchors.fill: parent
                                    cursorShape: "PointingHandCursor"
                                }
                            }
                        }
                    }
                    Button{
                        id: _loginBtn
                        Layout.fillWidth: true
                        Material.background: Assets.colors.black
                        text: qsTr("Login")
                        Material.foreground: Assets.colors.white
                        font: Typography.regular.h6
                        Binding{
                            target: _loginBtn.background
                            property: "radius"
                            value: 30
                        }
                        onClicked: {
                            _busyPopup.open()
                            _admin.signInUser(_loginForm)
                        }
                    }
                    Label {
                        Layout.topMargin: 100
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Sign up here")
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
                                _regStack.push(_signUpPageComponent)
                            }
                        }
                    }
                }
            }
        }
    }
}
