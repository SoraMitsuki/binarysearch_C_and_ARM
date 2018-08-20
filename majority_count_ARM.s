.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int majority_count_ARM(int * arr, int len, int * result)*/
/* Remember to place your return value in r0. */
/* Return the count of the majority element in arr, */
/* or 0 if there is no majority. If "result" is not */
/* NULL, place the value of the majority element at */
/* that memory location before returning. */

.align 8
.global majority_count_ARM, count
.func majority_count_ARM, majority_count_ARM
.type majority_count_ARM, %function

majority_count_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May want to decrement stack pointer for more space

    /* You should probably do something here */
    CMP r1, #0 @ check for len 
    BEQ trueendzero @ if it is 0 return 0
    CMP r1, #1 @ if it is 1 return 1
    BNE next
    CMP r2, #0
    BEQ trueendone
    LDR r4, [r0] @ get the first element into result
    STR r4, [r2]
    B trueendone
next:
    SUB sp, sp, #24 @ make space on sp
    MOV r6, sp @ this is left majority
    ADD r7, sp, #4 @ this is right majority
    STR r0, [r7, #4] @ this is arr in stack
    MOV r4, r1 @ this is len
    ASR r1, r1, #1 @ this is len/2
    MOV r5, r2 @ this is result
    MOV r2, r6
    BL majority_count_ARM
    STR r0, [r7, #8] @ this is left_majority_count
    LDR r0, [r7, #4]  @ load the arr into r0
    ADD r0, r0, r1, LSL #2 @ increase the pointer by len/2
    SUB r1, r4, r1 @ this is len - len/2
    MOV r2, r7
    BL majority_count_ARM
    STR r0, [r7, #12] @ store r0 into result
    LDR r0, [r7, #4] @ load arr into r0
    MOV r1, r4 @ move len into r1
    LDR r2, [r7, #8] @ load right majority into r1
    CMP r2, #0 @ check left majority is null or not
    BEQ nextif 
    LDR r2, [r6] @ load left majority into r2
    BL count_ARM @ call helper method count
    ASR r1, r4, #1 @this is len /2
    CMP r0, r1 @ if c > len/2
    BLE nextif
    CMP r5, #0 @ if result is null
    BEQ end
    LDR r3, [r6] @ store left majority into result
    STR r3, [r5]
    B end
nextif:
    LDR r2, [r7, #12] @ samething as above but for right majority
    CMP r2, #0
    BEQ endzero
    LDR r0, [r7, #4]
    MOV r1, r4
    LDR r2, [r7]
    BL count_ARM
    ASR r1, r4, #1
    CMP r0, r1
    BLE endzero
    CMP r5, #0
    BEQ end
    LDR r3, [r7]
    STR r3, [r5]
    B end
endone:
    MOV r0, #1 @ avoid using sp
    B end
endzero:
    mov r0, #0
end:
    ADD sp, sp, #24 @ return when sp is used
    B trueend
trueendzero:
    MOV r0, #0
    B trueend
trueendone:
    MOV r0, #1
trueend:
    @ Remember to restore your stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

@ this is the helper method for count_ARM

.align 8
.func count_ARM, count_ARM
.type count_ARM, %function
count_ARM:
    push    {r4-r11, ip, lr} 
    MOV r4, #0 @ this us count
    MOV r5, #0 @ this is index
for:
    CMP r4, r1 @ loop through r1
    BGE return
    LDR r6, [r0, r4, LSL #2] @ load the element in data
    CMP r6, r2
    ADD r4, r4, #1 @ index increase
    BNE for 
    ADD r5, r5, #1 @ if it is equal count increase
    B for @ reloop
return:
    MOV r0, r5
    pop     {r4-r11, ip, lr}
    BX lr

.endfunc

.end


