/* func_ov009_021ab324: constant-one predicate.
 *
 *     mov r0, #0x1
 *     bx  lr
 *
 * Returns 1. One caller (func_ov009_021ad73c); likely a feature
 * flag / "is-enabled"-style predicate.
 */

int func_ov009_021ab324(void) {
    return 1;
}
