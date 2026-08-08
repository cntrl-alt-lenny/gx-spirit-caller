/* func_020b1e0c: signed int -> double bit construction (softfp: r0=low,
 * r1=high), sibling of func_020b1e4c with sign handling. Ships as asm:
 * CLZ-dependent end to end, no C-reachable clz idiom (see
 * src/main/func_02079e4c.c). Leaf, no stack frame.
 *
 *     ands   r2, r0, #-2147483648
 *     rsbmi  r0, r0, #0x0
 *     cmp    r0, #0x0
 *     mov    r1, #0x0
 *     bxeq   lr
 *     mov    r3, #0x400
 *     add    r3, r3, #0x1e
 *     clz    ip, r0
 *     movs   r0, r0, lsl ip
 *     sub    r3, r3, ip
 *     movs   r1, r0
 *     mov    r0, r1, lsl #0x15
 *     add    r1, r1, r1
 *     orr    r1, r2, r1, lsr #0xc
 *     orr    r1, r1, r3, lsl #0x14
 *     bx     lr
 */

asm double func_020b1e0c(int x) {
    nofralloc
    ands r2, r0, #-2147483648
    rsbmi r0, r0, #0x0
    cmp r0, #0x0
    mov r1, #0x0
    bxeq lr
    mov r3, #0x400
    add r3, r3, #0x1e
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    movs r1, r0
    mov r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, r2, r1, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    bx lr
}
