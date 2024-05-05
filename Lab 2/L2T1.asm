ORG 0100h
MAIN PROC
    
    ; Input a character
    MOV AH, 1
    INT 21h
    MOV BL, AL  ; Save the input character
    
    ; Change case
    MOV AL, 97
    CMP AL, BL
    JLE LOW_TO_UP 
    
    ;Change upper case to lower case
    UP_TO_LOW:
    ADD BL, 32
    JMP END_CASE
    
    LOW_TO_UP:
    SUB BL, 32
    
    
    END_CASE:
    
    ; New line
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    
    ; Display character
    MOV AH, 2
    MOV DL, BL
    INT 21h
    
    ; Return to DOS
    MOV AH, 4CH
    INT 21H
    
    
MAIN ENDP
END MAIN
RET