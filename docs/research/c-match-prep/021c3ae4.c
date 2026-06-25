/* CAMPAIGN-PREP candidate for func_021c3ae4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl i then count (r4/r5); :13 bitfield; reload unsigned bound; addne accumulator
 *   risk:       reshape-able: i/count decl-order (r4=i,r5=count) and the precheck loading via row+0xc vs cf178 pool; flip decl order or split the global if the entry ldr diverges.
 *   confidence: high
 */
/* func_ov002_021c3ae4: count, over the first *(row+0xc) entries of the
 * per-player row at cf16c+(player&1)*0x868, how many have
 * func_0202df78(id13, arg1) != 0. id is a :13 bitfield (lsl#19;lsr#19);
 * bound reloaded each iter (unsigned compares). cf178 appears in the
 * precheck pool = folded address of (row+0xc). */
extern char data_ov002_022cf16c[];
extern int  func_0202df78(int id, int arg1);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3ae4(int player, int arg1) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int i = 0;
    int count = 0;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0xc); i++) {
        unsigned int id = ((struct Ov002Id13 *)(row + 0x120 + i * 4))->v;
        if (func_0202df78(id, arg1) != 0)
            count++;
    }
    return count;
}
