/* CAMPAIGN-PREP candidate for func_0207be90 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if(a&&b) tail-call funcB else tail-call funcA (void)
 *   risk:       the short-circuit guard order (beq a==0 -> funcA; bne b!=0 -> funcB) must keep funcA as the fallthrough/false target; both calls are void tail calls
 *   confidence: high
 */
/* func_0207be90: if both arguments are non-zero, dispatch to func_0207bcd8;
 * otherwise dispatch to func_0207bc20. Both are void tail calls.
 *
 *   cmp r0,#0; beq A;  cmp r1,#0; bne B;
 *   A: func_0207bc20();   B: func_0207bcd8();
 *   -> if (a && b) func_0207bcd8(); else func_0207bc20();
 */

extern void func_0207bc20(void);
extern void func_0207bcd8(void);

void func_0207be90(int a, int b) {
    if (a && b) {
        func_0207bcd8();
    } else {
        func_0207bc20();
    }
}
