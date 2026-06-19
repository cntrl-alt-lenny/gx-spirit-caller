/* func_ov002_021c9d10: helper-call + bool-inverse. Returns 1 iff helper
 * returns 0.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r2, .L_021c9e10           ; 0x1a1b
 *     mov   r1, #0xb
 *     bl    func_ov002_021b3dec
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_021b3dec(int a, int b, int c);

int func_ov002_021c9d10(int arg) {
    return func_ov002_021b3dec(arg, 0xb, 0x1a1b) == 0;
}
