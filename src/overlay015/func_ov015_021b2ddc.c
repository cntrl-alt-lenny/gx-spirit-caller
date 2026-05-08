/* func_ov015_021b2ddc: twin of `func_ov010_021b2ddc` with the
 * ov015 callee variant.
 */

extern int func_ov015_021b2b80(int x);
extern int func_0209448c(int a, int b, int c);

int func_ov015_021b2ddc(int x) {
    return func_0209448c(0, func_ov015_021b2b80(x), 0x800);
}
