/* CAMPAIGN-PREP candidate for func_0201c64c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Three accessor calls, commutative sum (x0+x1 then +x2) + conditional tail call
 *   risk:       Sum operand order add(x0,x1) then add(x2,..) must match; call-order x2,x0,x1 preserved by temps.
 *   confidence: med
 */
/* func_0201c64c: sum of three accessor calls, conditional tail call.
 *   a = r6; GetSystemWork() (discarded);
 *   x2 = func_020195b8(a, 2);
 *   x0 = func_020195b8(a, 0);
 *   x1 = func_020195b8(a, 1);
 *   if (x2 + (x0 + x1) == 0x1e) func_0200a204(a);   (tail)
 */

extern char *GetSystemWork(void);
extern int func_020195b8(int a, int sel);
extern void func_0200a204(int a);

void func_0201c64c(int a) {
    int x2, x0, x1;
    GetSystemWork();
    x2 = func_020195b8(a, 2);
    x0 = func_020195b8(a, 0);
    x1 = func_020195b8(a, 1);
    if (x2 + (x0 + x1) == 0x1e) {
        func_0200a204(a);
    }
}
