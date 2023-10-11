import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import "../components"

Page {
    id: _adminsPage
    width: _root.width
    height: _root.height
    Material.background: Assets.colors.primary
    ScrollView{
        id: _scroll2
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: _col6.implicitHeight
        ColumnLayout{
            id: _col6
            anchors.fill: parent
            anchors.margins: 10
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
                        Layout.alignment: Qt.AlignVCenter
                        onClicked: {
                            _appLoader.state = "Home"
                        }
                    }
                    Label{
                        font: Typography.regular.h4
                        text: "Dashboard"
                        Material.foreground: Assets.colors.black
                        Layout.alignment: Qt.AlignBottom
                        maximumLineCount: 1
                    }
                }
            }
            TabBar{
                id: _tabBar
                currentIndex: _swipeView.currentIndex
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Repeater{
                    model: ["Course","Syllabus","Lesson"]
                    delegate: TabButton {
                        id: _tabButton
                        text: modelData
                        Material.accent: Assets.colors.white
                        font: Typography.regular.p
                    }
                }
            }
            SwipeView{
                id: _swipeView
                currentIndex: _tabBar.currentIndex
                Layout.fillWidth: true
                Layout.fillHeight: true
                Component{
                    id: _course
                    CourseForm{}
                }
                Component{
                    id: _second
                    SyllabusForm{}
                }
                Component {
                    id: _third
                    AddLessonForm{}
                }
                Repeater {
                        model: [_course,_second,_third]
                        Loader {
                            active: SwipeView.isCurrentItem
                            sourceComponent: modelData
                        }
                    }
            }
        }
    }
}
