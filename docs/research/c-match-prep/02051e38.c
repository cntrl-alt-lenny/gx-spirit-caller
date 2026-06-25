/* CAMPAIGN-PREP candidate for func_02051e38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain returning bool, RELOAD global; sp3 routing
 *   risk:       field 0x1a9 u8; func_020469b4()==5 guard; sp3 (push{lr}+sub sp,#4+pop pc); return-block order
 *   confidence: med
 */
/* func_02051e38 -> src/main/func_02051e38.legacy_sp3.c (mwcc 1.2/sp3) */
typedef struct {
    char _pad[0x1a9];
    unsigned char f1a9;   /* +0x1a9 */
} State;
extern int   func_02045280(void);
extern State *func_020498f0(void);
extern int   func_020469b4(void);

int func_02051e38(void) {
    if (func_02045280() != 0)
        return 0;
    if (func_020498f0() != 0 && func_020469b4() == 5 && func_020498f0()->f1a9 == 0)
        return 1;
    return 0;
}
