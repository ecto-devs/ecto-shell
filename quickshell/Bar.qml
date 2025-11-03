// shell.qml

import Quickshell //imports PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text

Scope {
    id: root
    property string time

    Variants{
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            
            implicitHeight: 30

            Text {
                text: root.time
                anchors.centerIn: parent
            } 
        }
    }

    Process {
        id: dateProc
        command: ["date"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.time = this.text 
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}



