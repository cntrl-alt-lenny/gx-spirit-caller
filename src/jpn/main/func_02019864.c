/* func_02019864: indexed signed-byte lookup into data_020b5a8c, stride 7.
 * Returns `(signed char)data_020b5a8c[i*7 + 4]`.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r0, .L_020198b8
 *     rsb   r1, r4, r4, lsl #0x3        ; r1 = r4*8 - r4 = r4 * 7
 *     add   r0, r0, r1
 *     ldrsb r0, [r0, #0x4]
 *     ldmia sp!, {r4, pc}
 *   .L_020198b8: .word data_020b5a8c
 *
 * 8 ARM instructions + 1 pool word, 0x24 bytes.
 *
 * The `rsb r1, r4, r4, lsl #3` idiom computes `r4 * 7` in one
 * instruction: `r1 = (r4 << 3) - r4 = 8*r4 - r4 = 7*r4`. mwcc reaches
 * for this whenever a stride is `2^N - 1`. The GetSystemWork call
 * is side-effect-only (return discarded) — same pattern as
 * func_0201967c etc.
 */

extern char *GetSystemWork(void);
extern char data_020b5a8c[];

int func_02019864(int i) {
    char *entry;
    (void)GetSystemWork();
    entry = data_020b5a8c + i * 7;
    return (signed char)entry[4];
}
