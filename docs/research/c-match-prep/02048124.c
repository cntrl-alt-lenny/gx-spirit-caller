/* CAMPAIGN-PREP candidate for func_02048124 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch-table + 64-bit subs/sbc elapsed, <<6 across pair, 0xea60 magic compare
 *   risk:       struct-guessed + permuter-class: g->f0/f30/f34/f38 offsets and the func_020930b0/020b3808 64-bit ABI inferred; the subs/sbc + double-word <<6 and the cmp/cmpeq-against-0xea60 long-compare won't reproduce from this C without an explicit 64-bit-intrinsic reshape.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02048124 (main, class D, MED tier).
 * Switch-table dispatch + 64-bit timer subtract. g=*data_0219dc78. Early
 * returns on g==0 and on func_02045280()!=0. switch(g->f4) 0..5: case2 tail
 * func_020479ec(); cases3-5 conditional func_02055fec(); then a 64-bit elapsed
 * compute: (timer - g->{f34,f38}) << 6, passed to func_020b3808, compared
 * against 0xea60, and on >: func_020480b4 + clear g->f30.
 *   recipe: D branch-table; 64-bit subc/sbc elapsed; <<6 across word pair; magic 0xea60 compare
 */
typedef int s32;
typedef unsigned int u32;
typedef long long s64;
typedef unsigned long long u64;

extern unsigned char MSG_1172[];   /* _LIT3 0xffff1172 */
extern s32  func_02045280(void);
extern void func_020479ec(void);
extern void func_02055fec(void);
extern u64  func_020930b0(void);            /* returns 64-bit timer in r0:r1 */
extern u32  func_020b3808(u32 lo, u32 hi);  /* divide/normalize, returns r0:r1 */
extern void func_020480b4(s32 sel, void *msg);

typedef struct {
    s32 f0;     /* +0x00 sub-ptr */
    s32 f4;     /* +0x04 selector */
    unsigned char _pad[0x28];
    s32 f30;    /* +0x30 flag */
    u32 f34;    /* +0x34 timer lo */
    u32 f38;    /* +0x38 timer hi */
} Obj02048124;

extern Obj02048124 *data_0219dc78;

void func_02048124(void)
{
    Obj02048124 *g;
    u64 now, elapsed;
    u32 lo, hi;

    g = data_0219dc78;
    if (g == 0)
        return;
    if (func_02045280() != 0)
        return;

    g = data_0219dc78;
    switch (g->f4) {
    case 2:
        func_020479ec();
        return;
    case 3:
    case 4:
    case 5:
        if (*(s32 *)g->f0 != 0 && **(s32 **)g->f0 != 0)
            func_02055fec();
        break;
    default:   /* 0,1 */
        return;
    }

    if (data_0219dc78->f30 == 0)
        return;

    now = func_020930b0();
    elapsed = now - (((u64)data_0219dc78->f38 << 32) | data_0219dc78->f34);
    lo = (u32)elapsed << 6;
    hi = (u32)((elapsed >> 32) << 6) | ((u32)elapsed >> 0x1a);
    if (func_020b3808(lo, hi) > 0xea60) {
        func_020480b4(6, MSG_1172);
        data_0219dc78->f30 = 0;
    }
}
