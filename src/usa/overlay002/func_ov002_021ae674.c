/* func_ov002_021ae674: tail-call func_ov002_0229acd0(0x31, 0xb, 0, 0).
 * mwcc emits `mov r3, r2` (peephole when both are 0) instead of
 * `mov r3, #0`.
 */

extern int func_ov002_0229acd0(int a, int b, int c, int d);

int func_ov002_021ae674(void) {
    return func_ov002_0229acd0(0x31, 0xb, 0, 0);
}
