/* CAMPAIGN-PREP candidate for func_02033808 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ternary->orrne/biceq branchless toggle + external tail-call (bx ip)
 *   risk:       mwcc must pick ternary->predicated form and tail-optimize the external call to bx ip
 *   confidence: med
 */
/* func_02033808 — branchless flag toggle then tail-call */

typedef struct {
    unsigned char _pad_00[0xeb4];
    unsigned int flags;   /* +0xeb4 */
} Obj_02033808;

extern int func_02032d58(Obj_02033808 *p);

int func_02033808(Obj_02033808 *p, int set)
{
    p->flags = set ? (p->flags | 0x40000) : (p->flags & ~0x40000);
    return func_02032d58(p);
}
