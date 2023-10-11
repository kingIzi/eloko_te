import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import Assets 1.0
import Typography 1.0


Drawer {
    id: _profileMenu
    width: _root.width
    height: _root.height / 1.3
    Material.background: Assets.colors.white
    edge: "BottomEdge"
    readonly property var profile: _admin.userProfile
    ColumnLayout{
        spacing: 20
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 10
            leftMargin: 10
            rightMargin: 10
        }
        TextField{
            Layout.fillWidth: true
            font: Typography.regular.p
            Material.accent: Material.Teal
            text: qsTr(_profileMenu.profile.fullName)
            enabled: false
        }
        TextField{
            Layout.fillWidth: true
            font: Typography.regular.p
            Material.accent: Material.Teal
            text: qsTr(_profileMenu.profile.phoneNo)
            enabled: false
        }
        TextField{
            Layout.fillWidth: true
            font: Typography.regular.p
            Material.accent: Material.Teal
            text: qsTr(_profileMenu.profile.email)
            enabled: false
        }
        Button{
            id: _loginBtn
            Layout.fillWidth: true
            Layout.topMargin: 30
            Material.background: Assets.colors.black
            text: qsTr("Update")
            Material.foreground: Assets.colors.white
            font: Typography.regular.h6
            enabled: false
            Binding{
                target: _loginBtn.background
                property: "radius"
                value: 30
            }
        }
    }
}
