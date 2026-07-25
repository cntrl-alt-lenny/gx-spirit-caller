/* func_02011780: null check + table lookup with 4-byte stride at index (2*(i-1)+1)*2.
 *
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     bxeq  lr
 *     sub   r0, r0, #0x1
 *     lsl   r0, r0, #0x1
 *     add   r1, r0, #0x1
 *     ldr   r0, .L_020117a8       ; data_020b4bd4
 *     lsl   r1, r1, #0x1
 *     ldrh  r0, [r0, r1]
 *     bx    lr
 *
 * NOTE (cm-data-inference-2 batch 2): data_020b4bd4 is now defined as
 * `const Record020b4bd4 data_020b4bd4[99]` (2x unsigned short fields;
 * this function reads field1 @ offset 2 — see src/main/data_020b4bd4.c).
 * A `data_020b4bd4[i - 1].field1` struct-member rewrite was TRIED and
 * REVERTED: mwcc folded the constant +2 field offset into the pool
 * literal itself (`data_020b4bd4+2`) instead of emitting the separate
 * `add r1, r0, #1` the original object code uses, landing one
 * instruction (2 words) short and re-matching at only 27.3%. Kept in
 * pointer-cast/short-index form, which reproduces the original bytes
 * exactly. C does not require this TU's extern declaration to agree
 * with the real struct-typed definition in data_020b4bd4.c — only the
 * linker-visible symbol + byte layout matter, and those are unchanged.
 */

extern unsigned short data_020b4bd4[];

unsigned int func_02011780(int i) {
    if (i == 0) return 0;
    return data_020b4bd4[(i - 1) * 2 + 1];
}
