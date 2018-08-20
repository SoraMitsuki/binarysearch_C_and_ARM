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

/*int binary_search_ARM(int * data, int toFind, int start, int end)*/
/*Note that you return your value in r0*/

.align 8
.global binary_search_ARM
.func binary_search_ARM, binary_search_ARM
.type binary_search_ARM, %function

binary_search_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May need to decrement stack pointer for more stack space

    /* You should probably do something here */
    SUB r4, r3, r2 @ end - start
    ASR r4, r4, #1 @ the result / 2
    ADD r4, r4, r2 @ start + the result
    CMP r2, r3 @ check start > end
    BGT endmone
    LDR r5, [r0, r4, LSL #2] @ load data[mid]
    CMP r5, r1 @ compare data[mid] and toFind
    BEQ returned 
    BLT else
    SUB r3, r4, #1 @ mid -1 @ if data[mid] > toFind
    BL binary_search_ARM @ recurrsion
    B end
else: @ data[mid] < toFind
    ADD r2, r4, #1 @ mid +1
    BL binary_search_ARM @ recurrsion
    B end
returned:
    MOV r0, r4 @ return 
    B end    
endmone:
    mov r0, #-1 @ return -1
end:
    @ Remember to restore the stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


