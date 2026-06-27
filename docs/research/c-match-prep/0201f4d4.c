/* CAMPAIGN-PREP candidate for func_0201f4d4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     or-of-equals early return, u16 zero-extend args, stack args via stmia
 *   risk:       orig packs 4th/5th args (f3c<<16>>16, const 1) with stmia sp,{r1,r3} -- mwcc must spill those two stack args adjacently in that reg order. If it schedules the f10 u16 (r2) load before building the stack pair, the stmia fuses differently. reshape-able (compute stack args last) + struct-guessed
 *   confidence: low
 */
/* func_0201f4d4: if mode f30 in {4,6,5} bail success; else run a transition.
 * func_0209f404(func_0201f568, data_02193380, (u16)f10, data_02193320,
 *               (u16)f3c, 1); if it returns 2, success; else func_0201f19c().
 */
struct Ctl { char pad0[0x10]; unsigned short f10; char pad12[0x30-0x12]; int f30; char pad34[0x3c-0x34]; unsigned short f3c; };
extern struct Ctl data_02191f40;
extern unsigned char data_02193320[];
extern unsigned char data_02193380[];
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern void func_0201f568(void);
extern int  func_0209f404(void *a, void *b, int c, void *d, int e, int f);

int func_0201f4d4(void)
{
    int m = data_02191f40.f30;
    if (m == 4 || m == 6 || m == 5) return 1;
    func_0201f138(4);
    if (func_0209f404(func_0201f568, data_02193380, data_02191f40.f10,
                      data_02193320, data_02191f40.f3c, 1) == 2)
        return 1;
    func_0201f19c();
    return 0;
}
