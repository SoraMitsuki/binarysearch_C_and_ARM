@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki
@
@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int str_to_int(char * str, int * dest);*/
/* Return 1 for success and 0 for failure. */
/* If successful, store the result at the */
/* location pointed to by "dest" */

.align 8
.global str_to_int
.func str_to_int, str_to_int
.type str_to_int, %function

str_to_int:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    CMP r0, #0 @ null check 
    BEQ endzero
    CMP r1, #0 @ null check
    BEQ endzero
    LDRB r2, [r0] @ load the r0 into r2 temp
    CMP r2, #0 @ null check 
    BEQ endzero
    MOV r11, r0 @ store r0 into temp r11
    ADD r11, r11, #1 @ temp++
    CMP r2, #45 @ check the first is '-' or not
    BNE next
    LDRB r2, [r11] @ load the second element out and check for null
    CMP r2, #0
    BEQ endzero
next:
    MOV r11, r0 @ reset temp
whileone:
    LDRB r2, [r11] @ check for '-' in the middle of string
    CMP r2, #0 @ loop until string reach null
    BEQ breakone
    ADD r11, r11, #1 
    LDRB r2, [r11] @ load the next element
    CMP r2, #45
    BEQ endzero
    B whileone
breakone:
    MOV r11, r0  @ this is check for negative number 
    LDRB r2, [r11] @ for the check the string is between 0-9
    CMP r2, #45 
    BNE else
    ADD r11, r11, #1
nwhileone:
    LDRB r2, [r11] @ check the string is between 0-9
    CMP r2, #0 @ loop until tmp reach null
    BEQ continue
    CMP r2, #48 @ ascii less than 48
    BLT endzero
    CMP r2, #57 @ ascii greater than 57
    BGT endzero
    ADD r11, r11, #1
    B nwhileone
else:
nwhiletwo:
    LDRB r2, [r11] @ this is the check for string 0-9 for positive number
    CMP r2, #0
    BEQ continue
    CMP r2, #48
    BLT endzero
    CMP r2, #57
    BGT endzero
    ADD r11, r11, #1
    B nwhiletwo
continue:
    SUB r11, r11, #1 @ move temp backward by 1
    MOV r7, #1 @ this is count
    MOV r8, #10  @ this is 10 times for next decimal place
lastwhile:
    CMP r11, r0 @ loop until temp pointer is equal to r0
    BEQ final
    LDR r10, [r1] @ load the element in dest
    LDRB r9, [r11] @ load the last element in string
    SUB r9, r9, #48 @ subtrack bias 48
    MUL r9, r9, r7 @ multiply by count
    ADD r10, r10, r9
    STR r10, [r1] @ store back to r1
    MUL r7, r7, r8
    SUB r11, r11, #1 @ tmp--
    B lastwhile
final:
    LDRB r2, [r11] @ if it is positive number 
    CMP r2, #45 @ do the same for the first element in the string
    BEQ nega
    LDR r10, [r1]
    LDRB r9, [r11]
    SUB r9, r9, #48
    MUL r9, r9, r7
    ADD r10, r10, r9
    STR r10, [r1]
    MOV r0, #1
    B end
nega:
    LDR r10, [r1] @ if it is negative number flip it is +1
    MVN r10, r10
    ADD r10, r10, #1
    STR r10, [r1]
    MOV r0, #1
    B end

    /* Return back to calling function */
endzero:
    mov r0, #0
end:
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


