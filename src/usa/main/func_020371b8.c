/* CAMPAIGN-PREP candidate for func_020371b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD on global halfword flag; tail call with orr-setup args
 *   risk:       None observed; verified byte-exact. data_0219b200 typed u16[] (ldrh@+0x12); arg-register pass-through r6/r5/r4 matches.
 *   confidence: high
 */
extern int func_02034a34(int a);
extern int func_02036d2c(int a, int b, int c, int d);
extern unsigned short data_0219b200[];

int func_020371b8(int a0, int r1, int r2, int r3) {
    if ((data_0219b200[0x12/2] & 0x4000) == 0)
        return 0;
    return func_02036d2c(func_02034a34(a0) | 0x1000000, r1, r2, r3 | 0x1400);
}
