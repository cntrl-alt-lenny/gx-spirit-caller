/* CAMPAIGN-PREP candidate for func_0205d4c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf predicate; left-to-right && guard chain, conditional return
 *   risk:       && evaluation order must be fc,f8,f18,f10; final moveq/bxeq form depends on last load landing in r0
 *   confidence: high
 */
/* func_0205d4c0: leaf predicate. Return 1 iff p != 0 and all of
 * p->+0xc, p->+0x8, p->+0x18, p->+0x10 are zero. Field-check order
 * in the asm is 0xc, 0x8, 0x18, 0x10 -- preserve it.
 */

typedef struct {
    char _pad_00[0x8];
    int  f8;     /* +0x08 */
    int  fc;     /* +0x0c */
    int  f10;    /* +0x10 */
    char _pad_14[0x18 - 0x14];
    int  f18;    /* +0x18 */
} Flags;

int func_0205d4c0(Flags *p) {
    if (p != 0 && p->fc == 0 && p->f8 == 0 && p->f18 == 0 && p->f10 == 0) {
        return 1;
    }
    return 0;
}
