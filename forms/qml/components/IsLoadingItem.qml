import QtQuick
import QtQuick.Controls.Material
import Assets 1.0

Popup{
    id: _busyPopup
    anchors.centerIn: parent
    width: 60
    height: 60
    padding: 20
    closePolicy: Popup.NoAutoClose
    dim: true
    Binding{
        target: _busyPopup.background
        property: "radius"
        value: 20
    }
    contentItem: BusyIndicator{
        id: _busy
        running: true
        anchors.fill: parent
        Material.accent: Assets.colors.primary
    }
}
