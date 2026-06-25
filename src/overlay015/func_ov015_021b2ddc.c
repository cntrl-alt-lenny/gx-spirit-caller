/* func_ov015_021b2ddc: twin of `func_ov010_021b2ddc` with the
 * ov015 callee variant.
 */

extern int Ov015_SelectVramBankSub(int x);
extern int func_0209448c(int a, int b, int c);

int func_ov015_021b2ddc(int x) {
    return func_0209448c(0, Ov015_SelectVramBankSub(x), 0x800);
}
