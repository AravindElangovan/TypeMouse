# TypeMouse

TypeMouse is a simple AutoHotKey script that allows users to quickly enable 
a mode that allows for typing with a mouse. This software was made for an 
interface design class in an effort to provide more accessibility to typing
for those with access to only one hand.

##Usage

Control Scheme Setup for Logitech G500 (see Installation for more information):
-Middle Thumb Button: Enable/Disable TypeMouse
-Scroll Wheel: Scroll Through Characters in Current Set
-Left Mouse Button: Prev Character
-Right Mouse Button: Next Character
-Middle Click: Enter
-Forward Thumb Button: Space
-Backward Thumb Button: Backspace
-DPI Up: Next Set of Characters
-DPI Down: Previous Set of Characters

Note: Character sets are cyclical lists of similar characters. The character sets
in TypeMouse include lowercase alphabet, uppercase alphabet, brackets, punctuation,
and symbols.

##Requirements

In its current implementation, TypeMouse requires an 8+ button mouse. It has
only been tested to work with the Logitech G500 mouse as of yet. 

##Installation

Before using the application, there is some initial setup required. Using the mouse configuration software
for your specific mouse, one must bind the button they wish to use to enable/disable TypeMouse to Shift-CTRL-ALT-C.
Furthermore, one must bind the two buttons they wish to use to move forward/backward the different character sets (lowercase,
uppercase, etc) to Shift-CTRL-ALT A and Shift-CTRL-ALT-B. These steps are necessary as mouse
buttons beyond the 5 standard ones have no standard bindings. In later iterations of TypeMouse, 
these requirements could be met using a configuration file.

-A compiled EXE is included in Releases that will immediately start the script in the Windows tray.
-The AutoHotKey script is included as source code. This can be run using AutoHotKey, where it will behave the same as the EXE.

##Known Problems:
-Typing in autocomplete forms like the Chrome Omnibar and Firefox address bar cause issues as it fills text in while you are scrolling through characters.
-Certain applications (i.e. Teamspeak 3) do not recognize the rebound commands, presumably because they implement low-level driver interaction.
