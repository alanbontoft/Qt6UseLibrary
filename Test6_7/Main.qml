import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "UI"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    //title: qsTr("Hello World")

    TitleBar {
        id: titleBar
        height: 75
        width: root.width

    }

    Navigator {
        id: navBar
        height: root.height - titleBar.height
        anchors.top: titleBar.bottom
    }

    StackView {
        id: stackView
        anchors {
            left: navBar.right
            top: titleBar.bottom
        }

        height: root.height - titleBar.height
        width: root.width - navBar.width

        initialItem: "UI/ScreenOne.qml"
    }
/*
    MainScreen {
        anchors {
            left: navBar.right
            top: titleBar.bottom
        }

        height: root.height - titleBar.height
        width: root.width - navBar.width
    }
*/

}
