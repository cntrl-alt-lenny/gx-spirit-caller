/* CAMPAIGN-PREP candidate for func_02249a54 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind side-base, mul-index, two getter==const guards, reload entry word
 *   risk:       reshape-able/permuter-class: orig RE-LOADS [r5] before each getter call (two ldr of same word); if mwcc CSEs the field into one reg the second ldr vanishes. Force by reading entry->kind twice into the calls separately.
 *   confidence: med
 */
typedef struct Entry { unsigned int kind : 13; unsigned int pad : 19; } Entry;

extern unsigned int data_ov002_022cf16c[2][0x868 / 4];
extern int data_ov002_022cf17c[2][0x868 / 4];

extern int func_0202b878(int x);
extern int func_0202b8c0(int x);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_02249a54(int arg0);

void func_ov002_02249a54(int arg0)
{
    int side = arg0 & 1;
    int i;
    int count;
    unsigned int *base;
    unsigned int *p;

    if (data_ov002_022cf17c[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    p = base + (0x260 / 4);
    i = 0;
    count = *(int *)((char *)base + 0x10);
    do {
        if (func_0202b878((int)((*p << 0x13) >> 0x13)) == 0x16) {
            if (func_0202b8c0((int)((*p << 0x13) >> 0x13)) == 0x6)
                func_ov002_02253458(arg0, 0xd, i);
        }
        count = *(int *)((char *)base + 0x10);
        i++;
        p++;
    } while (i < count);
}
