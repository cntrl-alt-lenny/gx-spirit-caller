/* func_ov011_021ca444: tail-call into ov000 with fixed args (0, 9).
 *
 *     ldr ip, =func_ov000_021ab40c
 *     mov r0, #0x0
 *     mov r1, #0x9
 *     bx  ip
 *
 * Cross-overlay call — the linker will emit an `ldr ip; bx ip`
 * trampoline anyway for ov011→ov000 branches, so plain tail-call
 * C should produce the right shape.
 */

extern int func_ov000_021ab40c(int a, int b);

int func_ov011_021ca444(void) {
    return func_ov000_021ab40c(0, 9);
}
