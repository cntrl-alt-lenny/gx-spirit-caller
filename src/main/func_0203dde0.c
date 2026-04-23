/* func_0203dde0: const-return — `return -6` (encoded as mvn #5).
 *
 *     mvn r0, #0x5
 *     bx  lr
 *
 * `mvn` encodes ~5 = 0xfffffffa = -6 in one instruction.
 */

int func_0203dde0(void) { return -6; }
