/* CAMPAIGN-PREP candidate for func_0228da54 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical to prior; != 0 -> movne; bind held offsets, decl player-first
 *   risk:       same as 0228d9ec: bind-vs-reload of the r6/r5 offsets across the bl is the lever (reshape-able by binding); the != 0 if-assign yields movne. Residual callee-reg pairing permuter-class.
 *   confidence: med
 */
/* func_ov002_0228da54: clone of 0228d9ec, ONLY difference movne vs moveq
 * (cls C). Same held player/row offsets across the call; final test is the
 * cf1a4 u16 NON-zero -> ret=1 (movne). Bind p,r once, declared player-first. */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_0202f9e8(int id);

int func_ov002_0228da54(int arg0, int arg1) {
    int p = (arg0 & 1) * 0x868;
    int r = arg1 * 0x14;
    unsigned int id = ((struct Ov002Slot *)(data_ov002_022cf16c + p + r + 0x30))->id;
    int ret = 0;
    if (func_0202f9e8(id) != 0) {
        if (*(u16 *)(data_ov002_022cf1a4 + p + r) != 0)
            ret = 1;
    }
    return ret;
}
