/* CAMPAIGN-PREP candidate for func_0227da98 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain early-returns + add + le-compare bool (movle/movgt)
 *   risk:       order of the final two calls (021c3ae4 then 021ba6cc) and r4 pinning across; rsb (1-a) vs sub may differ
 *   confidence: med
 */
/* func_ov002_0227da98: 4-call guard chain returning a small code.
 *
 *   r5=a; r0=1-a; bl 021bae7c(1-a,0x1256,-1); if r0!=0 return 0
 *   bl 021bae7c(a,0x144d,-1);                 if r0!=0 return 2
 *   r4 = 021c3ae4(a,0x144d)
 *   r0 = 021ba6cc(a,0x144d)
 *   add r4,r0; cmp#0; movle#1; movgt#0; return
 */
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021c3ae4(int a, int b);
extern int func_ov002_021ba6cc(int a, int b);

int func_ov002_0227da98(int a) {
    if (func_ov002_021bae7c(1 - a, 0x1256, -1) != 0)
        return 0;
    if (func_ov002_021bae7c(a, 0x144d, -1) != 0)
        return 2;
    return func_ov002_021c3ae4(a, 0x144d) + func_ov002_021ba6cc(a, 0x144d) <= 0;
}
