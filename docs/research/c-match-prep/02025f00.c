/* CAMPAIGN-PREP candidate for func_02025f00 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: local 0x3c struct, Fill32 memset; store-order fills; flag tests->mvnne -1; conditional call + MMIO orr 0x400
 *   risk:       permuter-class: the loc field stores ([sp]+4, 0x24, 0x28, 0x30, 0x34) are emitted interleaved with the two flag-test ladders in orig; mwcc may reorder the str sequence vs the cmp ladder. The combined `f24<0 && f28<0` early-out maps to cmp;cmplt;blt. struct-guessed: 0x3c frame field offsets and Obj +0x7c/0x80/0x90 all inferred.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02025f00 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: local 0x3c out-struct, Fill32(0,&loc,0x3c); store-order field fills; two sign/flag tests (blt + tst -> mvnne -1); conditional func + MMIO orr 0x400.
 */
extern void Fill32(int value, void *dst, int size);
extern void func_02022b74(void *out);
extern void func_02025fd0(void);                 /* stored as fn-ptr field */
extern void func_020aadf8(void *dst, int src);

typedef struct {                                  /* 0x3c local frame struct */
    int f00;          /* +0x00 */
    int f04;          /* +0x04 (func_020aadf8 writes here) */
    char _a[0x24 - 0x08];
    int f24;          /* +0x24 */
    int f28;          /* +0x28 */
    char _b[0x30 - 0x2c];
    void (*f30)(void);/* +0x30 */
    int f34;          /* +0x34 */
    char _c[0x3c - 0x38];
} Loc25f00;

typedef struct {
    char _a[0x74];
    int  f74;         /* +0x74 */
    char _b[0x7c - 0x78];
    int  f7c;         /* +0x7c */
    int  f80;         /* +0x80 */
    char _c[0x90 - 0x84];
    int  f90;         /* +0x90 flags */
    char _d[0x16a - 0x94];
    unsigned short h_16a; /* +0x16a (r4+0x100, [+0x6a]) */
} Obj25f00;

int func_02025f00(int obj) {
    Obj25f00 *o = (Obj25f00 *)obj;
    Loc25f00 loc;
    int t1, t2;

    if (o->f74 == 0)                              /* ldr [r4,#0x74]; beq */
        return 1;

    Fill32(0, &loc, 0x3c);
    loc.f00 = 0;                                  /* str r0,[sp] */
    func_020aadf8(&loc.f04, o->f74);              /* add r0,sp,#4 */

    t1 = 1;                                       /* mov r1,#1 */
    if (o->f7c >= 0 && (o->f90 & 1) == 0)         /* blt skip; tst -> moveq r1,#0 */
        t1 = 0;
    loc.f24 = (t1 != 0) ? -1 : o->f7c;            /* cmp r1,#0; mvnne r2,#0; str [sp,#0x24] */

    t2 = 1;
    if (o->f80 >= 0 && (o->f90 & 2) == 0)
        t2 = 0;
    loc.f28 = (t2 != 0) ? -1 : o->f80;            /* str [sp,#0x28] */
    loc.f30 = func_02025fd0;                      /* _LIT0 fn-ptr -> [sp,#0x30] */
    loc.f34 = obj;                                /* str r4,[sp,#0x34] */

    if (loc.f24 < 0 && loc.f28 < 0)               /* cmp #0; cmplt r2,#0; blt .L_6fc */
        return 1;

    func_02022b74(&loc);                          /* add r0,sp,#0 */
    o->h_16a |= 0x400;                            /* orr #0x400; strh [r4+0x100,#0x6a] */
    return 1;
}
