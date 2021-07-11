import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebKit 3.0

ApplicationWindow {
    id: mainWindow
    width: 800
    height: 600
    title: qsTr("Qt + QML + PySide2 + Webkit")
    visible: true
    locale: locale

    ColumnLayout {
        spacing: 0
        anchors.fill: parent
        Rectangle {
            color: "#DDCCFF"
            Layout.fillWidth: true
            Layout.preferredHeight: Math.max(16, parent.width / 80)
            TextInput {
                id: _url
                text: "https://www.google.co.jp/"
                focus: true
                KeyNavigation.tab: _webView
                font.pixelSize: Math.max(16, parent.width / 80)
                anchors.fill: parent
                onAccepted: _webView.url = _url.text
            }
        }
        WebView {
            id: _webView
            Layout.fillWidth: true
            Layout.fillHeight: true
//            url: "https://www.google.co.jp/"
            Component.onCompleted: _webView.url = _url.text
            onLoadingChanged: {
                if (loadRequest.status == WebView.LoadStartedStatus) {
                    console.log("Load start: " + loadRequest.url)
                } else if (loadRequest.status == WebView.LoadSucceededStatus) {
                    console.log("Load succeeded: " + loadRequest.url)
                } else if (loadRequest.status == WebView.LoadFailedStatus) {
                    console.log("Load failed: " + loadRequest.url + ". Error code: " + loadRequest.errorString)   
                }
            }
            Keys.onPressed: {
                if ((event.key == Qt.Key_Backspace) && (event.modifiers & Qt.ShiftModifier)) {
                    console.debug("Key=" + event.key + ",text=[Shift+BkSp],accepted=" + event.accepted);
                    if (_webView.canGoFoword) { _webView.goFoword(); }
                } else if (event.key == Qt.Key_Backspace) {
                    console.debug("Key=" + event.key + ",text=[BkSp],accepted=" + event.accepted);
                    if (_webView.canGoBack) { _webView.goBack(); }
                } else {
                    console.debug("Key=" + event.key + ",text=" + event.text + ",accepted=" + event.accepted);
                }
            }
        }
    }
}
