/* func_020b2970: const-return — `return INT_MAX` (0x7fffffff).
 *
 *     mvn r0, #0x80000000
 *     bx  lr
 *
 * mwcc emits `mvn` for constants that fit a rotated-immediate after
 * inversion. 0x7fffffff = ~0x80000000, and 0x80000000 encodes as
 * `0x2 ror 1` in ARM's 8-bit+4-bit-rot immediate.
 */

int func_020b2970(void) { return 0x7fffffff; }
