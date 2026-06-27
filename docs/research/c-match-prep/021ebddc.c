/* CAMPAIGN-PREP candidate for func_021ebddc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     extract field13 before call (callee-saved bind); fused-mla index; call-first order
 *   risk:       orig reuses r6 as both table-base then self, and keeps field13 in r7 across the c1ef0 call; if mwcc spills field or reorders the pre-call load, the early `bl func_021c1ef0` placement diverges. reshape-able (declare field before the call).
 *   confidence: med
 */
/* func_ov002_021ebddc (ov002, class C). args r0=self, r1=a, r2=row.
 * Distinctive: 021c1ef0(self,a,row) is called FIRST (before the b0/row/f30 guards);
 * subrow.f30 is extracted into a callee-saved reg (r7) BEFORE the call and reused after.
 * The 2D index uses fused mla (col not reused here). self also read at +0/+2. */

struct self_t { unsigned short f0; unsigned short f2_b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int  func_0202e2f8(int id);
extern int  func_ov002_021b3ecc(int a, int row, int f0);
extern int  func_ov002_021c1ef0(struct self_t *self, int a, int row);

int func_ov002_021ebddc(struct self_t *self, int a, int row) {
    struct subrow *sr = (struct subrow *)(data_ov002_022cf16c + (a & 1) * 0x868 + row * 20);
    int field = sr->f30;
    if (func_ov002_021c1ef0(self, a, row) == 0)
        return 0;
    if (a != self->f2_b0)
        return 0;
    if (row >= 5)
        return 0;
    if (field == 0)
        return 0;
    if (func_0202e2f8(field) != 0)
        return 0;
    return func_ov002_021b3ecc(a, row, self->f0) == 0;
}
