import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import Assets 1.0
import Typography 1.0
import "../components"

Page {
    id: _syllabusLessonsPage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    property string _syllabusName: ""
    property var _lessons: []
    ScrollView{
        id: _scroll
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: _col6.implicitHeight + 40
        ColumnLayout{
            id: _col6
            anchors.fill: parent
            anchors.margins: 10
            spacing: 20
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
                    Label{
                        font: Typography.regular.h4
                        text: _syllabusLessonsPage._syllabusName
                        Material.foreground: Assets.colors.black
                        Layout.alignment: Qt.AlignBottom
                        maximumLineCount: 1
                    }
                }
            }
            ListModel {
                id: nameModel
                ListElement { name: "Applied Mathematics"; team: "Crypto" }
                ListElement { name: "Computer Science"; team: "Crypto" }
                ListElement { name: "Business Studies"; team: "QA" }
                ListElement { name: "Science & Technology"; team: "QA" }
                ListElement { name: "Artificial Intelligence"; team: "Graphics" }
            }
            ListView{
                id: _listView2
                clip: true
                Layout.fillWidth: true
                interactive: false
                Layout.preferredHeight: _listView2.contentHeight
                model: _syllabusLessonsPage._lessons
                spacing: 10
                delegate: SyllabusLessonItemDelegate{
                    _lessonName: modelData.name
                    _description: modelData.description
                    _url: modelData.url
                }
            }
        }
    }
}
