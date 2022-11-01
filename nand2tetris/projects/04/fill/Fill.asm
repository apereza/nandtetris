// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RS)
@SCREEN
D=A
@0
M=D

(KB)

@KBD
D=M
@BLACK 
D;JGT //JMP if keyboard keys are pressed else white
@WHITE 
D;JEQ 

@KB
0;JMP

(BLACK) 
@1
M=-1
@CHGE 
0;JMP

(WHITE)
@1
M=0
@CHGE
0;JMP

(CHGE)
@1
D=M

//adreess reg of screen
@0
A=M 
M=D

//increment
@0
D=M+1
@KBD 
D=A-D

@0
M=M+1
A=M 
//If A=0, then exit screen is black
@CHGE 
D;JGT 

@RS
0;JMP 