@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki
@
@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138

.syntax unified

.text

.align 8
.global substring
.func substring, substring
.type substring, %function

substring:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (char *str1 is in r0, char *str2 is in r1)

    CMP r0, #0
    BEQ nullend @ null check
    CMP r1, #0
    BEQ nullend
    MOV r11, r0 @ save r0 and r1 into temp
    MOV r10, r1
    MOV r6, r11 @ r6 is tmp s1
    MOV r9, r10 @ r9 is tmp s2
    BL strlen @ call strlen for the length of string of the first param
    MOV r4, r0 
    MOV r0, r10
    BL strlen @ for the second param
    MOV r5, r0
    CMP r4, #0 @ check for the string is empty string or not
    BEQ endone
    CMP r5, #0
    BEQ endone @ if either string is empty the return 1
    CMP r4, r5
    BEQ whileone 
    BGT whiletwo
    BLT whilethree
whileone: 
    LDRB r7, [r11] @ case one when 2 strings length are equal 
    CMP r7, #0 @ loop the string until null
    BEQ endone 
    LDRB r8, [r10] @ if the two string have one char diff the return 0
    CMP r7, r8
    BNE endzero
    ADD r11, r11, #1
    ADD r10, r10, #1
    B whileone
whiletwo:
    LDRB r7, [r11] @ case two when the first string is longer than second
    LDRB r8, [r10]
    CMP r7, #0 @ loop until the longer string is done
    BEQ checkone @ this is the final check point
    CMP r8, #0
    BEQ checkone
    CMP r7, r8
    ADDEQ r11, r11, #1 @ increase the long string and compare
    ADDEQ r10, r10, #1 
@ if the first char of two string are same short string increase by one
    BEQ whiletwo
    ADDNE r11, r11, #1
    MOVNE r10, r9
    BNE whiletwo
checkone:
    CMP r8, #0 @ check if the short string reach the null char return 1
    BEQ endone
    BNE endzero
whilethree:
    LDRB r7, [r11] @ case three when second string is longer 
    LDRB r8, [r10] @ repeat the above process 
    CMP r7, #0
    BEQ checktwo
    CMP r8, #0
    BEQ checktwo
    CMP r8, r7
    ADDEQ r11, r11, #1
    ADDEQ r10, r10, #1
    BEQ whilethree
    ADDNE r10, r10, #1
    MOVNE r11, r6
    BNE whilethree
checktwo:
    CMP r7, #0 @ check for the first string reach the end or not
    BEQ endone
    BNE endzero
    @ put your return value in r0 here:
nullend:
    MOV r0, #0
    B return
endzero:
    MOV r0, #0
    B return
endone:
    MOV r0, #1
return:
    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

