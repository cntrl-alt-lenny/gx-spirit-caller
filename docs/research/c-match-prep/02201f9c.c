/* CAMPAIGN-PREP candidate for func_02201f9c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline i*0x14 (no shared mla base), outer mla per-player base bound, :19 field gate
 *   risk:       orig keeps r1 (mla base) and r6(=base+0x30) as parallel induction pointers; mwcc may pick one ptr or recompute mla, diverging the inner addressing. permuter-class (induction/SR)
 *   confidence: low
 */
/* func_ov002_02201f9c (ov002, class C) — batch p_0081.
 * Nested 2x5 loop over per-player table cf16c+(p&1)*0x868: slot.field19!=0 &&
 * slot.h38==0 && slot.h36!=0 -> return 1; else tail 021eace4 via 02257878 >0.
 * Outer p in {0,1}, inner i in 0..4, stride 0x14 from base+0x30.
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_02257878(int z, void *fn);
extern int func_ov002_021eace4(void);

struct Ov002Slot {
    unsigned int field19 : 19;  /* [+0] lsl#0x13;lsr#0x13 */
    char _p0[0x36 - 4];
    unsigned short h36;         /* +0x36 */
    unsigned short h38;         /* +0x38 */
};                              /* row stride handled via 0x14 byte step */

int func_ov002_02201f9c(void) {
    int p;
    for (p = 0; p < 2; p++) {
        char *row = data_ov002_022cf16c + (p & 1) * 0x868 + 0x30;
        int i;
        for (i = 0; i < 5; i++) {
            struct Ov002Slot *s = (struct Ov002Slot *)(row + i * 0x14);
            if (s->field19 != 0 && s->h38 == 0 && s->h36 != 0)
                return 1;
        }
    }
    return func_ov002_02257878(0, func_ov002_021eace4) > 0;
}
