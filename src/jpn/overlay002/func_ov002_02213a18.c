/* func_ov002_02213a18: 4-clone family. Reads halfword at arg0+0, calls
 * helper with (0, v, 1, 0), returns 0.
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh r1, [r0, #0x0]
 *     mov  r0, #0x0
 *     mov  r3, r0
 *     mov  r2, #0x1
 *     bl   func_ov002_021e267c
 *     mov  r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov002_021e267c(int a, int b, int c, int d);

int func_ov002_02213a18(unsigned short *p) {
    func_ov002_021e267c(0, *p, 1, 0);
    return 0;
}
