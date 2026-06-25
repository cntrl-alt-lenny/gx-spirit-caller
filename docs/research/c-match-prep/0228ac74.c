/* CAMPAIGN-PREP candidate for func_0228ac74 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global guards + range-test then pass-through tail call
 *   risk:       (r2==0x12||r2==0x13) may range-opt vs cmp;cmpne; r0/r1 pass-through across guards
 *   confidence: med
 */
/* func_ov002_0228ac74: gate on ce288 globals (f5d4 != 0, byte f5dc > 5,
 * and not in {0x12,0x13}); else tail-call func_0228a9a4(a,b). */
typedef unsigned char u8;
extern char data_ov002_022ce288[];
extern int func_ov002_0228a9a4(void *a, void *b);

int func_ov002_0228ac74(void *a, void *b) {
    int  v   = *(int *)(data_ov002_022ce288 + 0x5d4);
    u8   k   = *(u8 *)(data_ov002_022ce288 + 0x5dc);
    if (v == 0) return 0;
    if (k <= 5) return 0;
    if (k == 0x12 || k == 0x13) return 0;
    return func_ov002_0228a9a4(a, b);
}
