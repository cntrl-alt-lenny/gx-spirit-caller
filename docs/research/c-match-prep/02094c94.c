/* CAMPAIGN-PREP candidate for func_02094c94 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc + NULL-guard early return + field stores + tail call returning result
 *   risk:       Five-param r4-r7 save assignment and the [sp,#0x18] stack-arg load scheduling may flip; struct offsets guessed.
 *   confidence: med
 */
/* func_02094c94: allocate a record (func_02095880(1)), bail on NULL, fill five
 * fields at +4/+8/+c/+10/+14 from the five params, then tail into
 * func_02095838(record) and return its result. */
extern void *func_02095880(int n);
extern void *func_02095838(void *p);
typedef struct {
    int f0;   /* 0x00 */
    int f4;   /* 0x04 */
    int f8;   /* 0x08 */
    int fc;   /* 0x0c */
    int f10;  /* 0x10 */
    int f14;  /* 0x14 */
} Rec_02094c94;

void *func_02094c94(int a, int b, int c, int d, int e) {
    Rec_02094c94 *p = func_02095880(1);
    if (p == 0)
        return 0;
    p->f4 = a;
    p->f8 = b;
    p->fc = c;
    p->f10 = d;
    p->f14 = e;
    return func_02095838(p);
}
