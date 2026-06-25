/* CAMPAIGN-PREP candidate for func_0224a28c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind side-base, disp 0x418, getter==const + predicate, count[+0x14]
 *   risk:       reshape-able: structurally identical to 02249b88 but guard is func_0202b878(kind)==0xb. Risk is loop count reload vs hoist; force by reading count in the while-condition each iter (don't cache).
 *   confidence: med
 */
extern unsigned char data_ov002_022cf16c[2][0x868];
extern int data_ov002_022cf180[2][0x868 / 4];

extern int func_0202b878(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_0224a28c(int arg0);

void func_ov002_0224a28c(int arg0)
{
    int side = arg0 & 1;
    int i;
    int count;
    unsigned char *base;
    unsigned int *p;

    if (data_ov002_022cf180[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    p = (unsigned int *)(base + 0x18 + 0x400);
    i = 0;
    count = *(int *)(base + 0x14);
    do {
        if (func_0202b878((int)((*p << 0x13) >> 0x13)) == 0xb) {
            if (func_ov002_021c33e4(arg0, arg0, i) != 0)
                func_ov002_02253458(arg0, 0xe, i);
        }
        count = *(int *)(base + 0x14);
        i++;
        p++;
    } while (i < count);
}
