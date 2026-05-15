/* func_0208e338: write 0x17 to MMIO 0x4000400, tail-call
 * func_020903b0. Twin of func_0208e31c.
 */

extern int func_020903b0(int x);

int func_0208e338(int x) {
    *(volatile int *)0x4000400 = 0x17;
    return func_020903b0(x);
}
