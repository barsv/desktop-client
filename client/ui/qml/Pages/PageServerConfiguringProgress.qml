import QtQuick 2.12
import QtQuick.Controls 2.12
import PageEnum 1.0
import "./"
import "../Controls"
import "../Config"

PageBase {
    id: root
    page: PageEnum.ServerConfiguringProgress
    logic: ServerConfiguringProgressLogic

    enabled: ServerConfiguringProgressLogic.pageEnabled
    Caption {
        id: caption
        text: qsTr("Configuring...")
    }
    LabelType {
        id: label
        x: 0
        anchors.top: caption.bottom
        anchors.topMargin: 10

        width: parent.width
        height: 31
        text: qsTr("Please wait.")
        horizontalAlignment: Text.AlignHCenter
    }

    LabelType {
        anchors.bottom: pr.top
        anchors.bottomMargin: 20

        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter

        width: parent.width - 40
        height: 41
        text: ServerConfiguringProgressLogic.labelWaitInfoText
        visible: ServerConfiguringProgressLogic.labelWaitInfoVisible
    }

    ProgressBar {
        id: pr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: logo.bottom
        anchors.bottomMargin: 40
        width: parent.width - 40
        height: 40

        from: 0
        to: ServerConfiguringProgressLogic.progressBarMaximium
        value: ServerConfiguringProgressLogic.progressBarValue
        visible: ServerConfiguringProgressLogic.progressBarVisible
        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            color: "#100A44"
            radius: 4
        }

        contentItem: Item {
            implicitWidth: parent.width
            implicitHeight: parent.height
            Rectangle {
                width: pr.visualPosition * parent.width
                height: parent.height
                radius: 4
                color: Qt.rgba(255, 255, 255, 0.15);
            }
        }

        LabelType {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: ServerConfiguringProgressLogic.progressBarText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Lato"
            font.styleName: "normal"
            font.pixelSize: 16
            color: "#D4D4D4"
            visible: ServerConfiguringProgressLogic.progressBarTextVisible
        }
    }

    Logo {
        id : logo
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }
}
