/* CAMPAIGN-PREP candidate for func_02070e54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref null-guard (void) + flag dispatch to two void tail calls (.legacy.c)
 *   risk:       func_02070ec4 arg (r0=obj leftover) inferred; void-vs-int ambiguous (NULL path leaves r0=0); offsets guessed; sp2p3 routing.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02070e54 (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_02070e54.legacy.c
 * (mwcc 1.2/sp2p3): stmfd{lr}+sub sp,#4 + 2-step (ldmfd{lr}; bx lr) epilogue
 * (also the predicated addeq/ldmeqfd/bxeq early-return) => Style A.
 *   recipe:     deref null-guard (void early-return) + flag branch to one
 *               of two void tail calls
 */
/* func_02070e54: obj = data_021a63d0->mgr->obj; if !obj return;
 * obj->f9 ? func_02074dcc() : func_02070ec4(). */

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
extern void func_02074dcc(void);
extern void func_02070ec4(void *self);

void func_02070e54(void) {
    Obj *obj = data_021a63d0.mgr->obj;
    if (obj == 0)
        return;
    if (obj->f9 != 0)
        func_02074dcc();
    else
        func_02070ec4(obj);
}
