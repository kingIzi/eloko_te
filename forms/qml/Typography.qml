pragma Singleton
import QtQuick

QtObject {
    readonly property FontLoader primaryFont: FontLoader {
        source: "qrc:/eloko_te/forms/fonts/static/Montserrat-Regular.ttf"
    }
    readonly property FontLoader secondaryFont: FontLoader{
        source: "qrc:/eloko_te/forms/fonts/static/Montserrat-Bold.ttf"
    }
    readonly property QtObject bold: QtObject {
        readonly property font h1: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 36,
                                               letterSpacing: 2,
                                           })
        readonly property font h2: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 30,
                                               letterSpacing: 2,
                                           })
        readonly property font h3: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 24,
                                               letterSpacing: 2,
                                           })
        readonly property font h4: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 20,
                                               letterSpacing: 2,
                                           })
        readonly property font h5: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 18,
                                               letterSpacing: 2,
                                           })
        readonly property font h6: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 16,
                                               letterSpacing: 2,
                                           })
        readonly property font p: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 14,
                                               letterSpacing: 2,
                                           })
        readonly property font toolTip: Qt.font({
                                               family: secondaryFont.name,
                                               pixelSize: 12,
                                               letterSpacing: 2,
                                           })
    }

    readonly property QtObject regular: QtObject {
        readonly property font h1: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 36,
                                               letterSpacing: 2,
                                           })
        readonly property font h2: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 30,
                                               letterSpacing: 2,
                                           })
        readonly property font h3: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 24,
                                               letterSpacing: 2,
                                           })
        readonly property font h4: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 20,
                                               letterSpacing: 2,
                                           })
        readonly property font h5: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 18,
                                               letterSpacing: 2,
                                           })
        readonly property font h6: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 16,
                                               letterSpacing: 2,
                                           })
        readonly property font p: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 14,
                                               letterSpacing: 2,
                                           })
        readonly property font toolTip: Qt.font({
                                               family: primaryFont.name,
                                               pixelSize: 12,
                                               letterSpacing: 2,
                                           })
    }
}
