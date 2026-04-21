/* func_ov011_021ca524: tail-call into ov000 with fixed args (0, 9).
 *
 *     ldr ip, =func_ov000_021ab4ec
 *     mov r0, #0x0
 *     mov r1, #0x9
 *     bx  ip
 *
 * Cross-overlay call — the linker will emit an `ldr ip; bx ip`
 * trampoline anyway for ov011→ov000 branches, so plain tail-call
 * C should produce the right shape.
 */

extern int func_ov000_021ab4ec(int a, int b);

int func_ov011_021ca524(void) {
    return func_ov000_021ab4ec(0, 9);
}
