/* CAMPAIGN-PREP candidate for func_0207db44 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list walk, RELOAD cur each iter, field stores, leaf
 *   risk:       the in-loop p->cur reload may be hoisted/CSE'd by mwcc; node next/store offsets (+0x8/+0xc) and mgr (+0x24) guessed; return value typing
 *   confidence: med
 */
/* func_0207db44 (main, class A, 0x30) — simple linked-list walk.
 *   add r2,r0,#0x24; ldr r3,[r2,#8]; cmp r3,#0; beq .L_68;
 * .L_54: ldr r1,[r0,#0x1c]; str r1,[r3,#8]; ldr r3,[r3,#0xc]; cmp r3,#0; bne .L_54;
 * .L_68: ldr r0,[r0,#0x1c]; str r0,[r2,#4]; bx lr
 * for (n = mgr.head; n; n = n->next) n->f8 = p->cur;  mgr.f4 = p->cur; return cur.
 * NOTE p->cur is RELOADED inside the loop -> reference p->cur in the loop body
 * (don't lift to a local) to keep the per-iteration ldr.
 * Leaf, no frame -> default .c (mwcc 2.0/sp1p5).
 */

typedef struct node_0207db44 {
    char                    _pad_00[0x8];
    void                   *f8;         /* +0x08 written with cur */
    struct node_0207db44   *next;       /* +0x0c */
} node_0207db44_t;

typedef struct {
    void           *f0;             /* +0x24 */
    void           *f4;             /* +0x28 written with cur */
    node_0207db44_t *head;          /* +0x2c list head */
} mgr_0207db44_t;

typedef struct {
    char            _pad_00[0x1c];
    void           *cur;            /* +0x1c */
    mgr_0207db44_t  mgr;            /* +0x24 */
} obj_0207db44_t;

void *func_0207db44(obj_0207db44_t *p) {
    node_0207db44_t *n = p->mgr.head;
    while (n != 0) {
        n->f8 = p->cur;
        n = n->next;
    }
    p->mgr.f4 = p->cur;
    return p->cur;
}
