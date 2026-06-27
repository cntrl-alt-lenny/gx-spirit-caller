/* CAMPAIGN-PREP candidate for func_0228d9ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind held player/row offsets (decl player-first); :13 bitfield; if-assign result
 *   risk:       orig holds (arg0&1)*0x868 in r6 and arg1*0x14 in r5 across the bl; if mwcc reloads/recomputes either post-call, the cf1a4 add+ldrh index diverges. reshape-able (bind to locals, declared in r6,r5 first-use order); residual callee-reg pairing is permuter-class.
 *   confidence: med
 */
/* func_ov002_0228d9ec: mla index + :13 bitfield, simple predicate (cls C).
 * Resolve slot (arg0&1 player, arg1 row); proceed only if its id passes
 * func_0202f9e8, then return 1 iff the parallel cf1a4 u16 (same player/row
 * offsets) is zero. The orig HOLDS (arg0&1)*0x868 (r6) and arg1*0x14 (r5)
 * across the bl in callee-saved regs and REUSES both for the cf1a4 access
 * -> bind each to one local computed once, declared player-offset first. */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_0202f9e8(int id);

int func_ov002_0228d9ec(int arg0, int arg1) {
    int p = (arg0 & 1) * 0x868;
    int r = arg1 * 0x14;
    unsigned int id = ((struct Ov002Slot *)(data_ov002_022cf16c + p + r + 0x30))->id;
    int ret = 0;
    if (func_0202f9e8(id) != 0) {
        if (*(u16 *)(data_ov002_022cf1a4 + p + r) == 0)
            ret = 1;
    }
    return ret;
}
