/* CAMPAIGN-PREP candidate for func_022b859c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: bitfield :1/:5/:8 extract; %3 magic; two identical calls; tst#0x100 guard.
 *   risk:       Duplicate func_02021660 call (asm calls it twice with same args, only r0 of 1st kept as r5); mwcc may CSE the two into one -> diverge. reshape-able by writing both calls explicitly (done) but CSE may still fold; permuter-class if it does.
 *   confidence: med
 */
/* func_ov002_022b859c - bitfield extract + %3 + guard chain, returns bool.
 * Same h-extract as 022b84c0 (h at data_ov002_022d1910+0x90, {:1,:5,:8}).
 * sel computed identically (f1==0xb branch -> v%3, else table short).
 * Then: a = func_02021660(obj->f0, 3, sel+0x2e); (called twice, 1st kept)
 *  if func_02025880()!=0 return 1;
 *  return (func_020216bc(a,0) & 0x100) ? 1 : 0. */

struct bf_859c {
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short f6 : 8;
};

extern unsigned short data_ov002_022d1910[];   /* _LIT0 */
extern unsigned char  data_ov002_022d1410[];   /* _LIT1 */
extern short          data_ov002_022cccc0[];   /* _LIT3 */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216bc(int a, int b);
extern int  func_02025880(void);

struct obj_859c { int f0; };

int func_ov002_022b859c(struct obj_859c *obj)
{
    struct bf_859c h;
    int v, sel, idx, a;

    *(unsigned short *)&h = data_ov002_022d1910[0x90 / 2];

    if (h.f1 == 0xb) {
        idx = *(int *)(data_ov002_022d1410 + h.f0 * 0xcc + 0x488);
        v = (int)h.f6 - idx;
        sel = v % 3;
    } else {
        sel = data_ov002_022cccc0[h.f1 * 3];
    }

    a = func_02021660(obj->f0, 3, sel + 0x2e);
    func_02021660(obj->f0, 3, sel + 0x2e);
    if (func_02025880() != 0) return 1;
    if (func_020216bc(a, 0) & 0x100) return 1;
    return 0;
}
