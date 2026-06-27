/* CAMPAIGN-PREP candidate for func_021d4a48 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-toggle gate; multi-return lo/hi -> r0,r1; stack out[] marshal then call
 *   risk:       permuter-class: the marshal reorders out+0xc,+0x10,+0x8 into [sp],[sp+4],r3 with r1=0x200,r2=lit — exact arg/stack slot mapping of 0209150c is guessed and reg rotation across the bl is scheduling-sensitive.
 *   confidence: low
 */
/* func_ov004_021d4a48: flag-gated stack-struct marshal from a 2-reg return. a0=self(r4).
 * if (self->f38) { self->f38=0; 0203268c(); r=02033308() (returns lo=r0,hi=r1);
 *   021d3e9c(&out, r.lo, r.hi); marshal out[1],out[2],out[0] into stack + self+0x50,
 *   call 0209150c(self+0x50, 0x200, ?, ?, data_02209fd0). }
 * always: self->mode=0x18; self->f38=1; self->f3c=0. Class C: decl-order from multi-return. */
extern char data_ov004_02209fd0[];
extern int  func_0203268c(void);
extern long long func_02033308(void);
extern void func_02091500c_unused(void);
extern void func_0209150c(void *a, int b, int c, int d, void *e);
extern void func_ov004_021d3e9c(void *out, int lo, int hi);

struct Ov004St3 {
    char  _pad0[0x30];
    int   mode;   /* +0x30 */
    char  _pad34[4];
    int   f38;    /* +0x38 */
    int   f3c;    /* +0x3c */
    char  _pad40[0x50 - 0x40];
    int   slot50; /* +0x50 */
};

void func_ov004_021d4a48(struct Ov004St3 *self) {
    int out[5];
    long long r;

    if (self->f38) {
        self->f38 = 0;
        func_0203268c();
        r = func_02033308();
        func_ov004_021d3e9c(&out[2], (int)r, (int)(r >> 32));
        func_0209150c(&self->slot50, 0x200, out[3], out[4], data_ov004_02209fd0);
    }
    self->mode = 0x18;
    self->f38 = 1;
    self->f3c = 0;
}
