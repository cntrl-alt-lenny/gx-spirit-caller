/* CAMPAIGN-PREP candidate for func_0207deb0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     vtable init: STORE-ORDER four field stores (vtable ptr + 2 args + zero), leaf
 *   risk:       data_020beea4 must be the literal-pool word; store order f0,f4,f8,fc must hold; arg order (r1->f4, r2->f8) preserved; leaf so default .c
 *   confidence: high
 */
/* func_0207deb0 (main, class A, 0x20) — vtable init, four field stores.
 *   ldr ip,=data_020beea4; mov r3,#0; str ip,[r0,#0]; str r1,[r0,#4];
 *   str r2,[r0,#8]; str r3,[r0,#0xc]; bx lr
 * obj->vtable = &data_020beea4; obj->f4 = a1; obj->f8 = a2; obj->fc = 0;
 * STORE ORDER: vtable, f4, f8, fc. Leaf, no frame -> default .c (mwcc 2.0/sp1p5).
 */

extern char data_020beea4[];

typedef struct {
    const void     *vtable;         /* +0x00 */
    void           *f4;             /* +0x04 */
    void           *f8;             /* +0x08 */
    void           *fc;             /* +0x0c */
} obj_0207deb0_t;

void func_0207deb0(obj_0207deb0_t *obj, void *a1, void *a2) {
    obj->vtable = data_020beea4;
    obj->f4 = a1;
    obj->f8 = a2;
    obj->fc = 0;
}
