/* func_0209dc8c: returns 3 iff `*data_021a8d28` (halfword) is zero, else 0.
 *
 *     ldr  r0, .L_0209dca4
 *     ldrh r0, [r0, #0x0]
 *     cmp  r0, #0x0
 *     movne r0, #0x0
 *     moveq r0, #0x3
 *     bx   lr
 *
 * Two-target predicated mov pair — the bool value 3 is loaded only
 * on the equality branch, 0 otherwise. mwcc reuses the result reg
 * (r0) for both branches via predicated execution.
 */

extern unsigned short data_021a8d28;

int func_0209dc8c(void) {
    if (data_021a8d28 != 0) return 0;
    return 3;
}
