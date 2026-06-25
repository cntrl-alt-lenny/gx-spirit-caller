/* CAMPAIGN-PREP candidate for func_021b3ea0 (ov010, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r5 first; strmi->if(t<0); divmod helper r0-only; bind globals
 *   risk:       reshape-able: r5 must occupy the callee-saved kept across (mov r5,#0 early); if mwcc sinks the 0-init or reorders dispatch vs MMIO BIC, the r4/r5 allocation diverges.
 *   confidence: med
 */
/* func_ov010_021b3ea0: decrement a 0x1000-step timer (clamp-to-0 of a
 * sibling counter when it underflows), push a scroll/offset to an MMIO
 * register via a signed-divide helper, optionally clear a blend MMIO when
 * the counter hit 0, then dispatch on a 1/2/3 state selector.
 *
 *   ldr r1,[r0,#0xa0]; subs r1,#0x1000; str r1,[r0,#0xa0]; strmi r5,[r4,#0x64]
 *   ... func_020b3870(-(g->f64<<4), g->f68) ; func_0208c884(0x0400006c,-0x10-r0)
 *   if g->f64==0: *(0x04000000) &= ~0x1f00 ; func_0208c884(0x0400006c,-0x10); r5=1
 *   switch g->f0: 1->021b6514 2->021b8514 3->(fallthrough); return r5
 */

typedef struct {
    char _pad_a[0xa0];
    int  f_a0;            /* +0xa0 timer */
} S_ov010_8d08;

typedef struct {
    int  f_0;            /* +0x0 state selector */
    char _pad_4[0x60];
    int  f_64;           /* +0x64 */
    int  f_68;           /* +0x68 */
} S_ov010_8d44;

extern S_ov010_8d08 data_ov010_021b8d08;
extern S_ov010_8d44 data_ov010_021b8d44;
extern void func_0208c884(void *reg, int v);
extern int  func_020b3870(int a, int b);
extern int  func_ov010_021b6514(void);
extern int  func_ov010_021b8514(void);

int func_ov010_021b3ea0(void) {
    int r5 = 0;
    int t;

    t = data_ov010_021b8d08.f_a0 - 0x1000;
    data_ov010_021b8d08.f_a0 = t;
    if (t < 0)
        data_ov010_021b8d44.f_64 = 0;

    func_0208c884((void *)0x0400006c,
                  (-0x10) - func_020b3870(-(data_ov010_021b8d44.f_64 << 4),
                                          data_ov010_021b8d44.f_68));

    if (data_ov010_021b8d44.f_64 == 0) {
        *(volatile unsigned int *)0x04000000 &= ~0x1f00;
        func_0208c884((void *)0x0400006c, -0x10);
        r5 = 1;
    }

    if (data_ov010_021b8d44.f_0 == 1)
        func_ov010_021b6514();
    else if (data_ov010_021b8d44.f_0 == 2)
        func_ov010_021b8514();

    return r5;
}
