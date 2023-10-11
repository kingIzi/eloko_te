import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import SyllabusListModel 1.0
import SyllabusSearchFilterProxyModel 1.0
import "../components"

Page {
    id: _syllabusPage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    property string _courseId: "COURSE ID"
    property string _courseName: "COURSE NAME"
    IsLoadingItem{
        id: _isFetchingCourseSyllabuses
    }
    QtObject{
        id: _syllabusObj
        readonly property string courseId: _syllabusPage._courseId
    }
    Component.onCompleted: {
        _isFetchingCourseSyllabuses.open()
        _admin.getCourseSyllabus(_syllabusObj)
    }
    ScrollView{
        id: _flick2
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: _col4.implicitHeight + 40
        ColumnLayout{
            id: _col4
            anchors.fill: parent
            anchors.margins: 10
            spacing: 20
            Pane{
                id: _syllabusPageNavBar
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
                        text: _syllabusPage._courseName
                        Material.foreground: Assets.colors.black
                        Layout.alignment: Qt.AlignBottom
                        maximumLineCount: 1
                    }
                }
            }
            Connections{
                target: _admin
                function onCourseSyllabuses(syllabuses) {
                    _isFetchingCourseSyllabuses.close()
                    _syllabusListModel.populate(syllabuses)
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: _col5.implicitHeight
                ColumnLayout{
                    id: _col5
                    anchors.fill: parent
                    Item{
                        Layout.fillWidth: true
                        Layout.preferredHeight: _row4.implicitHeight
                        RowLayout{
                            id: _row4
                            anchors.fill: parent
                        }
                    }
                    TextField{
                        id: _searchText
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        readonly property string _placeholderText: qsTr("Type to search")
                        Material.accent: Qt.color("#000000")
                        Material.foreground: Assets.colors.black
                        selectedTextColor: Assets.colors.white
                        background: Rectangle{
                            radius: 20
                            Label{
                                font: _searchText.font
                                text: _searchText._placeholderText
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: _searchText.leftPadding
                                color: _searchText.placeholderTextColor
                                visible: _searchText.text.length === 0
                            }
                        }
                    }
                }
            }

            ListView{
                id: _listView
                clip: true
                Layout.fillWidth: true
                interactive: true
                Layout.preferredHeight: _listView.contentHeight
                Layout.maximumHeight: 700
                SyllabusListModel{
                    id: _syllabusListModel
                }
                model: SyllabusSearchFilterProxyModel{
                    sourceModel: _syllabusListModel
                    searchText: _searchText.text
                }

                spacing: 10
                delegate: SyllabusItemDelegate{
                    _syllabusName: model.syllabusName
                    _authorName: model.syllabusAuthor
                    _university: model.syllabusUniversities
                    _lessons: model.lessons
                    _thumbnail: model.thumbnail
                    _yearGroup: model.yearGroup
                    _languages: model.languages
                }
            }
        }
    }
}
