/* CAMPAIGN-PREP candidate for func_020202ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     save 3 args, reverse-order pass r2->r1 r0->r2 r1->r3, 3 stack consts
 *   risk:       orig saves r0,r1,r2 into r6,r5,r4 then feeds func_0209f2a8 as (r2,r0,r1)=(r4,r6,r5): a register rotation. mwcc decl-order of the three saved locals drives which callee-saved reg each gets; wrong order = different mov shuffle. permuter-class (caller-arg rotation)
 *   confidence: low
 */
/* func_020202ac: build+dispatch an action; on result 2 return 1, else maybe
 * invoke the f38 callback with a freshly computed id.
 * func_0209f2a8(func_02020358, c, a, b, 0xffff, 0xe, 2).
 */
struct Ctl { char pad0[0x38]; void (*f38)(void *, int); int f3c; };
extern struct Ctl data_02191f40;
extern unsigned char data_020c67b8[];
extern unsigned char data_02193320[];
extern void func_02092904(void *a, int b);
extern int  func_0201f0f4(void);
extern void func_02020358(void);
extern int  func_0209f2a8(void *fn, int r1, int r2, int r3, int s0, int s1, int s2);

int func_020202ac(int a, int b, int c)
{
    func_02092904(data_02193320, data_02191f40.f3c);
    if (func_0209f2a8(func_02020358, c, a, b, 0xffff, 0xe, 2) == 2)
        return 1;
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(data_020c67b8, func_0201f0f4());
    return 0;
}
