# SCROLLING-TEXT-ARDUINNO-PROJECT
This is our CSE331 project which is Arduino Uno hardware based assembly language project
INTRODUCTION:
The project “Auto-scrolling message display” is an Arduino Uno based project which is designed to display a auto scrolling text on an LED display through the microcontroller built in Arduino Uno. This project is made for creating a simple but effective tool to display the text messages in public places such as shopping malls, airport, taxi meter etc many others.
Hardware tools:
1.	Arduino Uno
2.	LED Display
3.	Wires
4.	10k ohm potentiometer.
Software tools:
1.	Arduino IDE
2.	Proteus
3.	Assembly language
Description of Proteus Implementation:
For this project 1st we have implemented the project in Proteus. There we have used the Arduino Uno and the LED display components. And in Arduino Uno we have used assembly language to give the directions/instructions what it will do/show if we connect the LED display to it. The assembly codes are written in Arduino IDE then it transfers to the Arduino to works that.
 After completing the Proteus implementations we have done the hardware implementations.
The proteus implementations diagram and Screenshot are below:
 
![image](https://github.com/BushraOnika/SCROLLING-TEXT-ARDUINNO-PROJECT/assets/87435687/540f6493-60cf-47cd-88a1-1060bb74471a)
![image](https://github.com/BushraOnika/SCROLLING-TEXT-ARDUINNO-PROJECT/assets/87435687/9f5c0a59-d736-47cc-a35c-07359dd7ff6f)
 






Description of Hardware Implementation:
Before wiring the LCD screen to your Arduino board we suggest to solder a pin header strip to the 14 (or 16) pin count connector of the LCD screen, as you can see in the image further up.
To wire your LCD screen to your board, connect the following pins:
•	LCD RS pin to digital pin 12
•	LCD Enable pin to digital pin 11
•	LCD D4 pin to digital pin 5
•	LCD D5 pin to digital pin 4
•	LCD D6 pin to digital pin 3
•	LCD D7 pin to digital pin 2
•	LCD R/W pin to GND
•	LCD VSS pin to GND
•	LCD VCC pin to 5V
•	LCD LED+ to 5V through a 220 ohm resistor
•	LCD LED- to GND
Additionally, wire a 10k potentiometer to +5V and GND, with it's wiper (output) to LCD screens VO pin (pin3).
The Schematic Diagram of this hardware implementation is below:

 ![image](https://github.com/BushraOnika/SCROLLING-TEXT-ARDUINNO-PROJECT/assets/87435687/cab5df32-eee1-437b-94ad-902b224ba07c)




