/* CAMPAIGN-PREP candidate for func_020707f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     probe-call guard + arg-NULL guard + second call; stack-arg forwarding
 *   risk:       stack-arg ABI: 6 params means s0/s1 on stack — caller layout must match sp+0x10/0x14; first-call arg order assumed
 *   confidence: med
 */
/* func_020707f0 (main, class A): probe call, two NULL guards, second
 * call. Saves {r4,r5,lr}+4 scratch. r5=arg2, r4=arg3 cached across the
 * first call; two stack args (sp+0x10, sp+0x14) forwarded to the probe.
 *
 *   r2 = stack0; r3 = stack1;
 *   r = func_0207084c(a0, a1, stack0, stack1);
 *   if(r == 0) return;
 *   if(arg3 == 0) return;
 *   func_0207084c(arg2, arg3, stack0, 0);
 *
 * Note the probe takes (a0,a1,stack0,stack1) i.e. the incoming r0,r1
 * plus the two stack args; the second call passes the cached r2,r3 as
 * its r0,r1 and reuses stack0 as r2, 0 as r3. r5(arg2)/r4(arg3) are
 * callee-saved so they survive the first call.
 */

extern int func_0207084c(int a0, int a1, int a2, int a3);

void func_020707f0(int a0, int a1, int a2, int a3, int s0, int s1)
{
    if (func_0207084c(a0, a1, s0, s1) == 0)
        return;
    if (a3 == 0)
        return;
    func_0207084c(a2, a3, s0, 0);
}
