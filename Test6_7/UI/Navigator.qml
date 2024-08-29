import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: navBar
    width: 120
    height: parent.height
    color: '#000000'


    ColumnLayout {

        spacing: 10

        anchors.margins: 10

        anchors.fill: parent

        Button {
            Layout.alignment: Qt.AlignCenter | Qt.AlignTop
            id: btn
            text: "Press"
            height: 40
            padding: 10
            Layout.fillWidth: true

            font.pixelSize: 24

            onClicked: {
                lbl.text = 'Click!'
                stackView.push("ScreenTwo.qml")
            }
        }

        Label {
            id: lbl
            Layout.alignment: Qt.AlignCenter | Qt.AlignTop
            text: 'Hello'

            font.pixelSize: 24
        }

        Button {
            Layout.alignment: Qt.AlignCenter | Qt.AlignTop
            id: btnJS
            text: "Press"
            height: 40
            padding: 10
            Layout.fillWidth: true

            font.pixelSize: 24

            onClicked: {
                lbl.text = 'JS'
                // stackView.push("ScreenTwo.qml")
                let obj = {};
                obj.name = 'Bob';
                obj.age = 74;
                obj.county = 'Lancs';

                let s = JSON.stringify(obj);
                lbl.text = s;
            }
        }

        Item {
            Layout.fillHeight: true
        }


    }
}
