/* CAMPAIGN-PREP candidate for func_02032724 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested-struct base bind + guard + free + clear
 *   risk:       func_02032e6c may be 1-arg (r1 leftover); arg2 may reload instead of reusing cmp reg
 *   confidence: med
 */
/* func_02032724 — free + clear a nested resource pointer */

typedef struct {
    unsigned char _pad_00[0xc80];
    void *res;            /* +0xc80 within sub */
} Sub_02032724;

typedef struct {
    unsigned char _pad_00[0x1fc];
    Sub_02032724 sub;     /* +0x1fc */
} Obj_02032724;

extern void func_02032e6c(Obj_02032724 *p, void *res);

void func_02032724(Obj_02032724 *p)
{
    if (p->sub.res) {
        func_02032e6c(p, p->sub.res);
        p->sub.res = 0;
    }
}
