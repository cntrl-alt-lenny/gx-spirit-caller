/* func_ov011_021c9fb4: fixed-point math on call result.
 * Returns ((func_ov000_021acdc4() << 3) - 0x20) << 12.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov000_021acdc4
 *     mov   r0, r0, lsl #0x3
 *     sub   r0, r0, #0x20
 *     mov   r0, r0, lsl #0xc
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov000_021acdc4(void);

int func_ov011_021c9fb4(void) {
    return ((func_ov000_021acdc4() << 3) - 0x20) << 12;
}
