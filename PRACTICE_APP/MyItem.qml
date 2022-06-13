import QtQuick 2.0

Item {//Item is generic, it simply represents MyItem in the main program

    //Item specifications(id,dimensions,etc)
    id: root
    width: 100
    height: 100

    //Item properties
    property color color: getRandomColor()
    property color tempColor: "black"
    property int borderWidth: 0
    property color borderColor: "white"
    property int rad: 0
    property int mainX: 0
    property int mainY: 0
    property int startX: 0
    property int startY: 0

    x: startX
    y: startY

    //function will randomly select a color
    function getRandomColor() {

        var val = 0
        var flag = true;

        val = Math.floor(Math.random() * 9);

        if(val === 0){ tempColor = "#FF0000"} //Red
        if(val === 1){ tempColor = "#FFA500"} //Orange
        if(val === 2){ tempColor = "#FFFF00"} //Yellow
        if(val === 3){ tempColor = "#800080"} //purple
        if(val === 4){ tempColor = "#008000"} //green
        if(val === 5){ tempColor = "#0000FF"} //Blue
        if(val === 6){ tempColor = "#A52A2A"} //Brown
        if(val === 7){ tempColor = "#000000"} //Black
        if(val === 8){ tempColor = "#FFC0CB"} //Pink
        return tempColor;

    }

    //update function will handle the repositioning of the item and color change
    function update() {
        if(x > mainX && x < mainX + 120 && y > mainY && y < mainY + 120
                && x + 100 > mainX && x + 100 < mainX + 120 && y + 100 > mainY && y + 100 < mainY + 120
                && mainText.color == myRec.color){

            root.color = getRandomColor();
            mainText.color = getRandomColorTwo();
        }

        x = startX;
        y = startY;

    }

    Rectangle{
        id: myRec
        anchors.fill: parent //We fill the parent(Item/MyItem)
        color: root.color
        radius: root.rad
        border.width: borderWidth
        border.color: borderColor
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent //We fill the parent(Item/MyItem)
        drag.target: parent //We drag parent(Item/MyItem)
        onReleased: {
            root.update()
        }
    }


}
