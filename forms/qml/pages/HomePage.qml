import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import CourseListModel 1.0
import "../components"

Page{
    id: _homePage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    Component.onCompleted: {
        _fetchingCoursesLoading.open()
        _admin.getCourseList(_fetchCourses)
    }
    QtObject {
        id: _fetchCourses
        readonly property int batchSize: 20
        readonly property string cursor: _courseListItem._cursor
    }
    IsLoadingItem{
        id: _fetchingCoursesLoading
    }
    Connections {
        target: _admin
        function onCourseList(courses,cursor){
            _fetchingCoursesLoading.close()
            _courseListItem._cursor = cursor
            _courseListModel.populate(courses)
        }
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
            Pane{
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                ColumnLayout{
                    id: _col3
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    Label{
                        id: _welcomeText
                        font: Typography.regular.h3
                        Layout.fillWidth: true
                        text: "Hi you!"
                        Material.foreground: Assets.colors.black
                    }
                    Label {
                        Layout.fillWidth: true
                        font: Typography.regular.p
                        Material.foreground: Assets.colors.darkGray
                        text: new Date().toDateString()
                    }
                }
                RoundButton{
                    icon.source: Assets.images.user
                    icon.color: Assets.colors.white
                    Material.background: Assets.colors.black
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: {
                        //_profileMenu.open()
                    }
                }
            }
            Item{
                id: _courseListItem
                Layout.fillWidth: true
                Layout.preferredHeight: _grid2.implicitHeight
                property string _cursor: ""
                GridLayout{
                    id: _grid2
                    anchors.fill: parent
                    columns: 2
                    Repeater{
                        model: CourseListModel {
                            id: _courseListModel
                        }
                        delegate: CourseItemDelegate{
                            _courseName: model.courseName
                            _numSyllabus: model.numSyllabus
                            _thumbnail: model.thumbnail
                            _courseId: model.courseId
                        }
                    }
                    ItemDelegate{
                        id: _settings
                        Layout.preferredWidth:  _courseListItem.width / 2
                        Layout.preferredHeight: 140
                        Material.background: Assets.colors.white
                        //visible: _admin.userProfile.role === "Admin"
                        onClicked: {
                            _appLoader.state = "Admin"
                        }

                        Binding{
                            target: _settings.background
                            property: "radius"
                            value: 10
                        }
                        Binding{
                            target: _settings.background
                            property: "color"
                            value: Assets.colors.danger
                        }
                        Image{
                            anchors.centerIn: parent
                            sourceSize.width: 50
                            sourceSize.height: 50
                            source: Assets.images.plus
                        }
                    }
                }
            }
        }
    }
}

//Page {
//    id: _homePage
//    width: _root.width
//    height: _root.height
//    Material.background: Assets.colors.primary
//    ProfileMenu{
//        id: _profileMenu
//    }
//    QtObject {
//        id: _fetchCourses
//        readonly property int batchSize: 20
//        readonly property string cursor: _courseListItem._cursor
//    }
//    IsLoadingItem{
//        id: _fetchingCoursesLoading
//    }

//    Component.onCompleted: {
//        _fetchingCoursesLoading.open()
//        //_admin.getCourseList(_fetchCourses)
//    }
//    ScrollView{
//        id: _flick2
//        anchors.fill: parent
//        contentWidth: availableWidth
//        contentHeight: _col4.implicitHeight + 40
//        ColumnLayout{
//            id: _col4
//            anchors.fill: parent
//            anchors.margins: 10
//            Pane{
//                Layout.fillWidth: true
//                Layout.preferredHeight: 100
//                ColumnLayout{
//                    id: _col3
//                    anchors.left: parent.left
//                    Label{
//                        id: _welcomeText
//                        font: Typography.regular.h3
//                        Layout.fillWidth: true
//                        text: "Hi you!"
//                        Material.foreground: Assets.colors.black
//                    }
//                    Label {
//                        Layout.fillWidth: true
//                        font: Typography.regular.p
//                        Material.foreground: Assets.colors.darkGray
//                        text: new Date().toDateString()
//                    }
//                }
//                RoundButton{
//                    icon.source: Assets.images.user
//                    icon.color: Assets.colors.white
//                    Material.background: Assets.colors.black
//                    anchors.right: parent.right
//                    anchors.verticalCenter: parent.verticalCenter
//                    onClicked: {
//                        _profileMenu.open()
//                    }
//                }
//            }
//            Item{
//                id: _courseListItem
//                Layout.fillWidth: true
//                Layout.preferredHeight: _grid2.implicitHeight
//                property string _cursor: ""
//                Connections {
//                    target: _admin
//                    function onCourseList(courses,cursor){
//                        _fetchingCoursesLoading.close()
//                        _courseListItem._cursor = cursor
//                        _courseListModel.populate(courses)
//                    }
//                }
//                GridLayout{
//                    id: _grid2
//                    anchors.fill: parent
//                    columns: 2
//                    Repeater{
//                        model: CourseListModel {
//                            id: _courseListModel
//                        }
//                        delegate: CourseItemDelegate{
//                            _courseName: model.courseName
//                            _numSyllabus: model.numSyllabus
//                            _thumbnail: model.thumbnail
//                            _courseId: model.courseId
//                        }
//                    }
//                    ItemDelegate{
//                        id: _settings
//                        Layout.preferredWidth:  _courseListItem.width / 2
//                        Layout.preferredHeight: 140
//                        Material.background: Assets.colors.white
//                        visible: _admin.userProfile.role === "Admin"
//                        Binding{
//                            target: _settings.background
//                            property: "radius"
//                            value: 10
//                        }
//                        Binding{
//                            target: _settings.background
//                            property: "color"
//                            value: Assets.colors.danger
//                        }
//                        Image{
//                            anchors.centerIn: parent
//                            sourceSize.width: 50
//                            sourceSize.height: 50
//                            source: Assets.images.plus
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
