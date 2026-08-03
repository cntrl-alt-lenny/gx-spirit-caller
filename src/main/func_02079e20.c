/* func_02079e20: trims trailing zero halfword entries -- returns the
 * highest index n such that arr[n-1] != 0 (or 0 if all are zero).
 * Ships as asm -- natural C (27%) reached the right logic but mwcc
 * scheduled the loop-continuation test differently.
 */

asm int func_02079e20(short *arr, int n) {
    nofralloc
    b check
decr:
    sub r1, r1, #0x1
check:
    cmp r1, #0x0
    beq done
    sub r2, r1, #0x1
    mov r2, r2, lsl #0x1
    ldrh r2, [r0, r2]
    cmp r2, #0x0
    beq decr
done:
    mov r0, r1
    bx lr
}
