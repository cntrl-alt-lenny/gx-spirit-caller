/* func_ov002_02295284: C-39d disjunction — helper(bit0, T1) || helper(bit0, T2).
 *
 * Orig shape (76 B, 19 ARM insns + 2 pool words):
 *
 *     push  {r4, lr}
 *     mov   r4, r0                    ; self
 *     ldrh  r0, [r4, #2]              ; first read
 *     ldr   r1, [pc, #60]             ; pool: literal T1 = 0x1181
 *     lsl/lsr #31                      ; bit0
 *     bl    func_ov002_021c3ae4       ; helper(bit0, T1)
 *     cmp   r0, #0
 *     bne   .L_first_true              ; first call truthy → return 1
 *     ldrh  r0, [r4, #2]              ; RE-READ self->f2.bit0
 *     ldr   r1, [pc, #36]             ; pool: literal T2 = 0x179a
 *     lsl/lsr #31                      ; bit0
 *     bl    func_ov002_021c3ae4       ; helper(bit0, T2)
 *     cmp   r0, #0
 *     beq   .L_both_false              ; second call falsy → return 0
 *   .L_first_true:
 *     mov   r0, #1
 *     pop   {r4, pc}
 *   .L_both_false:
 *     mov   r0, #0
 *     pop   {r4, pc}
 *     .word 0x00001181
 *     .word 0x0000179a
 *
 * Brief 232 deferred this pick — natural `||` short-circuit recipe
 * was reported as 54% fuzzy. Brief 235 re-tested under the standard
 * recipe and it ships byte-identical on first attempt. The original
 * brief 232 source form likely had a different structure (named
 * locals, intermediate result) that broke the short-circuit.
 *
 * The natural recipe IS the C-39d (multi-call re-read) idiom +
 * built-in `||` short-circuit handling. mwcc 2.0/sp1p5 lowers the
 * `||` to `bne / beq` early-exits perfectly.
 *
 * See `docs/research/brief-235-c39e-c40-broader-and-232-deferred.md`.
 */

struct Func02295284F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02295284Self {
    unsigned short pad0;
    struct Func02295284F2 f2;
};

extern int func_ov002_021c3ae4(unsigned int bit, int t);

int func_ov002_02295284(struct Func02295284Self *self) {
    return func_ov002_021c3ae4(self->f2.bit0, 0x1181) ||
           func_ov002_021c3ae4(self->f2.bit0, 0x179a);
}
