/* CAMPAIGN-PREP candidate for func_021e97bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no b0 guard; two reads => mul+add; idx/f30/cf1a4/1ef0 order
 *   risk:       mwcc must CSE (player&1)*0x868 once and reuse for both reads (asm mul r3 reused via add r3,_LIT2,r3); folding into per-read mla diverges the index — reshape-able (keep two raw expressions, no bound base)
 *   confidence: med
 */
/* func_ov002_021e97bc (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * NO header(b0) test. Guards: idx>=5, f30==0, cf1a4 hw==0, 021c1ef0()==0;
 * tail 021c1e44 == 0 ? 1 : 0. Two reads (f30 + cf1a4) => split mul+add.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021e97bc(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
