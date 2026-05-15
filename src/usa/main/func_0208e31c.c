/* func_0208e31c: write 0x19 to MMIO 0x4000400, tail-call
 * func_020903b0. Twin of func_0208e300.
 */

extern int func_020903b0(int x);

int func_0208e31c(int x) {
    *(volatile int *)0x4000400 = 0x19;
    return func_020903b0(x);
}
