/* CAMPAIGN-PREP candidate for func_02296e48 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hold call0 in r4; bind base r1; add ip=a+b; chained add then *0x12c
 *   risk:       permuter-class: the add chain ip=r4+r0, lr=[r1,0xc], r0=lr+ip, r2=[r1,0x874]+r0 fixes a 3-add ordering; mwcc's add-tree shape for (base.c + (a+b) + base.874)*0x12c may schedule differently — reshape may not pin it.
 *   confidence: low
 */
// func_ov002_02296e48 — two-call sum + chained adds into mul; liveness
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int func_ov002_021bbeac(int which);
extern int data_ov002_022cf16c[];   // base; [+0xc] and [+0x874] fields

int func_ov002_02296e48(Obj *obj)
{
    int a = func_ov002_021bbeac(0);              /* r4 */
    int b = func_ov002_021bbeac(1);              /* r0 */
    int *base = data_ov002_022cf16c;             /* r1 held */
    int parity = obj->flags & 1;
    int idx = ((1 - parity) & 1) * 0x868;
    int sum = base[0xc / 4] + (a + b);
    int threshold = (base[0x874 / 4] + sum) * 0x12c;

    if (*(int *)((char *)base + idx) <= threshold)
        return 1;
    return 0;
}
