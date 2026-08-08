/* func_020b1e4c: unsigned int -> double bit construction (softfp: r0=low,
 * r1=high). Ships as asm: mwcc has no C-reachable `clz` idiom (see
 * src/main/func_02079e4c.c) and this function is CLZ-dependent end to
 * end, so a natural-C attempt can't reach the normalize step. Leaf, no
 * stack frame.
 *
 *     cmp   r0, #0x0
 *     mov   r1, #0x0
 *     bxeq  lr
 *     mov   r3, #0x400
 *     add   r3, r3, #0x1e
 *     bmi   .L_50c
 *     clz   ip, r0
 *     movs  r0, r0, lsl ip
 *     sub   r3, r3, ip
 *   .L_50c:
 *     mov   r1, r0
 *     mov   r0, r1, lsl #0x15
 *     add   r1, r1, r1
 *     mov   r1, r1, lsr #0xc
 *     orr   r1, r1, r3, lsl #0x14
 *     bx    lr
 */

asm double func_020b1e4c(unsigned int x) {
    nofralloc
    cmp r0, #0x0
    mov r1, #0x0
    bxeq lr
    mov r3, #0x400
    add r3, r3, #0x1e
    bmi norm_done
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
norm_done:
    mov r1, r0
    mov r0, r1, lsl #0x15
    add r1, r1, r1
    mov r1, r1, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    bx lr
}
