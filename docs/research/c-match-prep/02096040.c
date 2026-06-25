/* CAMPAIGN-PREP candidate for func_02096040 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     zero local struct then assign; const-fold yields dead stack stores
 *   risk:       compiler may elide the dead sp stores at -O4; if so emit only the two p stores — drop the local.
 *   confidence: low
 */
// func_02096040 — zero an 8-byte struct via const-folded local copy
// Recipe: T t={0}; *p=t; -> stack init (dead) + direct zero stores.

typedef struct {
    int a;
    int b;
} Pair02096040;

void func_02096040(Pair02096040 *p)
{
    Pair02096040 t = { 0, 0 };
    *p = t;
}
