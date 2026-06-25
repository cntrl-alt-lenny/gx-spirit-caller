/* CAMPAIGN-PREP candidate for func_02249b88 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind side-base, array disp 0x418, count[+0x14], :13 guard pair
 *   risk:       struct-guessed: array disp 0x18+0x400=0x418 and count[+0x14] differ from sibling funcs — confirm side-block sub-layout. Loop walk-pointer vs reload-count reshape-able if mwcc hoists count.
 *   confidence: med
 */
typedef struct Entry { unsigned int kind : 13; unsigned int pad : 19; } Entry;

extern unsigned int data_ov002_022cf16c[2][0x868 / 4];
extern int data_ov002_022cf180[2][0x868 / 4];

extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_02249b88(int arg0);

void func_ov002_02249b88(int arg0)
{
    int side = arg0 & 1;
    int i;
    int count;
    unsigned int *base;
    unsigned int *p;

    if (data_ov002_022cf180[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    p = (unsigned int *)((char *)base + 0x18 + 0x400);
    i = 0;
    count = *(int *)((char *)base + 0x14);
    do {
        if (func_0202e234((int)((*p << 0x13) >> 0x13)) != 0) {
            if (func_ov002_021c33e4(arg0, arg0, i) != 0)
                func_ov002_02253458(arg0, 0xe, i);
        }
        count = *(int *)((char *)base + 0x14);
        i++;
        p++;
    } while (i < count);
}
