/* func_02018a04: insert an 8-bit field at bits 11..18 of state[0x8e8].
 * The clear-mask 0xfff807ff is loaded from a literal pool (doesn't
 * fit rotated-immediate).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r3, [r0, #0x8e8]
 *     ldr   r1, .L_02018a60           ; r1 = 0xfff807ff (pool)
 *     mov   r2, r4, lsl #0x18         ; value << 24 (isolate low byte)
 *     and   r1, r3, r1                ; clear bits 11..18
 *     orr   r1, r1, r2, lsr #0xd      ; shift to position 11
 *     str   r1, [r0, #0x8e8]
 *     ldmia sp!, {r4, pc}
 *   .L_02018a60: .word 0xfff807ff
 *
 * 9 ARM instructions + 1 pool word, 0x2c bytes.
 *
 * Pairs with func_02018a30 (the bit-clear variant at same offset).
 */

extern char *GetSystemWork(void);

void func_02018a04(unsigned int value) {
    int *slot = (int *)(GetSystemWork() + 0x8e8);
    *slot = (*slot & 0xfff807ff) | ((value << 24) >> 13);
}
