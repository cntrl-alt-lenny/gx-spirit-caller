/* func_0207f87c: indexed u32 array setter — `base[idx] = value` (4-byte
 * stride, scaled by the ARM shifted-register addressing mode).
 *
 *     str r2, [r0, r1, lsl #0x2]
 *     bx  lr
 *
 * Args: (base, idx, value); stride is implicit in `lsl #2`.
 */

void func_0207f87c(int *base, int idx, int value) {
    base[idx] = value;
}
