/* func_02038c34: thunk — round b up to 32-byte multiple, tail-call.
 *
 *     ldr ip, =func_0207d3ac
 *     add r1, r1, #0x3f
 *     bic r1, r1, #0x1f
 *     bx ip
 *
 * Equivalent to `(b + 0x3f) & ~0x1f` — round up to next 32-byte boundary
 * if b is at most 0x20 below it. (Slightly different from `(b+0x1f)&~0x1f`.)
 */

extern int func_0207d3ac(int a, int b);

int func_02038c34(int a, int b) {
    return func_0207d3ac(a, (b + 0x3f) & ~0x1f);
}
