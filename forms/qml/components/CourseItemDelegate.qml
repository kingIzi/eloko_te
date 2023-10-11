import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Assets 1.0
import Typography 1.0
import "../pages"


ItemDelegate{
    id: _course
    Layout.preferredWidth:  _courseListItem.width / 2
    Layout.preferredHeight: 140
    Material.background: Assets.colors.white
    Material.elevation: 4
    property string _courseId: ""
    property string _courseName: ""
    property string _numSyllabus: ""
    property url _thumbnail: ""
    Binding{
        target: _course.background
        property: "radius"
        value: 10
    }
    Binding{
        target: _course.background
        property: "color"
        value: Assets.colors.white
    }
    Component{
        id: _syllabusPageComponent
        SyllabusPage{
            _courseId: _course._courseId
            _courseName: _course._courseName
        }
    }
    Image{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        source: _course._thumbnail
        asynchronous: true
        sourceSize.width: 30
        sourceSize.height: 30
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: "PointingHandCursor"
        onClicked: {
            _mainStack.push(_syllabusPageComponent)
        }
    }
    ColumnLayout{
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 10
            leftMargin: 10
            rightMargin: 10
        }
        Label{
            text: _course._courseName
            Layout.fillWidth: true
            wrapMode: "WordWrap"
            font: Typography.regular.h5
            Material.foreground: Assets.colors.black
            Component.onCompleted: {
                font.bold = true
            }
        }
        Label{
            text: _course._numSyllabus
            font: Typography.regular.h6
            Layout.fillWidth: true
            Material.foreground: Assets.colors.darkGray
        }
    }
}



