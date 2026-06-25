/* CAMPAIGN-PREP candidate for func_022499b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order locals, bind side-base, mul-index array, if-assign clamp
 *   risk:       struct-guessed: array disp 0x260 + count[+0x10] inferred from 0x868-stride side block; if padding wrong every ldr offset diverges. Loop reg-alloc (r5 walk vs r6 base) reshape-able.
 *   confidence: med
 */
typedef struct Entry { unsigned int kind : 13; unsigned int pad : 19; } Entry;

typedef struct Side {
    unsigned char pad0[0x260];
    Entry entries[152];
    unsigned char pad1[0x10 - 0]; /* count sits at side+0x10 region; see note */
} Side;

extern unsigned int data_ov002_022cf16c[2][0x868 / 4];
extern int data_ov002_022cf17c[2][0x868 / 4];

extern int func_ov002_021ca3f0(int a, int b);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_022499b0(int arg0, int arg1);

void func_ov002_022499b0(int arg0, int arg1)
{
    int side = arg0 & 1;
    int i;
    int count;
    unsigned int *base;
    unsigned int *p;

    if (arg1 == 0x15b6)
        arg1 = 0x15b6 + 1;

    if (data_ov002_022cf17c[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    p = base + (0x260 / 4);
    i = 0;
    count = *(int *)((char *)base + 0x10);
    do {
        unsigned int w = *p;
        if (arg1 == ((w << 0x13) >> 0x13)) {
            if (func_ov002_021ca3f0(arg0, arg1) != 0)
                func_ov002_02253458(arg0, 0xd, i);
        }
        count = *(int *)((char *)base + 0x10);
        i++;
        p++;
    } while (i < count);
}
