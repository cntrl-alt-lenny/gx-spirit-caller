/* func_ov002_0229a04c: u16 table lookup, indexed by (arg << 1).
 *
 *     ldr  r1, .L_0229a05c    ; data_ov002_022ca370
 *     mov  r0, r0, lsl #0x1
 *     ldrh r0, [r1, r0]
 *     bx   lr
 *
 * The `lsl #1` + ldrh with byte offset means each table entry is 2 bytes
 * indexed by argument directly (i.e. table[i] where stride=2).
 */

extern unsigned short data_ov002_022ca370[];

unsigned short func_ov002_0229a04c(int i) {
    return data_ov002_022ca370[i];
}
