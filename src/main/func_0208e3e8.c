/* func_0208e3e8: write 0x1a to MMIO 0x4000400, tail-call
 * MI_Copy36B.
 *
 *     ldr  r1, .L_0208e3fc            ; 0x4000400
 *     mov  r2, #0x1a
 *     ldr  ip, .L_0208e400            ; MI_Copy36B
 *     str  r2, [r1, #0x0]
 *     bx   ip
 *  .L_0208e3fc: .word 0x4000400
 *  .L_0208e400: .word MI_Copy36B
 */

extern int MI_Copy36B(int x);

int func_0208e3e8(int x) {
    *(volatile int *)0x4000400 = 0x1a;
    return MI_Copy36B(x);
}
