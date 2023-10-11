import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Dialogs
import Typography 1.0
import Assets 1.0

Item {
    id: _courseFormItem
    implicitWidth: _root.width
    width: implicitWidth
    implicitHeight: _col7.implicitHeight + 20
    height: implicitHeight
    QtObject {
        id: _courseForm
        readonly property string name: _courseName.text
        readonly property var universities: ["UDSM"]
        readonly property url thumbnail: ""
        readonly property int numSyllabus: 0
    }
    FileDialog {
        id: _fileDialog
        nameFilters: ["Image files (*.png *.jpg *.jpeg)"]
    }
    ColumnLayout{
        id: _col7
        anchors.fill: parent
        spacing: 10
        Label{
            Layout.alignment: Qt.AlignHCenter
            text: "Add Course"
            font: Typography.regular.h3
            Layout.topMargin: 20
        }
        TextField{
            id: _courseName
            Layout.fillWidth: true
            font: Typography.regular.p
            placeholderText: qsTr("Course name")
            Material.accent: Qt.color("#000000")
            Material.foreground: Assets.colors.white
            selectedTextColor: Assets.colors.white
        }
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: _col8.implicitHeight
            ColumnLayout{
                id: _col8
                anchors.fill: parent
                spacing: 10
                property ListModel _model: ListModel{
                    id: _courseUniversityListModel
                    ListElement { text: "" }
                }
                Repeater{
                    id: _repeater
                    model: _courseUniversityListModel
                    delegate: Item{
                        Layout.fillWidth: true
                        Layout.preferredHeight: _row3.implicitHeight
                        readonly property alias _comboBox: _comboBox2
                        RowLayout{
                            id: _row3
                            anchors.fill: parent
                            ComboBox {
                                id: _comboBox2
                                editable: false
                                Layout.fillWidth: true
                                Material.accent: Qt.color("#000000")
                                Material.foreground: Assets.colors.white
                                font: Typography.regular.p
                                model: ListModel {
                                    id: _modelCourse
                                    ListElement { text: "University of Dar es Salaam" }
                                    ListElement { text: "University of Arusha" }
                                    ListElement { text: "University of Bagamoyo" }
                                }
                            }
                            RoundButton{
                                icon.source: index === _courseUniversityListModel.count - 1 ?  Assets.images.plus1 : Assets.images.minus
                                icon.color: Assets.colors.white
                                Material.background: Assets.colors.black
                                onClicked: {
                                    if ( index === _courseUniversityListModel.count - 1) {
                                        _courseUniversityListModel.append({text: "Univerisity of Dar es Salaam"})
                                    }
                                    else {
                                        _courseUniversityListModel.remove(index)
                                    }
                                }
                            }
                        }
                    }
                }
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row4.implicitHeight
                    RowLayout{
                        id: _row4
                        anchors.fill: parent
                        Button{
                            text: "..."
                            font: Typography.regular.p
                            onClicked: {
                                _fileDialog.open()
                            }
                        }
                    }
                }
            }
        }
        Button{
            id: _addCourseBtn
            property var _model: []
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            Material.background: Assets.colors.black
            text: qsTr("Add course")
            Material.foreground: Assets.colors.white
            font: Typography.regular.h6
            Binding{
                target: _addCourseBtn.background
                property: "radius"
                value: 30
            }
            onClicked: {
                for (let i = 0; i < _repeater.count; i++){
                    _courseForm.universities.push(_repeater.itemAt(i)._comboBox.displayText)
                }
                _admin.addCourse(_courseForm)
            }
        }
    }
}
