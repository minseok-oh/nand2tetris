// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    @i
    M=0             // i=0
    
    @SCREEN
    D=A             // D=SCREEN
    @screen_addr
    M=D             // screen_addr=SCREEN
(LOOP)
    @i
    M=0             // i=0

    @KBD
    D=M             // D=RAM[KBD]
    @RESET      
    D;JEQ           // if (RAM[KBD]==0) goto RESET 
(SET)
    @i
    D=M             // D=i
    @8191
    D=D-A           // D=i-8191
    @LOOP
    D;JGT           // if (i-8191)>0 goto LOOP 

    @screen_addr
    D=M             // D=screen_addr
    @i
    A=D+M           // A=screen_addr + i
    M=-1            // RAM[screen_addr + i] = -1

    @i
    M=M+1           // i=i+1
    @SET
    0;JMP           // Goto SET
(RESET)
    @i
    D=M             // D=i
    @8191
    D=D-A           // D=i-max_screen_addr
    @LOOP
    D;JGT           // if (i - max_screen_addr)>0 

    @screen_addr
    D=M             // D=screen_addr
    @i
    A=D+M           // A=screen_addr + i
    M=0             // RAM[screen_addr + i] = 0

    @i
    M=M+1           // i=i+1
    @RESET
    0;JMP           // Goto RESET