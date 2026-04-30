/* func_020a6d48: abs() — `x < 0 ? -x : x`.
 *
 *     cmp r0, #0
 *     rsblt r0, r0, #0     ; if (r0 < 0) r0 = 0 - r0
 *     bx lr
 */

int func_020a6d48(int x) {
    if (x < 0) return -x;
    return x;
}
