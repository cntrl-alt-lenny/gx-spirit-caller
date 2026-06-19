/* func_ov002_021f48e0: C-39b — helper-reuse without sign-check.
 *
 * Orig shape (48 B, 12 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021f3368       ; helper1(self)
 *     ldrh  r2, [r4, #2]
 *     mov   r1, r0                    ; r1 = n (held live for helper2)
 *     lsl   r0, r2, #17               ; r0 = (f2 << 17), bit 14 to bit 31
 *     lsl   r2, r2, #31               ; r2 = bit 0 of f2 to bit 31
 *     lsr   r0, r0, #31                ; r0 = bit14
 *     eor   r0, r0, r2, lsr #31        ; r0 = bit0 ^ bit14
 *     bl    func_ov002_021df690       ; helper2(bit0^bit14, n)
 *     mov   r0, #1
 *     pop   {r4, pc}
 *
 * Brief 226 C-39b sub-variant — helper-reuse without a sign-check.
 * n is held in r1 across the bitfield-extract sequence and consumed
 * as helper2's second argument. No branch, no comparison.
 *
 * Note: source-XOR operand order matters for mwcc's scheduler.
 * `self->f2.bit0 ^ self->f2.bit14` emits bit14-extract first
 * (matching orig); the reversed order `bit14 ^ bit0` emits
 * bit0-extract first — same XOR result but different instruction
 * sequence.
 *
 * See `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`.
 */

struct Func021f49d0F2 {
    unsigned short bit0  : 1;
    unsigned short pad   : 13;
    unsigned short bit14 : 1;
    unsigned short top   : 1;
};

struct Func021f49d0Self {
    unsigned short pad0;
    struct Func021f49d0F2 f2;
};

extern int func_ov002_021f3368(struct Func021f49d0Self *self);
extern int func_ov002_021df690(unsigned int xor_bits, int n);

int func_ov002_021f48e0(struct Func021f49d0Self *self) {
    int n = func_ov002_021f3368(self);
    func_ov002_021df690(self->f2.bit0 ^ self->f2.bit14, n);
    return 1;
}
