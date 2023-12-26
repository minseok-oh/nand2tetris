// Multiplies R0 and R1
// Store the result in R2

    @i
    M=1             // i=1
    @result
    M=0             // result=i
    
    @R0
    D=M             // D=RAM[0]
    @left_value
    M=D             // left_value=RAM[0]
    @END
    D;JEQ

    @R1
    D=M             // D=RAM[1]
    @right_value
    M=D             // right_value=RAM[1]
    @END
    D;JEQ
(LOOP)
    @i
    D=M             // D=i
    @right_value
    D=D-M           // D=i-right_value
    @END
    D;JGT           // if (i - right_value)>0 goto END

    @left_value
    D=M             // D=left_value
    @result
    M=D+M           // result=result+left_value

    @i
    M=M+1           // i=i+1
    @LOOP
    0;JMP           // Goto LOOP
(END)
    @result
    D=M             // D=result
    @R2
    M=D             // RAM[2]=result
    @END
    0;JMP           // Infinite loop