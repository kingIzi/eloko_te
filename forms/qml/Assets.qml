pragma Singleton

import QtQuick

QtObject{
    readonly property QtObject images: QtObject {
        readonly property url maths: "qrc:/eloko_te/forms/assets/maths.png"
        readonly property url back: "qrc:/eloko_te/forms/assets/back.png"
        readonly property url pdf: "qrc:/eloko_te/forms/assets/pdf.png"
        readonly property url user: "qrc:/eloko_te/forms/assets/user.png"
        readonly property url plus: "qrc:/eloko_te/forms/assets/plus.png"
        readonly property url plus1: "qrc:/eloko_te/forms/assets/plus-1.png"
        readonly property url minus: "qrc:/eloko_te/forms/assets/minus-button.png"
        readonly property url info: "qrc:/eloko_te/forms/assets/info.png"
    }
    readonly property QtObject colors: QtObject {
        readonly property color darkGray: Qt.color("#333333")
        readonly property color white: Qt.color("#ffffff")
        readonly property color black: Qt.color("#000000")
        readonly property color primary: Qt.color("#7b6e91")
        readonly property color danger: Qt.color("#cb344c")
    }
}
