/* func_02094550: block memcpy — 32-byte (8-word) chunks via ldm/stm block
 * transfer, then a 4-byte tail loop. Ships as asm: mwcc has no C-reachable
 * codegen for the `ldmltia`/`stmltia` register-block-transfer idiom (see
 * src/main/Copy32.c and brief-629's stmltia/ldmltia findings — no C loop
 * form ever reaches this instruction pair). Style A (2-step epilogue).
 *
 *     stmdb  sp!, {r4, r5, r6, r7, r8, r9, sl}
 *     add    sl, r1, r2
 *     mov    ip, r2, lsr #0x5
 *     add    ip, r1, ip, lsl #0x5
 *   .L_5c:
 *     cmp    r1, ip
 *     ldmltia r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
 *     stmltia r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
 *     blt    .L_5c
 *   .L_6c:
 *     cmp    r1, sl
 *     ldmltia r0!, {r2}
 *     stmltia r1!, {r2}
 *     blt    .L_6c
 *     ldmia  sp!, {r4, r5, r6, r7, r8, r9, sl}
 *     bx     lr
 */

asm void func_02094550(int *src, int *dst, unsigned int count) {
    nofralloc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10}
    add r10, r1, r2
    mov ip, r2, lsr #0x5
    add ip, r1, ip, lsl #0x5
loop_block:
    cmp r1, ip
    ldmltia r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    stmltia r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    blt loop_block
loop_tail:
    cmp r1, r10
    ldmltia r0!, {r2}
    stmltia r1!, {r2}
    blt loop_tail
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10}
    bx lr
}
