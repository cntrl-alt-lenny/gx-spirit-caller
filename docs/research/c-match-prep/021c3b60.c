/* CAMPAIGN-PREP candidate for func_021c3b60 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single local i (r4); :13 bitfield; in-loop early-return index; mvn -1 tail
 *   risk:       reshape-able: the movne r0,r4;ldmneia early-return must come from `return i` inside the loop; if mwcc lifts it to a flag the conditional-return ldm diverges.
 *   confidence: high
 */
/* func_ov002_021c3b60: like 021c3ae4 but returns the FIRST index i whose
 * func_0202df78(id13, arg1) != 0; returns -1 (mvn) if none. row at
 * cf16c+(player&1)*0x868, id :13 bitfield, bound reloaded each iter. */
extern char data_ov002_022cf16c[];
extern int  func_0202df78(int id, int arg1);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3b60(int player, int arg1) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int i;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0xc); i++) {
        unsigned int id = ((struct Ov002Id13 *)(row + 0x120 + i * 4))->v;
        if (func_0202df78(id, arg1) != 0)
            return i;
    }
    return -1;
}
