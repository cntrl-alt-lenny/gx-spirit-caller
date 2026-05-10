/* func_ov002_021ae754: tail-call func_ov002_0229ade0(0x31, 0xb, 0, 0).
 * mwcc emits `mov r3, r2` (peephole when both are 0) instead of
 * `mov r3, #0`.
 */

extern int func_ov002_0229ade0(int a, int b, int c, int d);

int func_ov002_021ae754(void) {
    return func_ov002_0229ade0(0x31, 0xb, 0, 0);
}
