/* func_02013998: arithmetic right shift by 4 — `x >> 4` (signed).
 *
 *     mov r0, r0, asr #0x4
 *     bx  lr
 */

int func_02013998(int x) { return x >> 4; }
