/* CAMPAIGN-PREP candidate for func_02051ec0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain with deref + call, RELOAD; bool-invert movs; sp3 routing
 *   risk:       field 0x200 word(ptr); func_02051618 result inverted to bool (eq->1); sp3 routing; guard order
 *   confidence: med
 */
/* func_02051ec0 -> src/main/func_02051ec0.legacy_sp3.c (mwcc 1.2/sp3) */
typedef struct {
    char _pad[0x200];
    int  f200;   /* +0x200 */
} State;
extern State *func_020498f0(void);
extern int   func_02045280(void);
extern int   func_02051618(int);

int func_02051ec0(void) {
    if (func_020498f0() == 0 || func_020498f0()->f200 == 0 || func_02045280() == 0)
        return 0;
    return func_02051618(func_020498f0()->f200) == 0;
}
