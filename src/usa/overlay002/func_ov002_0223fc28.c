/* func_ov002_0223fc28: bit-0 extract from halfword field + helper + return 1.
 *
 * Orig shape (28 bytes, 7 ARM insns, no internal pool):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]                ; r1 = halfword at struct offset 2
 *     lsl   r1, r1, #31                 ; bit 0 -> bit 31
 *     lsr   r1, r1, #31                 ; back to bit 0 (zero-extended)
 *     bl    func_ov002_0223d9e0         ; helper(self, bit0)
 *     mov   r0, #1                       ; return 1
 *     pop   {r3, pc}
 *
 * Brief 222 worked example for **C-39** — the non-leaf C-37 wall
 * surfaced by brief 220's hard-tier survey. brief 220 found 455
 * picks in this family (20.6% of the unclassified hard-tier
 * slice).
 *
 * Recipe: same bitfield-struct trick brief 218 used for C-37
 * Shape B (byte-low-zero check) — declare a 1-bit bitfield on
 * a u16 storage container. mwcc 2.0/sp1p5's bitfield-extract
 * code path emits the canonical `lsl #N; lsr #N` shift pair,
 * bypassing the mask peephole (`ands #1` / `tst #1`) that
 * direct shift casts would trigger.
 *
 * Variant matrix on 2.0/sp1p5:
 *   - `(p->f2 & 1) ? 1 : 0` ... → `ands #1` (collapsed)
 *   - `((unsigned)p->f2 << 31) >> 31` → also collapses
 *   - **u16 bitfield `bit0 : 1`** → `lsl #31; lsr #31` MATCH
 *
 * See `docs/research/brief-222-c39-non-leaf-bitfield.md` for
 * the full variant matrix + family scope.
 */

struct Func0223fd10Self {
    unsigned short pad0;            /* offset 0 */
    unsigned short bit0  : 1;        /* offset 2, bit 0 */
    unsigned short rest  : 15;
};

extern int func_ov002_0223d9e0(struct Func0223fd10Self *self, unsigned int bit);

int func_ov002_0223fc28(struct Func0223fd10Self *self) {
    func_ov002_0223d9e0(self, self->bit0);
    return 1;
}
