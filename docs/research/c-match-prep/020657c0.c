/* CAMPAIGN-PREP candidate for func_020657c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     gate then alloc o(r4); emit field stores in exact asm order +4,+c,+8,+34,+38,+3c,+0,then zero-inits
 *   risk:       struct-guessed + reshape-able: store sequence must stay +4,+c,+8 then +34/+38/+3c then f0=func() then the zero block (+20,+32,+33,+2c,+30,+24). mwcc may reorder same-value 0 stores; if so reorder C to match. func_02054e8c args (2,2,0) inferred from mov r0/r1=2,r2=0.
 *   confidence: low
 */
// func_020657c0 — main, cls C (constructor: many field inits, store-order)
// r8=a, r7=b, r6=c, r5=d, plus 2 stack args ([sp,#0x18],[sp,#0x1c]).
// gate data_0219e3f0==1 else return 2. alloc via func_02065ee0 -> r4.
// STORE ORDER: +4,+0xc,+8, then +0x38,+0x3c, then func_02054e8c->+0, then 0-inits.
typedef struct Obj Obj;
struct Obj {
    int field_0;   // [+0x00] handle
    int field_4;   // [+0x04] a
    int field_8;   // [+0x08] b
    int field_c;   // [+0x0c] c
    char _10[0x10];
    int field_20;  // [+0x20]
    char _24[0x8];
    int field_24;  // overlaps? declared below
};
/* exact-offset layout: */
struct ObjX {
    int  f0;    // 0x00
    int  f4;    // 0x04
    int  f8;    // 0x08
    int  fc;    // 0x0c
    char _10[0x10];
    int  f20;   // 0x20
    int  f24;   // 0x24
    char _28[4];
    int  f2c;   // 0x2c
    unsigned short f30; // 0x30
    unsigned char  f32; // 0x32
    unsigned char  f33; // 0x33
    int  f34;   // 0x34
    int  f38;   // 0x38
    int  f3c;   // 0x3c
};
extern int data_0219e3f0;
extern int  func_0206588c(void);
extern struct ObjX *func_02065ee0(void);
extern int  func_02054e8c(int kind, int kind2, int zero);
extern void func_02065e78(struct ObjX *o);
extern void func_02065acc(struct ObjX *o);
extern int  func_020657c0(int a, int b, int c, int d, int e, int f);

extern int func_020657c0(int a, int b, int c, int d, int e, int f) {
    struct ObjX *o;
    if (data_0219e3f0 != 1)
        return 2;
    if (func_0206588c() == 0)
        return 3;
    o = func_02065ee0();
    if (o == 0)
        return 1;
    o->f4 = a;
    o->fc = c;
    o->f8 = b;
    o->f34 = d;
    o->f38 = e;
    o->f3c = f;
    o->f0 = func_02054e8c(2, 2, 0);
    o->f20 = 0;
    o->f32 = 0;
    o->f33 = 0;
    o->f2c = 0;
    o->f30 = 0;
    o->f24 = 0;
    if (o->f0 == -1) {
        func_02065e78(o);
        return 2;
    }
    func_02065acc(o);
    return 0;
}
