ORG 0100h
MAIN PROC
    
    ; Input a character
    MOV AH, 1
    INT 21h
    MOV BL, AL  ; Save the input character
    
    ; go to a new line with carriage return
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    
  
    ; Change case
    MOV AL, 97
    CMP AL, BL
    JLE LOW_TO_UP 
    
    ;Change upper case to lower case
UP_TO_LOW:
    ADD BL, 32
    JMP END_CASE
    
    ;Change lower case to upper case
LOW_TO_UP:
    SUB BL, 32
    
    
END_CASE:
    
    ; Display character
    MOV DL, BL
    MOV CX, 5 
    
    
    LOOP_FOR_NEXT:
             
    CALL NEXT_LETTER
        INT 21h 
        SUB CX,1
    CMP CX,0
    JG LOOP_FOR_NEXT
  
    
    ; go to a new line with carriage return
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h

    ; display character 
    MOV DL, BL
    MOV CX, 5
    
    
     
    LOOP_FOR_PREV:
    
    CALL PREV_LETTER
        INT 21h 
        SUB CX,1
    CMP CX,0
    JG LOOP_FOR_PREV

    ; return to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP


;next letter and z checking
NEXT_LETTER PROC 
           ADD DL,1 
           CMP DL, 91
           JE  FROM_Z_TO_A_UP
           CMP DL, 123  
           JE FROM_z_TO_a_LOW 
           JMP C_END_CASE
           FROM_Z_TO_A_UP:
            MOV DL, 65
            JMP C_END_CASE 
           FROM_z_TO_a_LOW:
            MOV DL, 97
            JMP C_END_CASE  
            
         C_END_CASE:
            RET
NEXT_LETTER ENDP



;prev letter and a checking
PREV_LETTER PROC
           SUB DL,1 
           CMP DL, 64
           JE  FROM_A_TO_Z_UP
           CMP DL, 96  
           JE FROM_a_TO_z_LOW 
           JMP C2_END_CASE
           FROM_A_TO_Z_UP:
            MOV DL, 90
            JMP C2_END_CASE 
           FROM_a_TO_z_LOW:
            MOV DL, 122
            JMP C2_END_CASE  
            
         C2_END_CASE:
            RET      
PREV_LETTER ENDP   
    
    
    
END MAIN
RET
