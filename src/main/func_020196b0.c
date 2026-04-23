/* func_020196b0: range predicate on an int arg with a seemingly-dead
 * call to the state getter. Returns 1 iff 0 < n < 100, else 0.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                  ; cache n
 *     bl    GetSystemWork           ; return value IGNORED
 *     cmp   r4, #0x64               ; n >= 100 ? jump to return 0
 *     bge   .L_020196d0
 *     cmp   r4, #0x0                ; n > 0 ?
 *     movgt r0, #0x1                ;   then return 1
 *     ldmgtia sp!, {r4, pc}
 *   .L_020196d0:
 *     mov   r0, #0x0                ; else return 0
 *     ldmia sp!, {r4, pc}
 *
 * 10 ARM instructions, 0x28 bytes.
 *
 * The `bl GetSystemWork` is emitted despite its return being unused.
 * mwcc treats extern functions as opaque (no pure/const attribute),
 * so a statement-level call survives DCE even when the result is
 * discarded. The source is likely a literal `GetSystemWork();` line
 * that the author kept for initialization-assertion side effects, or
 * a pattern like `(void)GetSystemWork();` stripped in a cleanup pass.
 * Either form compiles to the same bytes; the `void`-cast form is
 * marginally more explicit.
 */

extern char *GetSystemWork(void);

int func_020196b0(int n) {
    (void)GetSystemWork();
    if (n >= 100) goto zero;
    if (n > 0) return 1;
zero:
    return 0;
}
