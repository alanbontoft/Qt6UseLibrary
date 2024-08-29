import QtQuick
import QtQuick.Layouts

Rectangle {

    color: '#202020'

    RowLayout {

        anchors.centerIn: parent
        spacing: 50

        Image {

            source: "../Images/searchdoc.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    lbl.text = 'Search'
                }
            }
        }

        Image {

            source: "../Images/cross.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    lbl.text = 'Delete'
                }
            }
        }
    }
}
