import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Dialogs
import Typography 1.0
import Assets 1.0

Item {
    implicitWidth: _root.width
    width: implicitWidth
    implicitHeight: _col7.implicitHeight + 20
    height: implicitHeight
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
            text: "Add Syllbus"
            font: Typography.regular.h3
            Layout.topMargin: 20
        }
        TextField{
            id: _courseName
            Layout.fillWidth: true
            font: Typography.regular.p
            placeholderText: qsTr("Syllabus name")
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
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row3.implicitHeight
                    RowLayout{
                        id: _row3
                        anchors.fill: parent
                        ComboBox {
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

                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row5.implicitHeight
                    RowLayout{
                        id: _row5
                        anchors.fill: parent
                        ComboBox {
                            editable: false
                            Layout.fillWidth: true
                            Material.accent: Qt.color("#000000")
                            Material.foreground: Assets.colors.white
                            font: Typography.regular.p
                            model: ListModel {
                                ListElement { text: "English" }
                            }
                        }

                    }
                }
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row7.implicitHeight
                    RowLayout{
                        id: _row7
                        anchors.fill: parent
                        ComboBox {
                            editable: false
                            Layout.fillWidth: true
                            Material.accent: Qt.color("#000000")
                            Material.foreground: Assets.colors.white
                            font: Typography.regular.p
                            model: ListModel {
                                ListElement { text: "1st Year" }
                                ListElement { text: "2nd Year" }
                                ListElement { text: "Final Year" }
                            }
                        }

                    }
                }
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row8.implicitHeight
                    RowLayout{
                        id: _row8
                        anchors.fill: parent
                        ComboBox {
                            editable: false
                            Layout.fillWidth: true
                            Material.accent: Qt.color("#000000")
                            Material.foreground: Assets.colors.white
                            font: Typography.regular.p
                            model: ListModel {
                                ListElement { text: "Amaye Liputa" }
                                ListElement { text: "Afua Afolobi" }
                            }
                        }

                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: _row6.implicitHeight
                    RowLayout{
                        id: _row6
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
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            Material.background: Assets.colors.black
            text: qsTr("Add Syllabus")
            Material.foreground: Assets.colors.white
            font: Typography.regular.h6
            Binding{
                target: _addCourseBtn.background
                property: "radius"
                value: 30
            }
        }
    }
}
