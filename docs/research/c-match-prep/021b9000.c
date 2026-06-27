/* CAMPAIGN-PREP candidate for func_021b9000 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind poff/ioff, :13 id, sorted membership, bit10 / tail-call
 *   risk:       orig keeps poff(r3) & ioff(r2) in caller-saved regs across a 4-way bgt/bge cascade (call only on the miss arm) and uses 0x172f as the pivot const; reg coloring + tree shape likely 2-3 insns off (permuter-class).
 *   confidence: low
 */
/* func_ov002_021b9000: read the :13 slot id from cf16c + (p&1)*0x868 +
 * idx*0x14 + 0x30; if id is in { 0x1636, 0x172f, 0x1809, 0x1aca } return
 * bit10 of *(cf1ac + (p&1)*0x868 + idx*0x14); otherwise tail-call
 * func_0202e270(id). poff and ioff are both held/reused by the orig. */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern int  func_0202e270(int hw);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_021b9000(int player, int idx) {
    int poff = (player & 1) * 0x868;
    int ioff = idx * 0x14;
    unsigned int id =
        ((struct Ov002Slot *)((char *)data_ov002_022cf16c + poff + ioff + 0x30))->id;
    if (id == 0x1636 || id == 0x172f || id == 0x1809 || id == 0x1aca)
        return (*(unsigned int *)((char *)data_ov002_022cf1ac + poff + ioff)
                >> 0xa) & 1;
    return func_0202e270((int)id);
}
