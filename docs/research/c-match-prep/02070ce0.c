/* CAMPAIGN-PREP candidate for func_02070ce0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref-chain guard + ==membership + predicated out-copies + field return
 *   risk:       Struct offsets guessed; out1/out2 predication order and the ldrne-into-r0 reuse for f14 may differ; leaf (no frame) so default .c.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02070ce0 (main, class A).
 * UNVERIFIED build-free draft. Drop into src/main/ as a DEFAULT .c
 * (mwcc 2.0/sp1p5): pure leaf, no stack frame / no push, just bx lr.
 *   recipe:     deref-chain guard + type-membership(==4||==0xa) + two
 *               predicated out-param copies (u16 then word) + field return
 */
/* func_02070ce0: data_021a63d0->mgr->obj; if obj && obj->type in {4,0xa}
 * optionally writes *out1=obj->f18 (u16) and *out2=obj->f14, returns
 * obj->f1c; else 0. r0=out1(u16*), r1=out2(int*). */

typedef struct Obj {
    char _pad08[0x8];
    unsigned char  type;   /* +0x8  (ldrb) */
    char _pad14[0x14 - 0x9];
    int            f14;     /* +0x14 (word) */
    unsigned short f18;     /* +0x18 (ldrh) */
    char _pad1c[0x1c - 0x1a];
    int            f1c;     /* +0x1c (word) */
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

int func_02070ce0(unsigned short *out1, int *out2) {
    Obj *obj = data_021a63d0.mgr->obj;
    if (obj == 0)
        return 0;
    if (obj->type == 4 || obj->type == 0xa) {
        if (out1)
            *out1 = obj->f18;
        if (out2)
            *out2 = obj->f14;
        return obj->f1c;
    }
    return 0;
}
