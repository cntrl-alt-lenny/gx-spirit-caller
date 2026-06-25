/* CAMPAIGN-PREP candidate for func_02049554 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store self into global first; reload *data each field; zero via shared ip=#0; exact store order
 *   risk:       asm holds the just-stored self ptr in r4/r1 for a couple of adjacent stores (f8/fc/f10 share r1) but RELOADS lr-base elsewhere; mwcc -O4 will bind the global to one reg and drop ~25 reloads. permuter-class. Also a5 via frame-address is a hack — real signature likely passes a5 as a normal 5th param.
 *   confidence: low
 */
/* func_02049554 (main, class C/D, store-order). data_0219dc80 = a0 first
 * (str r0,[lr]); then zero/seed the struct, RELOADING *data before each store.
 * a5=[sp,#0x8]. Stores in exact asm order: f0=0,f4=a1,f8=0,fc=0,f10=0,
 * f14=a5,f18=a3,b1c..b1f=0,f20=0,f24=0,f28=a2,f2c..f58=0. */

typedef struct State02049554 {
    int  f0; int  f4; int  f8; int  fc;   int f10; int f14; int f18;   /* 0x00..0x18 */
    unsigned char b1c, b1d, b1e, b1f;                                   /* 0x1c..0x1f */
    int  f20; int  f24; int  f28; int  f2c;                             /* 0x20..0x2c */
    int  f30; int  f34; int  f38; int  f3c;                             /* 0x30..0x3c */
    int  f40; int  f44; int  f48; int  f4c;                             /* 0x40..0x4c */
    int  f50; int  f54; int  f58;                                       /* 0x50..0x58 */
} State02049554;

extern State02049554 *data_0219dc80;

void func_02049554(State02049554 *self, int a1, int a2, int a3) {
    int a5 = ((int *)__builtin_frame_address(0))[2]; /* [sp,#0x8] 5th stack arg */
    data_0219dc80 = self;
    self->f0  = 0;
    data_0219dc80->f4  = a1;
    data_0219dc80->f8  = 0;
    data_0219dc80->fc  = 0;
    data_0219dc80->f10 = 0;
    data_0219dc80->f14 = a5;
    data_0219dc80->f18 = a3;
    data_0219dc80->b1c = 0;
    data_0219dc80->b1d = 0;
    data_0219dc80->b1e = 0;
    data_0219dc80->b1f = 0;
    data_0219dc80->f20 = 0;
    data_0219dc80->f24 = 0;
    data_0219dc80->f28 = a2;
    data_0219dc80->f2c = 0;
    data_0219dc80->f30 = 0;
    data_0219dc80->f34 = 0;
    data_0219dc80->f38 = 0;
    data_0219dc80->f3c = 0;
    data_0219dc80->f40 = 0;
    data_0219dc80->f44 = 0;
    data_0219dc80->f48 = 0;
    data_0219dc80->f4c = 0;
    data_0219dc80->f50 = 0;
    data_0219dc80->f54 = 0;
    data_0219dc80->f58 = 0;
}
