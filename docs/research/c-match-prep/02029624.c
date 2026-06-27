/* CAMPAIGN-PREP candidate for func_02029624 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack-struct Fill32 init; decl-order arg-then-base; explicit ordered frame stores
 *   risk:       reshape-able: the 0x3c stack-frame field store ORDER (0x2c,0x24,0x28,0x30,0x34) must emit exactly as written; mwcc may reorder → reorder C stores. Also f0c<0 && f10<0 guard.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02029624 (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     stack-struct Fill32 init; decl-order r5(arg) r4(base+0x90); store-order on stack frame
 *   risk:       stack-local field store ORDER into the 0x3c frame for func_02022b74
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;

extern void Fill32(int value, void *dst, int size);
extern void func_02022b74(void *frame);
extern void func_020296b8(void);
extern void func_020aadf8(void *dst, void *src);

typedef struct Sub90 {
    char _pad0[0xc];
    int   f0c;        /* +0x9c overall */
    s16   f10;        /* +0xa0 overall */
} Sub90;

typedef struct Obj29624 {
    char  _pad0[0x68];
    void *f68;            /* 0x68 guarded ptr */
    char  _pad1[0x90 - 0x6c];
    Sub90 sub90;         /* 0x90 */
    char  _pad2[0x100 - (0x90 + 0x14)];
    char  blk100[0x9c];  /* 0x100 sub-struct; +0x9a u16 flags */
} Obj29624;

/* mirrors the 0x3c stack frame passed to func_02022b74/func_020aadf8 */
typedef struct Frame29624 {
    int    f00;        /* =2 */
    char   blk04[0x28 - 0x04];  /* filled by func_020aadf8(&f04, p->f68) */
    Sub90 *f2c;        /* = &p->sub90 */
    int    f24_pre;    /* placeholder, see store order below */
} Frame29624;

int func_02029624(Obj29624 *p) {
    Sub90 *sub;
    int frame[0x3c / 4];
    int v0c;
    s16 v10;

    sub = &p->sub90;
    if (p->f68 == 0)
        return 1;

    Fill32(0, frame, 0x3c);
    frame[0] = 2;                                  /* str #2 [sp] */
    func_020aadf8((char *)frame + 4, p->f68);      /* &frame[1], p->f68 */

    frame[0x2c / 4] = (int)sub;                    /* str r4 [sp,#0x2c] */
    v0c = sub->f0c;                                /* ldr [r4,#0xc] */
    frame[0x24 / 4] = v0c;                         /* str [sp,#0x24] */
    v10 = sub->f10;                                /* ldrsh [r4,#0x10] */
    frame[0x28 / 4] = v10;                         /* str [sp,#0x28] */
    frame[0x30 / 4] = (int)func_020296b8;          /* str _LIT0 [sp,#0x30] */
    frame[0x34 / 4] = (int)p;                      /* str r5 [sp,#0x34] */

    if (v0c < 0 && v10 < 0)                        /* cmp/cmplt/blt */
        return 1;

    func_02022b74(frame);
    *(u16 *)(p->blk100 + 0x9a) |= 0x40;            /* add r5,#0x100; orr #0x40 */
    return 1;
}
