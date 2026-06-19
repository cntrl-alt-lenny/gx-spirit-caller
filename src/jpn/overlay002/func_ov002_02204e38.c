/* func_ov002_02204e38: C-39d — multi-call re-read.
 *
 * Orig shape (68 B, 17 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r0, [r4, #2]                 ; first read of f2
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                   ; r0 = bit0
 *     rsb   r0, r0, #1                    ; r0 = !bit0
 *     bl    func_ov002_021bbe70          ; helper(!bit0)
 *     ldrh  r1, [r4, #2]                 ; RE-READ (no CSE across helper)
 *     mov   r4, r0                        ; save helper1 ret in r4
 *     lsl   r0, r1, #31
 *     lsr   r0, r0, #31                   ; r0 = bit0
 *     bl    func_ov002_021bbe70          ; helper(bit0)
 *     add   r0, r4, r0                    ; sum = helper(!bit0) + helper(bit0)
 *     cmp   r0, #4
 *     movge r0, #1
 *     movlt r0, #0
 *     pop   {r4, pc}
 *
 * Brief 229 C-39d recipe (natural source — no special idiom needed):
 * `helper(!self->f2.bit0); helper(self->f2.bit0)` — mwcc 2.0/sp1p5
 * does NOT CSE the two `self->f2.bit0` bitfield reads across the
 * helper call, so the bitfield extract is emitted twice naturally.
 *
 * Brief 224 hypothesised that defeating CSE would require volatile
 * pointers or function-call barriers; brief 229's variant matrix
 * found mwcc 2.0 already preserves the re-read for bitfield fields
 * because it can't prove the helper doesn't modify the struct
 * through aliased pointers.
 *
 * See `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md`.
 */

struct Func02204f28F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02204f28Self {
    unsigned short pad0;
    struct Func02204f28F2 f2;
};

extern int func_ov002_021bbe70(unsigned int bit);

int func_ov002_02204e38(struct Func02204f28Self *self) {
    int a = func_ov002_021bbe70(1 - self->f2.bit0);
    int b = func_ov002_021bbe70(self->f2.bit0);
    return (a + b) >= 4;
}
