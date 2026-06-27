/* CAMPAIGN-PREP candidate for func_0222ec50 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mla parity*0x868 base+0x120+r4*4; movs r4 sign-guard; reload f2 each call
 *   risk:       reshape-able (bind/reload): orig RE-LOADS e->f2 and re-derives the 1-bit parity at each guard call (mov;mov per call) — if mwcc CSEs it to one reg the four sites diverge; counter by re-reading e->f2 inline (as written).
 *   confidence: med
 */
/* func_ov002_0222ec50 (ov002, D) guard-return chain then single struct write.
 * Entity *e in r0; e->f0(+0),e->f2(+2),e->f4(+4) halfwords. Four guard calls each
 * gated 'return 0 if 0/neg'; r4 holds first call's result across the chain.
 * Final target = data_022cf16c + 0x868*parity + 0x120 + 4*r4 (mla base, +0x120,
 * +r4<<2) passed to 0227adb8(target, 1, f0<<16, ...). _LIT1=0x868 (parity stride). */
typedef struct { unsigned short f0; unsigned short f2; unsigned short f4; } Ent;
extern unsigned char data_ov002_022cf16c[];
extern int  func_ov002_021b9aa8(int a,int b);
extern int  func_ov002_021bc618(int a);
extern int  func_ov002_021ca2b8(int a);
extern int  func_ov002_021ca3f0(int a,int b);
extern void func_ov002_0227adb8(void *p,int b,int c,int d);
int func_ov002_0222ec50(Ent *e) {
    int r4;
    unsigned parity = (e->f2 << 31) >> 31;
    r4 = func_ov002_021b9aa8((int)((e->f2 << 31) >> 31), (int)((e->f4 << 17) >> 23));
    if (r4 < 0) return 0;
    if (func_ov002_021bc618((int)((e->f2 << 31) >> 31)) == 0) return 0;
    if (func_ov002_021ca2b8((int)((e->f2 << 31) >> 31)) == 0) return 0;
    if (func_ov002_021ca3f0((int)((e->f2 << 31) >> 31), (int)e->f0) == 0) return 0;
    {
        unsigned char *p = data_ov002_022cf16c + (parity & 1) * 0x868 + 0x120 + (r4 << 2);
        func_ov002_0227adb8(p, 1, (int)(e->f0 << 16), 0);
    }
    return 0;
}
