/* CAMPAIGN-PREP candidate for func_0200bd90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: hold mult/e/t in regs, inline mul, per-block reload pal base
 *   risk:       func_020b3870 result is used post-bl in r1 not r0; if it returns r0 the add/index reg pairing diverges (reshape-able via return-reg model); struct-guessed offsets/stores
 *   confidence: low
 */
/* func_0200bd90 (main, class C) — unrolled mla/mul/blx index gather.
 * r5 = arg0->p80; r4 = r5->ent14 + arg1*0x38 (stride 0x38 entry);
 * r7 = arg2 (multiplier held across all blx); r6 = arg3 (dest).
 * Each block: tmp = blx(arg2 * e->u[..], e->u[..]); v = pal[e->u[..] + tmp];
 * pal base rotates r5->a4 / r5->a8 / r5->ac; stores word or half per asm. */

extern int func_020b3870(int a, int b);

typedef struct {
    unsigned short f0;     /* 0x0 */
    unsigned short m0;     /* 0x2  mul operand */
    unsigned short k0;     /* 0x4  blx arg2 */
    unsigned short a0;     /* 0x6  add operand */
    unsigned short m1;     /* 0x8 */
    unsigned short k1;     /* 0xa */
    unsigned short a1;     /* 0xc */
    unsigned short m2;     /* 0xe */
    unsigned short k2;     /* 0x10 */
    unsigned short a2;     /* 0x12 */
    unsigned short m3;     /* 0x14 */
    unsigned short k3;     /* 0x16 */
    unsigned short a3;     /* 0x18 */
    unsigned short m4;     /* 0x1a */
    unsigned short k4;     /* 0x1c */
    unsigned short a4;     /* 0x1e */
    unsigned short m5;     /* 0x20 */
    unsigned short k5;     /* 0x22 */
    unsigned short a5;     /* 0x24 */
    unsigned short m6;     /* 0x26 */
    unsigned short k6;     /* 0x28 */
    unsigned short a6;     /* 0x2a */
    unsigned short m7;     /* 0x2c */
    unsigned short k7;     /* 0x2e */
    unsigned short a7;     /* 0x30 */
    unsigned short m8;     /* 0x32 */
    unsigned short k8;     /* 0x34 */
    unsigned short a8;     /* 0x36 */
} Ent;

typedef struct {
    int            *pal0;  /* 0x4 */
    int            *pal1;  /* 0x8 */
    int            *pal2;  /* 0xc */
    Ent            *ent;   /* 0x14 */
} Tbl;

typedef struct Dst {
    int   d48;   /* 0x48 */
    int   d4c;   /* 0x4c */
    int   d50;   /* 0x50 */
    short d54;   /* 0x54 */
    short d56;   /* 0x56 */
    short d58;   /* 0x58 */
    short pad5a; /* 0x5a */
    int   d5c;   /* 0x5c */
    int   d60;   /* 0x60 */
} Dst;

typedef struct Root { Tbl *tbl; } Root;  /* tbl @ 0x80 */

void func_0200bd90(Root *root, int idx, int mult, Dst *dst)
{
    Tbl *t = (Tbl *)*(void **)((char *)root + 0x80);
    Ent *e = (Ent *)((char *)t->ent + idx * 0x38);
    int r;

    r = func_020b3870(mult * e->m0, e->k0);
    dst->d48 = t->pal0[e->a0 + r];
    r = func_020b3870(mult * e->m1, e->k1);
    dst->d4c = t->pal0[e->a1 + r];
    r = func_020b3870(mult * e->m2, e->k2);
    dst->d50 = t->pal0[e->a2 + r];
    r = func_020b3870(mult * e->m3, e->k3);
    dst->d54 = (short)t->pal1[e->a3 + r];
    r = func_020b3870(mult * e->m4, e->k4);
    dst->d56 = (short)t->pal1[e->a4 + r];
    r = func_020b3870(mult * e->m5, e->k5);
    dst->d58 = (short)t->pal1[e->a5 + r];
    r = func_020b3870(mult * e->m6, e->k6);
    dst->d5c = t->pal2[e->a6 + r];
    r = func_020b3870(mult * e->m7, e->k7);
    dst->d60 = t->pal2[e->a7 + r];
    r = func_020b3870(mult * e->m8, e->k8);
}
