/* B-08 stub for brief 198 permuter wave.
 *
 * Disasm:
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #4
 *     ldr   r0, [r0]
 *     bl    func_020b3870
 *     mov   r0, r1
 *     add   sp, sp, #4
 *     ldmfd sp!, {pc}
 *
 * The `mov r0, r1` after the BL suggests func_020b3870 returns a
 * 64-bit value (low in r0, high in r1) and this function extracts
 * the high half.
 */

typedef long long s64;

extern s64 func_020b3870(int x);

int func_0205da2c(int *p) {
    return (int)(func_020b3870(*p) >> 32);
}
