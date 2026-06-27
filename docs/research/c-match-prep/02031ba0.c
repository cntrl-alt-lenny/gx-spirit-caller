/* CAMPAIGN-PREP candidate for func_02031ba0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: load r5=f4,r6=f0,r7=f2c early (decl-order); result temp inited 0.
 *   risk:       The early hoist of prev(r5)/node(r6)/f2c(r7) before the conditional blx is liveness-driven; if mwcc loads them lazily after the call the ldr order diverges. reshape-able via decl-order/early-read placement.
 *   confidence: med
 */
/* func_02031ba0: doubly-linked-list unlink with two callbacks + flag tests.
 *   obj->f8 = data_0219adb8[+0x10] (install a fn ptr)
 *   if (obj->fc) result = obj->fc()            ; blx
 *   flags = obj->f2c
 *   if (flags & 0x8000) && result==1: return obj->f4
 *   unlink: prev=obj->f4, node=obj->f0 ; prev->f4=... node->f0=...
 *   if (!(flags & 0x4000) && obj->f8) obj->f8(obj)
 *   return obj->f4
 */

typedef struct { char _pad[0x10]; void *f10; /* +0x10 */ } Mgr_02031ba0;
extern Mgr_02031ba0 data_0219adb8;

typedef int (*cb0_t)(void);
typedef void (*cb1_t)(void *);

struct Node_02031ba0 {
    struct Node_02031ba0 *f0;   /* +0x0 */
    struct Node_02031ba0 *f4;   /* +0x4 */
    void                 *f8;   /* +0x8 */
    cb0_t                 fc;   /* +0xc */
    char                  _pad[0x1c];
    int                   f2c;  /* +0x2c */
};

void *func_02031ba0(struct Node_02031ba0 *obj) {
    struct Node_02031ba0 *prev, *node;
    int flags;
    int result = 0;

    obj->f8 = data_0219adb8.f10;
    if (obj->fc) {
        result = obj->fc();
    }
    prev = obj->f4;
    node = obj->f0;
    flags = obj->f2c;
    if (flags & 0x8000) {
        if (result == 1) return prev;
    }
    node->f4 = prev;
    prev->f0 = node;
    if (!(flags & 0x4000)) {
        if (obj->f8) ((cb1_t)obj->f8)(obj);
    }
    return prev;
}
