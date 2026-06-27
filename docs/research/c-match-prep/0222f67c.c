/* CAMPAIGN-PREP candidate for func_0222f67c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lsl/lsr->bitfield 2-word decode; reload f2&1 parity per call; r5<<16>>16
 *   risk:       reshape-able (bind/reload): orig RELOADS e->f2 and re-derives parity at each call site (not bound) — written inline to match; the two-word PackW decode (hi8 from first afb74, b13 from second) is the codegen-sensitive combine that may need operand reorder.
 *   confidence: med
 */
/* func_ov002_0222f67c (ov002, D) state machine (0x7e/0x7f/0x80) on g[0x5a8].
 * Entity *e in r0; e->f0(+0),e->f2(+2) halfwords. parity=(f2&1) is the leading
 * arg to most helpers. Case0x80: 0225368c gate -> 021ae400(parity,0x5e) -> 0x7f.
 * Case0x7f: 021af9d0(parity,f0,6,0) -> 0x7e. Case0x7e: two 021afb74() calls, decode
 * a packed pair into r5 = 2*((a>>22)&0xff)+((b>>13)&1) [coord-decode on TWO words],
 * then 021e1aec(parity,r5,0), 021e276c(parity,f0,r5<<16>>16,0x41), 021e286c(parity). */
typedef union { unsigned u; struct { unsigned lo13:13; unsigned b13:1; unsigned mid8:8; unsigned hi8:8; unsigned top2:2; } b; } PackW;
typedef struct { unsigned short f0; unsigned short f2; } Ent;
struct GState { char pad[0x5a8]; int state; };
extern struct GState data_ov002_022ce288;
extern void func_ov002_021ae400(int p,int a);
extern void func_ov002_021af9d0(int p,int f0,int b,int c);
extern unsigned *func_ov002_021afb74(void);
extern void func_ov002_021e1aec(int p,int a,int b);
extern void func_ov002_021e276c(int p,int f0,int b,int c);
extern void func_ov002_021e286c(int p);
extern int  func_ov002_0225368c(int p,int f0,int b);
int func_ov002_0222f67c(Ent *e) {
    int st = data_ov002_022ce288.state;
    if (st == 0x7e) {
        unsigned *p5 = func_ov002_021afb74();
        unsigned a = *func_ov002_021afb74();
        unsigned b = *p5;
        PackW pa; pa.u = a;
        PackW pb; pb.u = b;
        int r5 = (pa.b.hi8 << 1) + pb.b.b13;
        int parity = (e->f2 << 31) >> 31;
        func_ov002_021e1aec(parity, r5, 0);
        func_ov002_021e276c((int)((e->f2 << 31) >> 31), (int)e->f0, (int)((r5 << 16) >> 16), 0x41);
        func_ov002_021e286c((int)((e->f2 << 31) >> 31));
        return 0;
    }
    if (st == 0x7f) {
        func_ov002_021af9d0((int)((e->f2 << 31) >> 31), (int)e->f0, 6, 0);
        return 0x7e;
    }
    if (st != 0x80) return 0;
    if (func_ov002_0225368c((int)((e->f2 << 31) >> 31), (int)e->f0, 0) == 0) return 0;
    func_ov002_021ae400((int)((e->f2 << 31) >> 31), 0x5e);
    return 0x7f;
}
