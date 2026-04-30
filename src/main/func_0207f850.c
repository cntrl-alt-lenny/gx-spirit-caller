/* func_0207f850: store `c` at `&p[arg] + 2` (3rd word of arg-th element).
 *
 *     add r0, r0, r1, lsl #0x2     ; r0 = p + arg*4
 *     str r2, [r0, #0x8]            ; (p + arg + 2) = c
 *     bx lr
 */

void func_0207f850(int *p, int arg, int c) {
    (p + arg)[2] = c;
}
