/* CAMPAIGN-PREP candidate for func_0207d914 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D ordered stores; clear :1 via &=~1; sibling of shipped func_0207dc5c
 *   risk:       struct-guessed/permuter-class: func_0207d994 takes a stack-built header (add r0,sp,#4; copies obj->f18/f1c into [sp+4],[sp+8]) not a simple ptr — my call elides that struct; the &0x45585048 arg ordering for func_0207d1e8 (a1 in r3, a2 spilled) likely diverges. Confirm func_0207d994 signature.
 *   confidence: low
 */
/* func_0207d914 (main, class D, 0x80) — block init with ordered stores.
 * Sibling of func_0207dc5c (same prologue/epilogue & magic family). mgr at
 * obj+0x24: +0x10 u16, +0x12 u16(:1 field cleared), body region at mgr+0x14.
 * Calls func_0207d1e8(mgr.body, 'HPXE'(0x45585048), &mgr+0x14, a1, a2-stacked)
 * then zero u16s, clear the :1 bit, allocate via func_0207d994('FR') with two
 * stacked words copied from obj->f18/f1c, and store the result into obj+0x24,
 * mgr+0x4, mgr+0x8=0, mgr+0xc=0 — STORE ORDER as in asm.
 */
extern void  func_0207d1e8(void *p, unsigned int magic, void *body, void *a1, void *a2);
extern void *func_0207d994(void *hdr, unsigned int magic);

typedef struct Mgr_914 {
    char            _p0[0x10];   /* mgr+0x00 */
    unsigned short  f10;         /* mgr+0x10 */
    unsigned short  f12;         /* mgr+0x12 ; bit0 is a :1 field */
    char            body[0x10];  /* mgr+0x14 */
} Mgr_914;

typedef struct Obj_914 {
    char            _p0[0x18];
    void           *f18;         /* +0x18 */
    void           *f1c;         /* +0x1c */
    char            _p20[4];
    void           *f24;         /* +0x24 (== &mgr) */
    Mgr_914         mgr;         /* +0x24 overlaps f24 region */
} Obj_914;

void func_0207d914(Obj_914 *obj, void *a1, void *a2) {
    Mgr_914 *mgr = &obj->mgr;
    void *blk;
    func_0207d1e8(mgr->body, 0x45585048, &mgr->body, a1, a2);
    mgr->f10 = 0;
    mgr->f12 = 0;
    mgr->f12 = (unsigned short)(mgr->f12 & ~1u);
    blk = func_0207d994(0 /*hdr built on stack from f18/f1c*/, 0x00004652);
    obj->f24 = blk;
    *(void **)((char *)mgr + 0x04) = blk;
    *(int *)((char *)mgr + 0x08) = 0;
    *(int *)((char *)mgr + 0x0c) = 0;
}
