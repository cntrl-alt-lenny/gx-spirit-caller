/* CAMPAIGN-PREP candidate for func_02287a08 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     min-as-if-assign (if(best<=t)best=...); reload f2&1 each call; two counted loops; bind base/stride
 *   risk:       struct-guessed + reshape-able: 2nd loop's bl arg is r6(last) not sel — call signature ambiguous; the if(best<=t)best=recompute pattern (re-call) must match cmp+bgt+re-bl, ternary would CSE.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

typedef struct Slot {
    u8  pad0[0x38];
    u16 f38;
} Slot;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c84a8(int a, int b);

int func_ov002_02287a08(Ent *e)
{
    int best;            /* r7 */
    Ent *ent;            /* r8 */
    int j;               /* r4 */
    int last;            /* r6 */
    u8 *base;            /* r4 reused */
    int stride;          /* r9 */
    int off;             /* r5 */
    int t;

    best = 0;
    ent = e;
    for (j = 0; j < 5; j++) {
        t = func_ov002_021c8470(ent->f2 & 1, j);
        if (best <= t) best = func_ov002_021c8470(ent->f2 & 1, j);
        t = func_ov002_021c84a8(ent->f2 & 1, j);
        if (best <= t) best = func_ov002_021c84a8(ent->f2 & 1, j);
    }
    last = 0;
    base = data_ov002_022cf16c;
    stride = 0x868;
    off = 0;
    for (last = 0; last < 5; last++, off += 0x14) {
        int sel = (1 - (ent->f2 & 1)) & 1;
        Slot *s = (Slot *)(base + sel * stride + off);
        if (s->f38 != 0) {
            if (func_ov002_021c8470(last, 0 /*sel placeholder*/) > best) return 1;
        }
    }
    return 0;
}
