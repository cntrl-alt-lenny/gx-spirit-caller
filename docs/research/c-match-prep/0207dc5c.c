/* CAMPAIGN-PREP candidate for func_0207dc5c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init: 5-arg call (a1 kept in r3, a2 spilled) then STORE-ORDER field inits, sp3 frame
 *   risk:       ROUTE AS *.legacy_sp3.c. func_0207d1e8 arg count/order (r3=a1, stack=a2) may differ; store order f0,f4,f8 must hold; magic literal 0x46524d48; return p (mov r0,r5)
 *   confidence: med
 */
/* func_0207dc5c (main, class A, 0x4c) — init: memcpy-like call then field stores.
 *   push {r4,r5,lr}; sub sp,#4; mov r5,r0; mov r3,r1; add r4,r5,#0x24;
 *   str r2,[sp]; ldr r1,=0x46524d48; add r2,r4,#0xc; bl func_0207d1e8;
 *   ldr r0,[r5,#0x18]; mov r1,#0; str r0,[r5,#0x24]; ldr r2,[r5,#0x1c];
 *   mov r0,r5; str r2,[r4,#4]; str r1,[r4,#8]; pop {r4,r5,pc}
 * func_0207d1e8(p, 0x46524d48 ('FRMH'), &mgr.body, a1, a2);  // a1 in r3, a2 spilled
 * then mgr.f0 = p->f18; mgr.f4 = p->cur; mgr.f8 = 0;  (STORE ORDER), return p.
 * 3 saved regs + sub sp #4 + pop {regs,pc} == sp3 -> *.legacy_sp3.c (mwcc 1.2/sp3).
 */

typedef struct {
    void           *f0;             /* +0x24 */
    void           *f4;             /* +0x28 */
    void           *f8;             /* +0x2c */
    char            body[0x4];      /* +0x30 (= mgr+0xc), passed by address */
} mgr_0207dc5c_t;

typedef struct {
    char            _pad_00[0x18];
    void           *f18;            /* +0x18 */
    void           *cur;            /* +0x1c */
    char            _pad_20[0x4];
    mgr_0207dc5c_t  mgr;            /* +0x24 */
} obj_0207dc5c_t;

extern void func_0207d1e8(void *p, unsigned int magic, void *body, void *a1, void *a2);

obj_0207dc5c_t *func_0207dc5c(obj_0207dc5c_t *p, void *a1, void *a2) {
    func_0207d1e8(p, 0x46524d48, &p->mgr.body, a1, a2);
    p->mgr.f0 = p->f18;
    p->mgr.f4 = p->cur;
    p->mgr.f8 = 0;
    return p;
}
