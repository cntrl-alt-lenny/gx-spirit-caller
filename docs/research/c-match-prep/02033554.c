/* CAMPAIGN-PREP candidate for func_02033554 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on [s+0xe88] cmp #7 addls pc => branch-table; cases 4,7; common tail zeroes 3 fields
 *   risk:       reshape-able: needs `addls pc,pc,r1,lsl#2` jump-table (8 entries, switch 0..7 dense). mwcc emits this for dense small switch; if it picks compares instead, add explicit case 0..7 or make fe88 unsigned. Tail store-order e80,e84,e88.
 *   confidence: med
 */
typedef struct State {
    /* 0x00 */ char _pad00[0xe80];
    /* 0xe80 */ int fe80;
    /* 0xe84 */ int fe84;
    /* 0xe88 */ int fe88;
} State;

extern void func_02033488(void);
extern void func_020334b4(State *s);
extern void func_0204529c(void);

void func_02033554(State *s)
{
    switch (s->fe88) {
    case 4:
        func_02033488();
        break;
    case 7:
        func_02033488();
        func_020334b4(s);
        break;
    default:
        break;
    }
    s->fe80 = 0;
    s->fe84 = 0;
    s->fe88 = 0;
    func_0204529c();
}
