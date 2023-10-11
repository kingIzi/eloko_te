import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import "../pages"

ItemDelegate{
    id: _syllabusItemDelegate
    width: _listView.width
    height: 140
    Material.elevation: 4
    //Material.background: _syllabusItemDelegate.hovered ? Assets.colors.darkGray : Assets.colors.white
    property string _syllabusName: ""
    property string _authorName: ""
    property string _university: ""
    property string _yearGroup: ""
    property var _lessons: []
    property url _thumbnail: ""
    property var _languages: []
    Binding{
        target: _syllabusItemDelegate.background
        property: "radius"
        value: 10
    }
    Binding{
        target: _syllabusItemDelegate.background
        property: "color"
        value: Assets.colors.white
    }
    Component{
        id: _syllabusLessonsPage
        SyllabusLessonsPage{
            _syllabusName: _syllabusItemDelegate._syllabusName
            _lessons: _syllabusItemDelegate._lessons
        }
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: "PointingHandCursor"
        onClicked: {
            _mainStack.push(_syllabusLessonsPage)
        }
    }
    contentItem: ColumnLayout{
        id: _col5
        anchors.fill: parent
        anchors.margins: 10
        Label{
            id: _label
            text: qsTr(_syllabusItemDelegate._syllabusName)
            font: Typography.regular.p
            Component.onCompleted: {
                _label.font.bold = true
            }
            Material.foreground: Assets.colors.darkGray
        }
        Label{
            id: _author
            text: qsTr(_syllabusItemDelegate._authorName)
            font: Typography.regular.toolTip
            Material.foreground: Assets.colors.darkGray
        }
        Label{
            id: _yearGroup
            text: qsTr(_syllabusItemDelegate._yearGroup)
            font: Typography.regular.toolTip
            Material.foreground: Assets.colors.darkGray
            Layout.alignment: Qt.AlignBottom | Qt.AlignLeft
            Component.onCompleted: {
                _yearGroup.font.bold = true
            }
        }
        Image{
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            sourceSize.width: 80
            Layout.preferredHeight: 80
            Layout.fillHeight: true
            source: _syllabusItemDelegate._thumbnail
        }
        Flow{
            Layout.fillWidth: true
            flow: Flow.LeftToRight
            spacing: 2
            Label{
                Layout.alignment: Qt.AlignBottom | Qt.AlignLeft
                font: Typography.regular.toolTip
                text: "Lang:"
            }
            Repeater{
                model: _syllabusItemDelegate._languages
                delegate: Label{
                    Layout.alignment: Qt.AlignBottom | Qt.AlignLeft
                    font: Typography.regular.toolTip
                    text: modelData
                }
            }
        }
    }
}


