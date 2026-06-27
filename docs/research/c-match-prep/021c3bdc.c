/* CAMPAIGN-PREP candidate for func_021c3bdc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl i then count (r4/r5); :13 bitfield; 1-arg callee; addne accumulator
 *   risk:       reshape-able: i/count decl order (r4=i,r5=count) and idx uses r1 not r2 here; if mwcc picks a different scratch for idx the mul/ldr regs shift — swap decl order to re-pin.
 *   confidence: high
 */
/* func_ov002_021c3bdc: count over the first *(row+0xc) entries of the
 * per-player row at cf16c+(player&1)*0x868 how many have
 * func_0202e234(id13) != 0. Single-arg callee, no arg1. id :13 bitfield;
 * bound reloaded each iter (unsigned). */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int id);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3bdc(int player) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int i = 0;
    int count = 0;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0xc); i++) {
        unsigned int id = ((struct Ov002Id13 *)(row + 0x120 + i * 4))->v;
        if (func_0202e234(id) != 0)
            count++;
    }
    return count;
}
