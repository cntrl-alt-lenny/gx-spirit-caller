/* func_ov015_021b2cdc: twin of `func_ov010_021b2cdc` with the
 * ov015 callee variant.
 */

extern int func_ov015_021b2a80(int x);
extern int func_02094398(int a, int b, int c);

int func_ov015_021b2cdc(int x) {
    return func_02094398(0, func_ov015_021b2a80(x), 0x800);
}
