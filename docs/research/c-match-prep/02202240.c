/* CAMPAIGN-PREP candidate for func_02202240 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     rsb-invert (1-bit0) mul-table index recomputed per-iter, :13 id -> (u16), unsigned bound
 *   risk:       two table bases (cf180 for entry-guard, cf16c for body+bound) and idx recompute each iter; if mwcc hoists idx or merges bases, addressing/ldr count diverges. struct-guessed (cf180 vs cf16c roles) + permuter-class loop
 *   confidence: low
 */
/* func_ov002_02202240 (ov002, class C) — batch p_0081.
 * Counted loop over per-player table cf16c+(1-bit0)&1*0x868: row[+0x418][i] is a
 * :13 id, narrowed to u16, fed to 0202b878; ==0x16 -> return 1. Bound = table+0x14.
 * bit0 reloaded each iteration (orig re-ldrh [r7,#2] + rsb + mul).
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];   /* _LIT1: count/index base */
extern int func_0202b878(int hw);

struct Ov002Id { unsigned int id : 13; };   /* word entries at +0x418 */

int func_ov002_02202240(struct Ov002Self *self) {
    unsigned int idx = ((1 - self->b0) & 1) * 0x868;
    if ((unsigned int)*(int *)(data_ov002_022cf180 + idx) <= 0) return 0;
    {
        int i = 0;
        for (;;) {
            struct Ov002Id *e =
                (struct Ov002Id *)(data_ov002_022cf16c + idx + 0x418 + i * 4);
            if (func_0202b878((u16)e->id) == 0x16) return 1;
            i++;
            idx = ((1 - self->b0) & 1) * 0x868;
            if ((unsigned int)i >= (unsigned int)*(int *)(data_ov002_022cf16c + idx + 0x14))
                break;
        }
    }
    return 0;
}
