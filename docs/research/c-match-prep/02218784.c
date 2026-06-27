/* CAMPAIGN-PREP candidate for func_02218784 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; id==const dispatch; bitfield b0; do-while loop recomputing count(b0,id) each iter
 *   risk:       reshape-able (NONE NEEDED): VERIFIED byte-exact vs the shipped .s by compiling with mwcc 2.0/sp1p5. The first 0x135a-branch call's stale-r0=self is reproduced because no path writes r0 before it.
 *   confidence: high
 */
typedef unsigned short u16;

struct Self02218784 {
    u16 id;                 /* +0 */
    u16 b0 : 1; u16 : 15;   /* +2 */
    u16 : 2; u16 b2 : 1;    /* +4 bit2 */
};

extern void func_ov002_021e05fc(int player, int v);
extern void func_ov002_021df818(void *self, int player, int v);
extern int  func_ov002_021c2f24(int player, int id);

int func_ov002_02218784(struct Self02218784 *self) {
    int i;
    if (self->b2) return 0;
    if (self->id == 0x1352) {
        func_ov002_021e05fc(self->b0, 0x3e8);
        i = 0;
        if (func_ov002_021c2f24(self->b0, self->id) > 0) {
            do {
                func_ov002_021e05fc(self->b0, 0x1f4);
                i++;
            } while (i < func_ov002_021c2f24(self->b0, self->id));
        }
    } else if (self->id == 0x135a) {
        func_ov002_021df818(self, 1 - self->b0, 0x2bc);
        i = 0;
        if (func_ov002_021c2f24(self->b0, self->id) > 0) {
            do {
                func_ov002_021df818(self, 1 - self->b0, 0x12c);
                i++;
            } while (i < func_ov002_021c2f24(self->b0, self->id));
        }
    }
    return 0;
}
