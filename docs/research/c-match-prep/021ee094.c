/* CAMPAIGN-PREP candidate for func_021ee094 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f30 :13 first, b0:1 barrel compare, cf1ac/cf1a4 indexed by poff only (ioff not added)
 *   risk:       cf1ac/cf1a4 reads use ONLY poff (r5) not ioff here (add r1,LIT,r5 then ldr [r4,r1]) - r4 is the literal-pool ptr; if mwcc folds the symbol+poff differently the [r4,r1] two-reg form diverges. Plus idx-range branch (blt/ble) ordering. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021ee094 - CLASS D. f30 slot bitfield FIRST; self->b0!=player ->0;
 * idx in [5,10] else 0; if bit9 of cf1ac word clear, 021b878()==0x17 ->0; cf1a4[0]!=0
 * guard; then 021c1ef0(self,player,idx)!=0 -> 1 else 0.
 * b0 = u16:1 at +2 (lsl#31;lsr#31). 021b878 called with NO arg setup -> declare void. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202b878(void);
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);

int func_ov002_021ee094(struct Ov002Self *self, int player, int idx) {
    int poff, ioff;
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + poff + ioff + 0x30))->id == 0)
        return 0;
    if (self->b0 == player)
        return 0;
    if (idx < 5 || idx > 10)
        return 0;
    if (((*(unsigned int *)(data_ov002_022cf1ac + poff) >> 9) & 1) == 0) {
        if (func_0202b878() == 0x17)
            return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + poff) == 0)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0;
}
