/* CAMPAIGN-PREP candidate for func_02280b74 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: :13 bitfield, branch-select call (a==b), min/max if-assign, frame buf
 *   risk:       g3/g4 (sp arg + stack-spilled r3) gate two clamps; the `a==b`→which-helper select and `v>best` max must keep cond-move form. struct-guessed (active :13 @0x30, buf f18@0x18/f1c@0x1c); g3 is spilled r3.
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
    char pad0[0x18];
    int f18;
    int f1c;
};

int func_ov002_02280b74(int a, int b, int lim, int g3, int g4)
{
    struct Slot *slot;
    int i;
    int best;
    int v;
    struct Res buf;

    slot = (struct Slot *)(data_ov002_022cf16c + (b & 1) * 0x868);
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
            v = buf.f18;
            if (v < 0)
                v = 0;
        }
        if (g4 != 0) {
            if (v <= buf.f1c)
                v = buf.f1c;
        }
        if (v > best)
            best = v;
    }
    return best;
}
