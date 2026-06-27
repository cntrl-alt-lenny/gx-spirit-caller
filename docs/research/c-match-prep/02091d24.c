/* CAMPAIGN-PREP candidate for func_02091d24 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     IRQ-guard; field stores in exact asm order; 2 Fill32; stack guard sentinels
 *   risk:       struct-guessed + permuter-class: func_0209226c gets r1=lo and r2=param1 but the 3rd-arg mapping (which incoming reg feeds it) is inferred; offsets 0x64-0xb0 guessed; the interleaved str/ldr-back-of-x94/x90 ordering may reschedule. Confirm proto + offsets.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02091d24 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: class-D big init store-block rarely first-build-matches.
 *   recipe:     OS-thread/object create; IRQ-guarded; emit the +0x6c..+0xb0 field stores in EXACT asm order; two Fill32 zero-fills; sentinel words at stack ends
 *   risk:       see header below
 * func_02091d24 (OS_CreateThread-shaped). Signature cross-checked vs callers in
 * INDEX.json (r0=self, r1=entry/param1, r2=param2, r3=stackTop, [sp+0x18]=stackSize,
 * [sp+0x1c]=arg). The two stack args are loaded as [sp,#0x18] and [sp,#0x1c].
 *
 *  save = OS_DisableIrq();
 *  pri  = func_02092254();
 *  self->x70 = arg;            // [sp+0x1c]
 *  self->x6c = pri;
 *  self->x64 = 0;  self->x74 = 0;
 *  func_020920bc(self);
 *  self->x94 = stackTop;
 *  self->x90 = stackTop - stackSize;   // [sp+0x18]
 *  self->x98 = 0;
 *  *(u32*)(self->x94 - 4) = 0xfddb597d; // top guard word
 *  *(u32*)(self->x90)     = 0x7bf9dd5b; // bottom guard word
 *  self->xa0 = 0;  self->x9c = self->xa0;
 *  func_0209226c(self, self->x90 /*r1*/, param1 /*r2? see below*/);
 *  self->x4 = param2;
 *  Fill32(0, self->x90 + 4, stackSize - 8);
 *  self->x3c = func_02091cf8;
 *  self->x84 = 0; self->x88 = 0; self->x8c = 0;
 *  func_02091688(self);
 *  self->x78 = 0; self->x80 = 0; self->x7c = self->x80;
 *  Fill32(0, &self->xa4, 0xc);
 *  self->xb0 = 0;
 *  OS_RestoreIrq(save);
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int save);
extern void Fill32(int value, void *dst, unsigned int nbytes);
extern int  func_02092254(void);
extern void func_020920bc(void *self);
extern void func_0209226c(void *self, unsigned int a1, unsigned int a2);
extern void func_02091688(void *self);
extern void func_02091cf8(void);

typedef struct Thread {
    char  pad0[0x4];
    int   x4;            /* 0x04 */
    char  pad8[0x3c - 0x08];
    void *x3c;           /* 0x3c entry */
    char  pad40[0x64 - 0x40];
    int   x64;           /* 0x64 */
    char  pad68[0x6c - 0x68];
    int   x6c;           /* 0x6c priority */
    int   x70;           /* 0x70 arg */
    int   x74;           /* 0x74 */
    int   x78;           /* 0x78 */
    char  pad7c[0x7c - 0x7c];
    int   x7c;           /* 0x7c */
    int   x80;           /* 0x80 */
    int   x84;           /* 0x84 */
    int   x88;           /* 0x88 */
    int   x8c;           /* 0x8c */
    unsigned int x90;    /* 0x90 stack low */
    unsigned int x94;    /* 0x94 stack high */
    int   x98;           /* 0x98 */
    int   x9c;           /* 0x9c */
    int   xa0;           /* 0xa0 */
    char  pada4[0xb0 - 0xa4];
    int   xb0;           /* 0xb0 */
} Thread;

void func_02091d24(Thread *self, unsigned int param1, int param2,
                   unsigned int stackTop, unsigned int stackSize, int arg) {
    int save;
    int pri;
    unsigned int lo;

    save = OS_DisableIrq();
    pri = func_02092254();
    self->x70 = arg;
    self->x6c = pri;
    self->x64 = 0;
    self->x74 = 0;
    func_020920bc(self);
    self->x94 = stackTop;
    lo = stackTop - stackSize;
    self->x90 = lo;
    self->x98 = 0;
    *(unsigned int *)(self->x94 - 4) = 0xfddb597d;
    *(unsigned int *)(self->x90) = 0x7bf9dd5b;
    self->xa0 = 0;
    self->x9c = self->xa0;
    func_0209226c(self, lo, param1);
    self->x4 = param2;
    Fill32(0, (void *)(lo + 4), stackSize - 8);
    self->x3c = (void *)func_02091cf8;
    self->x84 = 0;
    self->x88 = 0;
    self->x8c = 0;
    func_02091688(self);
    self->x78 = 0;
    self->x80 = 0;
    self->x7c = self->x80;
    Fill32(0, &self->xa4, 0xc);
    self->xb0 = 0;
    OS_RestoreIrq(save);
}
