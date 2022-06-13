import QtQuick 2.15
import QtQuick.Window 2.15


Window {
    id: mainWindow
    width: 400
    height: 480
    visible: true
    title: qsTr("Color & Shape Game")

    property int middleWin: mainWindow.width / 2
    property int bottomWin: mainWindow.height - (mainWindow.height / 4)
    property color tempColorTwo: "white"

    function getRandomColorTwo() {

        var val = 0

        val = Math.floor(Math.random() * 3);

//        if(val === 0){ tempColorTwo = "#FF0000"} //Red
//        if(val === 1){ tempColorTwo = "#FFA500"} //Orange
//        if(val === 2){ tempColorTwo = "#FFFF00"} //Yellow
//        if(val === 3){ tempColorTwo = "#800080"} //purple
//        if(val === 4){ tempColorTwo = "#008000"} //green
//        if(val === 5){ tempColorTwo = "#0000FF"} //Blue
//        if(val === 6){ tempColorTwo = "#A52A2A"} //Brown
//        if(val === 7){ tempColorTwo = "#000000"} //Black
//        if(val === 8){ tempColorTwo = "#FFC0CB"} //Pink


        if(val === 0){ return left_shape.color} //Red
        if(val === 1){ return right_shape.color} //Orange
        if(val === 2){ return middle_shape.color} //Yellow
    }

//    function getWord(){
//        var value = Math.floor(Math.random() * 3);

//        if(value == 0){console.log(middle_shape.color)}
//        if(value == 1){console.log(left_shape.color)}
//        if(value == 2){console.log(right_shape.color)}

//        return "test_"
//    }





    Image {
        id: background
        anchors.fill: parent
        opacity: 100
        source: "/images/colorBackground.jpg"
        fillMode: Image.PreserveAspectCrop
    }


    MyItem {
        id: middle_shape // middle shape
        startX: middleWin - 50
        startY: bottomWin
        mainX: main_shape.x
        mainY: main_shape.y
        rad: 75
        z: 2
        color: getRandomColor()
    }

    MyItem {
        id: right_shape // right shape
        startX: (middleWin / 2) - 75
        startY: bottomWin
        mainX: main_shape.x
        mainY: main_shape.y
        rad: 75
        z: 2
        color: getRandomColor()
    }

    MyItem {
        id: left_shape // left shape
        startX: middleWin + (middleWin / 2) - 25
        startY: bottomWin
        mainX: main_shape.x
        mainY: main_shape.y
        rad: 75
        z: 2
        color: getRandomColor()
    }

    MyItem {
        id: main_shape //Center item
        width: 120
        height: 120
        anchors.centerIn: parent
        rad: 75 //radius: 0(square) or 50(circle)
        borderWidth: 5
        color: "white"
        borderColor: "black"
        z: 1
    }

    Rectangle{
        width: 200
        height: 75
        color: "white"
        radius: 25
        x: middleWin - (width / 2)
        y: mainWindow.height / 6


        Text {
            anchors.centerIn: parent
            id: mainText
            text: "Color"
            color: getRandomColorTwo()
            font.pixelSize: 50
            font.bold: true
        }
    }



}
