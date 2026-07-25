/* CAMPAIGN-PREP candidate for func_020337b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ternary->orrne/biceq branchless toggle + external tail-call (bx ip)
 *   risk:       mwcc must pick ternary->predicated form and tail-optimize the external call to bx ip
 *   confidence: med
 */
/* func_020337b8 — branchless flag toggle then tail-call */

typedef struct {
    unsigned char _pad_00[0xeac];
    unsigned int flags;   /* +0xeac */
} Obj_02033808;

extern int func_02032d04(Obj_02033808 *p);

int func_020337b8(Obj_02033808 *p, int set)
{
    p->flags = set ? (p->flags | 0x40000) : (p->flags & ~0x40000);
    return func_02032d04(p);
}
