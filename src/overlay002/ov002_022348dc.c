/* func_ov002_022348dc: set bit 5 (mask 0x20) in u16 at obj[0x4],
 * return 0.
 *
 *     ldrh r2, [r1, #0x4]
 *     mov  r0, #0x0
 *     orr  r2, r2, #0x20
 *     strh r2, [r1, #0x4]
 *     bx   lr
 *
 * Arg 0 is unused (r0 overwritten with 0 for return); caller must
 * pass the object pointer in r1.
 */

int func_ov002_022348dc(int unused, void *obj) {
    unsigned short *slot = (unsigned short *)((char *)obj + 0x4);
    (void)unused;
    *slot |= 0x20;
    return 0;
}
