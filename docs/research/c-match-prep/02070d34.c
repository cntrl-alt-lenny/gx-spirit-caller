/* CAMPAIGN-PREP candidate for func_02070d34 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref null-guard + flag dispatch to two tail calls (Style A .legacy.c)
 *   risk:       Struct offsets guessed; .legacy.c routing required (sp2p3); both callees assumed int-returning no-arg tails.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02070d34 (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_02070d34.legacy.c
 * (mwcc 1.2/sp2p3): orig prologue stmfd{lr}+sub sp,#4, 2-step epilogue
 * (ldmfd{lr}; bx lr) => Style A => .legacy.c.
 *   recipe:     deref-chain null-guard + flag branch to one of two
 *               tail calls; NULL path returns 1
 */
/* func_02070d34: obj = data_021a63d0->mgr->obj; if !obj return 1;
 * return obj->f9 ? func_02074c74() : func_02070d90(). */

typedef struct Obj {
    char _pad09[0x9];
    unsigned char f9;       /* +0x9 (ldrb) */
} Obj;

typedef struct Mgr {
    char _pad_a4[0xa4];
    Obj *obj;               /* +0xa4 */
} Mgr;

typedef struct Root {
    char _pad04[0x4];
    Mgr *mgr;               /* +0x4 */
} Root;

extern Root data_021a63d0;
extern int func_02074c74(void);
extern int func_02070d90(void);

int func_02070d34(void) {
    Obj *obj = data_021a63d0.mgr->obj;
    if (obj == 0)
        return 1;
    if (obj->f9 != 0)
        return func_02074c74();
    return func_02070d90();
}
