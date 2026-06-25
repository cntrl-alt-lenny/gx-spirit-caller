/* CAMPAIGN-PREP candidate for func_0224a580 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     loop: bind first getter result (sl), compare to getter(arg1), wide regset
 *   risk:       permuter-class: orig saves func_0202b878(kind) in sl (r10) then calls again with arg1 and compares; the sl-vs-r0 register choice and the r7/r8/r9/sl rotation across the 8-reg push is a scheduling coin-flip a C reshape won't pin. Bind result to a temp to match the spill.
 *   confidence: low
 */
typedef struct Entry { unsigned int kind : 13; unsigned int pad : 19; } Entry;

extern unsigned char data_ov002_022cf16c[2][0x868];
extern int data_ov002_022cf180[2][0x868 / 4];

extern int func_0202b878(int x);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_0224a580(int arg0, int arg1);

void func_ov002_0224a580(int arg0, int arg1)
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
        int a = func_0202b878((int)((*p << 0x13) >> 0x13));
        if (a == func_0202b878(arg1))
            func_ov002_02253458(arg0, 0xe, i);
        count = *(int *)(base + 0x14);
        i++;
        p++;
    } while (i < count);
}
