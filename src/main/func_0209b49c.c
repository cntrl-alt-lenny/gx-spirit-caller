/* func_0209b49c: u32 setter with arg order (value, ptr) — the inverse
 * of the typical setter convention. mwcc threads `value` through r0
 * and `ptr` through r1, emitting `str r0, [r1]`.
 *
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

void func_0209b49c(int value, int *ptr) {
    *ptr = value;
}
