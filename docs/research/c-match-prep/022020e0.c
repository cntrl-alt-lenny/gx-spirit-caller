/* CAMPAIGN-PREP candidate for func_022020e0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     1-bit guard; 2-iter call loop; ldrh self[0] reload each iter
 *   risk:       021ca2b8/021ff2b8/022536e8 arity guessed; j(r4) stays 0 unused-but-passed; loop reg-alloc r4/r5 may flip
 *   confidence: med
 */
/* func_ov002_022020e0: guard 021ca2b8(b0,...) then a 2-iter loop calling
 * 021ff2b8(self,i) and 022536e8(i, self->f0_lo, j); all must be nonzero. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021ca2b8(int a, int b, int c, int d);
extern int func_ov002_021ff2b8(struct Self *self, int i);
extern int func_ov002_022536e8(int i, int hw, int j);

int func_ov002_022020e0(struct Self *self) {
    int i;
    int j;
    if (func_ov002_021ca2b8(self->b0, 0, 0, 0) == 0)
        return 0;
    j = 0;
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff2b8(self, i) == 0)
            return 0;
        if (func_ov002_022536e8(i, *(u16 *)self, j) == 0)
            return 0;
    }
    return 1;
}
