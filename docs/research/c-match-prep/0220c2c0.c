/* CAMPAIGN-PREP candidate for func_0220c2c0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard call + (x>=2)?1:0 movge/movlt tail
 *   risk:       movge/movlt pair vs branch; both calls pass p in r0 — confirm 07b3c takes p
 *   confidence: high
 */
/* func_ov002_0220c2c0 — two-call boolean guard */

typedef struct Entity Entity;

extern int func_ov002_02207b3c(Entity *p);
extern int func_ov002_022577dc(Entity *p);

int func_ov002_0220c2c0(Entity *p)
{
    if (func_ov002_02207b3c(p) == 0)
        return 0;
    return func_ov002_022577dc(p) >= 2 ? 1 : 0;
}
