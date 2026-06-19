/* func_ov002_022678f8: tail-call func_ov002_02267810(1 - r0, 0xe, 0x188f).
 *
 *     ldr  ip, .L_022679f4    ; func_ov002_02267810
 *     ldr  r2, .L_022679f8    ; 0x188f
 *     rsb  r0, r0, #0x1       ; r0 = 1 - r0
 *     mov  r1, #0xe
 *     bx   ip
 */

extern int func_ov002_02267810(int a, int b, int c);

int func_ov002_022678f8(int a) {
    return func_ov002_02267810(1 - a, 0xe, 0x188f);
}
