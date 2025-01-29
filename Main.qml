import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Slot Machine"


    // Main Container
    Rectangle {
        width: parent.width
        height: parent.height
        color: "#53200e" // Varnished Cherry
        // game stats
        Item {
            id: gameStats
            property int spinCount: 0
            property int totalMoneySpent: 0
        }

        Row {
            anchors.centerIn: parent
            spacing: 30

            // image 1
            Rectangle {
                id: imgRect1
                width: image1.width + 10
                height: image1.height + 10
                border.color: "#ffd700" // gold
                border.width: 10
                color: "#ffffff" // transparent rectangle

                // The overlay for animation
                Rectangle {
                    id: overlay
                    anchors.fill: parent
                    color: "#53200e" // Varnished Cherry
                    border.color: "#ffd700" // gold
                    border.width: 5
                    visible: true

                    // Animate from backround to black and then disappear
                    ColorAnimation {
                        id: anim1
                        onStarted: image1.visible = false // make images invisible for animation
                        target: overlay
                        property: "color"
                        from: "#53200e" // Varnished Cherry
                        to: "black"
                        duration: 200
                        loops: 3
                        onStopped: image1.visible = true, winningsPopup.open(); // make image visible and call winning popup
                    }
                }

                Image {
                    id: image1
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    width: 200
                    height: 180
                    source: "qrc:/slot_image_" + Math.floor(Math.random() * 5 + 1) + ".png" // Random image source
                }
            }

                    Rectangle {
                        id: imgRect2
                        width: image2.width + 10
                        height: image2.height + 10
                        border.color: "#ffd700" // gold
                        border.width: 10
                        color: "#ffffff" // transparent rectangle

                        // The overlay for animation
                        Rectangle {
                            id: overlay2
                            anchors.fill: parent
                            color: "#53200e" // Varnished Cherry
                            border.color: "#ffd700" // gold
                            border.width: 5
                            visible: true

                            // Animate from backround to black and then disappear
                            ColorAnimation {
                                id: anim2
                                onStarted: image2.visible = false
                                target: overlay2
                                property: "color"
                                from: "#53200e" // Varnished Cherry
                                to: "black"
                                duration: 200
                                loops: 3
                                onStopped: image2.visible = true, winningsPopup.open();
                            }
                        }

                        Image {
                            id: image2
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
                            }
                            width: 200
                            height: 180
                            source: "qrc:/slot_image_" + Math.floor(Math.random() * 5 + 1) + ".png" // Random image source
                        }
                    }


                            Rectangle {
                                id: imgRect3
                                width: image3.width + 10
                                height: image3.height + 10
                                border.color: "#ffd700" // gold
                                border.width: 10
                                color: "#ffffff" // transparent rectangle

                                // The overlay for animation
                                Rectangle {
                                    id: overlay3
                                    anchors.fill: parent
                                    color: "#53200e" // Varnished Cherry
                                    border.color: "#ffd700" // gold
                                    border.width: 5
                                    visible: true

                                    // Animate from backround to black and then disappear
                                    ColorAnimation {
                                        id: anim3
                                        onStarted: image3.visible = false
                                        target: overlay3
                                        property: "color"
                                        from: "#53200e" // Varnished Cherry
                                        to: "black"
                                        duration: 200
                                        loops: 3
                                        onStopped: image3.visible = true, winningsPopup.open();
                                    }
                                }

                                Image {
                                    id: image3
                                    anchors {
                                        horizontalCenter: parent.horizontalCenter
                                        verticalCenter: parent.verticalCenter
                                    }
                                    width: 200
                                    height: 180
                                    source: "qrc:/slot_image_" + Math.floor(Math.random() * 5 + 1) + ".png" // Random image source
                                }
                            }
                        }
        // display money
        Item {
            property int moneyAmount: 50  // Initial amount
            id: money

            Label {
                id: showMoney
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 35
                anchors.leftMargin: 10
                text: "Money: $" + money.moneyAmount
                font.pixelSize: 35
                color: "#ffd700" // gold
            }
        }


        // popup window game over
        Popup {
            id: popup
            closePolicy: Popup.NoAutoClose
            z: 1

            Rectangle {
            width: 800
            height: 600
            color: "#53200e" // Varnished Cherry

        // display gamestats
        Column {
            anchors.centerIn: parent

            Label {
                text: "You ran out of money!"
                font.pixelSize: 40
                color: "red"
            }

        Label {
            text: "Total Spins: " + gameStats.spinCount
            font.pixelSize: 25
            color: "#ffd700" // gold
        }

        Label {
            text: "Total Money Spent: $" + gameStats.totalMoneySpent
            font.pixelSize: 25
            color: "#ffd700" // gold
            }
        }


        // onclicked resets game
        Button {
            id: resetButton
            x: 325
            y: 450
            width: 150
            height: 75

        Text {
            text: "Reset Game!"
            font.pixelSize: 20
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        background: Rectangle {
            color: "#ff2400" // scarlet red
            border.width: 5
            border.color: "#ffd700" // gold
        }
                onClicked: {
                    money.moneyAmount = 50; // Reset money
                    gameStats.spinCount = 0; // Reset spin count
                    gameStats.totalMoneySpent = 0; // Reset total money spent
                    popup.close(); // Close popup
                    winningsPopup.close(); // make sure winningsPopup closes
                }
            }
        }
    }
        Item {
            property int winnings: 0  // Persistent property to store total winnings
            id: win

            function resetWinnings() {
                winnings = 0;  // Reset winnings before each spin
            }

            // display winnings popup

            Popup {
                id: winningsPopup

                Text {
                    x: 320
                    y: 100
                    text: "You win: " + win.winnings + "$"
                    color: "black"
                    font.pixelSize: 25
                    font.bold: true
                // this is not the proper way to do this
                }
                        background: Rectangle {
                            x: 320
                            y: 90
                            width: 160
                            height: 70
                            color: "#ffd700" // gold
                        }
                    }
                }


        // Spin Button
        RoundButton {
            id: spin
            width: 90
            height: 90
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10

            Text {
            text: "Spin"
            font.pixelSize: 30
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle  {
                radius: spin.radius
                color: "#ff2400" // scarlet red
                border.width: 5
                border.color: "#ffd700" // gold
            }

            onClicked: {
                // spin animations start
                anim1.start()
                anim2.start()
                anim3.start()
                // Deduct the spin cost
                money.moneyAmount -= 10;

                gameStats.spinCount++; // spin count
                gameStats.totalMoneySpent += 10; // total money spent

                // Check if there's enough money for the spin
                if (money.moneyAmount < 10) {
                    console.log("Not enough money for a spin!");
                    popup.open(); // Open popup
                    return;
                }

                // Reset winnings for the current spin
                win.resetWinnings();

                // Randomize images
                image1.source = "qrc:/slot_image_" + Math.floor(Math.random() * 5 + 1) + ".png";
                image2.source = "qrc:/slot_image_"  + Math.floor(Math.random() * 5 + 1) + ".png";
                image3.source = "qrc:/slot_image_"  + Math.floor(Math.random() * 5 + 1) + ".png";

                // Get the number of the image and convert to int
                function getImageNumber(image) {
                    var regex = /slot_image_(\d+)\.png/;
                    var sourceString = image.source.toString(); // Convert source to string
                    var match = sourceString.match(regex);
                    if (match && match[1]) {
                        return parseInt(match[1]); // convert string to int
                    }
                    return 0;
                }


                // Calculate the winnings
                function calculateWinnings() {
                    var num1 = getImageNumber(image1);
                    var num2 = getImageNumber(image2);
                    var num3 = getImageNumber(image3);

                    console.log("Numbers:", num1, num2, num3);

                    // Logic for winnings
                    var winnings = 0; // Local variable for the current spin
                    if (num1 == num2 && num2 == num3) {
                        winnings += 50; // All three match
                    } else if (num1 == num2 || num1 == num3) {
                        winnings += 10; // two match
                    } else if (num1 + num2 + num3 >= 15) {
                        winnings += 100; // Jackpot condition
                    }

                    console.log("Winnings this spin:", winnings);


                    // Update property and money amount
                    win.winnings += winnings;  // for total winnings
                    money.moneyAmount += winnings;  // Add winnings to money amount

                }

                calculateWinnings();

                console.log("Total Spins:", gameStats.spinCount);
                console.log("Total Money Spent:", gameStats.totalMoneySpent);
                console.log("Money Amount:", money.moneyAmount);
            }
        }
    }
}
