/* CAMPAIGN-PREP candidate for func_02280c40 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: clone of 02280b74 + index-store; bitfield, branch-call, if-assign clamps
 *   risk:       the winning branch stores BOTH `strgt r4,[sp,#4]` (index) and `movgt r5,r7` (best) under one cmp — mwcc must predicate both; order/predication may split. struct-guessed (active :13 @0x30, buf f1c@0x1c/f20@0x20).
 *   confidence: med
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_0227aee0(int a, int b, void *c);
extern int func_ov002_0227af30(int a, int b, void *c);

struct Slot {
    char pad0[0x30];
    unsigned int active : 13;
};

struct Res {
    char pad0[0x1c];
    int f1c;
    int f20;
};

int func_ov002_02280c40(int a, int b, int lim, int g3, int g4)
{
    struct Slot *slot;
    int i;
    int best;
    int bestIdx;
    int v;
    struct Res buf;

    slot = (struct Slot *)(data_ov002_022cf16c + (b & 1) * 0x868);
    bestIdx = -1;
    best = -1;
    for (i = 0; i < 5; i++) {
        if (i == lim)
            break;
        if (slot[i].active == 0)
            break;
        v = 0;
        if (a == b)
            func_ov002_0227aee0(b, i, &buf);
        else
            func_ov002_0227af30(b, i, &buf);
        if (g3 != 0) {
            v = buf.f1c;
            if (v < 0)
                v = 0;
        }
        if (g4 != 0) {
            if (v <= buf.f20)
                v = buf.f20;
        }
        if (v > best) {
            bestIdx = i;
            best = v;
        }
    }
    return bestIdx;
}
