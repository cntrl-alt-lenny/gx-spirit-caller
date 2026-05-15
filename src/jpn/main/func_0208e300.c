/* func_0208e300: write 0x1a to MMIO 0x4000400, tail-call
 * func_02094588.
 *
 *     ldr  r1, .L_0208e3fc            ; 0x4000400
 *     mov  r2, #0x1a
 *     ldr  ip, .L_0208e400            ; func_02094588
 *     str  r2, [r1, #0x0]
 *     bx   ip
 *  .L_0208e3fc: .word 0x4000400
 *  .L_0208e400: .word func_02094588
 */

extern int func_02094588(int x);

int func_0208e300(int x) {
    *(volatile int *)0x4000400 = 0x1a;
    return func_02094588(x);
}
