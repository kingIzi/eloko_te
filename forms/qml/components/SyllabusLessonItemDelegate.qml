import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import Assets 1.0
import Typography 1.0
import "../pages"



Rectangle{
    id: _rect2
    width: _root.width
    height: 70
    property url _url: ""
    property string _lessonName: ""
    property string _description: ""
    ItemDelegate{
        id: _syllabusLessonItemDelegate
        width: _listView2.width
        height: 70
        Component{
            id: _webEngine
            ReadingPage{
                _url: _syllabusLessonItemDelegate._url
            }
        }
        onClicked: {
            _mainStack.push(_webEngine)
        }
        property url _url: _rect2._url
        property string _lessonName: _rect2._lessonName
        property string _description: _rect2._description
        contentItem: RowLayout{
            Image{
                source: Assets.images.pdf
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20
                sourceSize{
                    width: 20
                    height: 20
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: _col5.implicitHeight
                Layout.leftMargin: 4
                ColumnLayout{
                    id: _col5
                    anchors.fill: parent
                    Label{
                        id: _lessonName
                        text: qsTr(_syllabusLessonItemDelegate._lessonName)
                        font: Typography.regular.p
                        Material.foreground: Assets.colors.darkGray
                        Layout.fillWidth: true
                        wrapMode: "WordWrap"
                        maximumLineCount: 2
                        Component.onCompleted: {
                            _lessonName.font.bold = true
                        }
                    }
                    Label{
                        id: _description
                        text: qsTr(_syllabusLessonItemDelegate._description)
                        font: Typography.regular.p
                        Material.foreground: Assets.colors.darkGray
                    }
                }
            }
        }
    }
}


//ItemDelegate{
//    id: _syllabusLessonItemDelegate
//    width: _listView2.width
//    height: 70
//    Binding{
//        target: _syllabusLessonItemDelegate.background
//        property: "radius"
//        value: 10
//    }
//    Binding{
//        target: _syllabusLessonItemDelegate.background
//        property: "color"
//        value: Assets.colors.primary
//    }
//    Component{
//        id: _webEngine
//        ReadingPage{
//            _url: _syllabusLessonItemDelegate._url
//        }
//    }
//    onClicked: {
//        _mainStack.push(_webEngine)
//    }
//    property url _url: ""
//    property string _lessonName: ""
//    property string _description: ""
//    contentItem: RowLayout{
//        Image{
//            source: Assets.images.pdf
//            Layout.preferredWidth: 20
//            Layout.preferredHeight: 20
//            sourceSize{
//                width: 20
//                height: 20
//            }
//        }
//        Item{
//            Layout.fillWidth: true
//            Layout.preferredHeight: _col5.implicitHeight
//            Layout.leftMargin: 4
//            ColumnLayout{
//                id: _col5
//                anchors.fill: parent
//                Label{
//                    id: _lessonName
//                    text: qsTr(_syllabusLessonItemDelegate._lessonName)
//                    font: Typography.regular.p
//                    Material.foreground: Assets.colors.darkGray
//                    Layout.fillWidth: true
//                    maximumLineCount: 1
//                    Component.onCompleted: {
//                        _lessonName.font.bold = true
//                    }
//                }
//                Label{
//                    id: _description
//                    text: qsTr(_syllabusLessonItemDelegate._description)
//                    font: Typography.regular.p
//                    Material.foreground: Assets.colors.darkGray
//                }
//            }
//        }
//    }
//}
