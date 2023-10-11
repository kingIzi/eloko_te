import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtWebView
import Assets 1.0
import Typography 1.0



Page{
    id: _readingPage
    property string _url: ""
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    BusyIndicator{
        z: 50
        running: _webView.loading
        anchors.centerIn: parent
        Material.accent: Assets.colors.primary
    }
    ColumnLayout{
        anchors.fill: parent
        Pane{
            Layout.fillWidth: true
            Layout.preferredHeight: 70
            RowLayout{
                anchors.fill: parent
                RoundButton{
                    icon.source: Assets.images.back
                    icon.color: Assets.colors.black
                    Material.background: "transparent"
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 50
                    onClicked: {
                        _mainStack.pop()
                    }
                }
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            WebView{
                id: _webView
                anchors.fill: parent
                url: _readingPage._url
                settings.allowFileAccess: true
                settings.localStorageEnabled: true
                Component.onCompleted: {
                    console.log(_readingPage._url)
                }
                onLoadProgressChanged: {
                    console.log(loadProgress)
                }
            }
        }
    }
}
