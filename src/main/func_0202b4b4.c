/* func_0202b4b4: equality check against two card IDs (0x18f6, 0x19bc).
 *
 *     ldr   r1, .L_0202b4d0           ; r1 = 0x18f6
 *     cmp   r0, r1
 *     addne r1, r1, #0xc6              ; r1 = 0x19bc (only if first failed)
 *     cmpne r0, r1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx    lr
 * .L_0202b4d0: .word 0x18f6
 *
 * 7 insns + 1 pool = 0x20 bytes.
 *
 * mwcc derives the 2nd constant via `addne #0xc6` (0x19bc - 0x18f6),
 * saving a pool word vs loading both constants. Sibling of
 * func_0202b4d4 (0x18f9 vs 0x18f9+0xad=0x19a6).
 */

int func_0202b4b4(int id) {
    return id == 0x18f6 || id == 0x18f6 + 0xc6;
}
