ORG 0100h
.DATA
ANSWER DW ?
.CODE
MAIN PROC
    MOV AX, 0FFFh
    MOV BX, 10h
    MUL BX
    ADD AX, 1111b
    MOV ANSWER, AX
MAIN ENDP
END MAIN